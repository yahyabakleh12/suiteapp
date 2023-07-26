<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\UserVerify;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Symfony\Contracts\Service\Attribute\Required;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Monolog\DateTimeImmutable;
use Illuminate\Support\Facades\RateLimiter;
use Exception;
use Termwind\Components\Dd;

class AuthController extends Controller
{
    public function unauthrized()
    {
        return view('errors.401');
    }
    public function login_post()
    {
        return view('auth.login');
    }
    public function throttleKey()
    {
        return Str::lower(request('email')) . '|' . request()->ip();
    }
    public function checkTooManyFailedAttempts()
    {
        if (!RateLimiter::tooManyAttempts($this->throttleKey(), 3)) {
            return;
        }
        throw new Exception('IP address banned. Too many login attempts.');
    }
    public function login(Request $request)
    {
        try {
           
            $validator = Validator::make($request->all(), [
                'email' => 'required|max:191',
                'password' => 'required|min:8'
            ]);
     
            if ($validator->fails()) {
                RateLimiter::hit($this->throttleKey(), $seconds = 3600);
                $request->validate([
                    'email' => 'required|max:191',
                    'password' => 'required|min:8'
                ]);
                
            } else {
                
                $user = User::where('email', $request->email)->first();

                if (!$user || !Hash::check($request->password, $user->password)) {
                    RateLimiter::hit($this->throttleKey(), $seconds = 3600);
                    return redirect()->back()->withInput($request->only('email', 'remember'))->withErrors([
                        'email' => 'credentials does not match our recoreds',
                    ]);
                } else {
                    if ($user->two_step == 1) {

                        $old_pin = DB::table('two_step_verification')
                            ->where([
                                'phone' => $user->phone,
                            ])
                            ->first();
                        if (!$old_pin) {
                            $pin = rand(1000, 9999);
                            DB::table('two_step_verification')->insert([
                                'phone' => $user->phone,
                                'pin' => $pin,
                                'created_at' => Carbon::now()
                            ]);
                            $phone = $user->phone;
                            $newstring = substr($phone, -4);
                            //send otp message code goes here
                            return view('auth.two-step-verification', ['phone' => $newstring]);
                        } else {
                            $tt = DB::table('two_step_verification')
                                ->where([
                                    'phone' => $user->phone,
                                ])
                                ->delete();
                            $pin = rand(1000, 9999);
                            DB::table('two_step_verification')->insert([
                                'phone' => $user->phone,
                                'pin' => $pin,
                                'created_at' => Carbon::now()
                            ]);
                            $phone = $user->phone;
                            $newstring = substr($phone, -4);
                            //send otp message code goes here
                            return view('auth.two-step-verification', ['phone' => $newstring]);
                        }
                    } else {
                        if ($user->building_id != 0) {
                            $set_building = true;
                        } else {
                            $set_building = false;
                        }
                        $ability = array('user');
                        $token = $user->createToken($user->email . '_Token', $ability)->plainTextToken;
                        RateLimiter::clear($this->throttleKey());
                        return response()->json([
                            'status' => 200,
                            'token' => $token,
                            'set_building' => $set_building,
                            'message' => 'Logged In successfully'
                        ]);
                    }
                }
            }
        } catch (\Exception  $error) {
            return redirect(route('unauthrized'));
        }
    }
    public function two_factory_auth(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'digit1' => 'required',
            'digit2' => 'required',
            'digit3' => 'required',
            'digit4' => 'required',
        ]);
        
        if ($validator->fails()) {
            $request->validate([
            'digit1' => 'required',
            'digit2' => 'required',
            'digit3' => 'required',
            'digit4' => 'required',
            ]);
        } else {
            $verify_login = DB::table('two_step_verification')
                ->where([
                    'phone' => $request->phone,
                    'pin' => $request->pin
                ])
                ->first();

            if (!$verify_login) {
                return response()->json([
                    'status' => 203,
                    'error' => 'Invalid pin!'
                ]);
            } else {
                $user = User::Where('phone', $request->phone)->first();
                if ($user->building_id != 0) {
                    $set_building = true;
                } else {
                    $set_building = false;
                }
                $ability = array('user');
                $token = $user->createToken($user->email . '_Token', $ability)->plainTextToken;
                RateLimiter::clear($this->throttleKey());
                return response()->json([
                    'status' => 200,
                    'token' => $token,
                    'set_building' => $set_building,
                    'message' => 'Logged In successfully'
                ]);
                // return response()->json([
                //     'status' => 200,
                //     'message' => 'Login Has Been Verified'
                // ]);
            }
        }
    }
    public function show_register(){
        return view('auth.register');
    }
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:191',
            'phone' => 'required|max:10|unique:users',
            'appartment_number' => 'required',
            'email' => 'required|max:191|unique:users',
            'password' => 'required|min:8|confirmed',
            'two_step' => 'required',
            'agree' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $two_step = 0;
            $agree = 0;
            if ($request->two_step == "true") {
                $two_step = 1;
            }
            if ($request->agree == "true") {
                $agree = 1;
            }
            $building_id = 0;
            $createUser = User::create([
                'name' => $request->name,
                'phone' => $request->phone,
                'appartment_number' => $request->appartment_number,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'building_id' => $building_id,
                'two_step' => $two_step,
                'agree' => $agree
            ]);
            $token = Str::random(64);

            UserVerify::create([
                'user_id' => $createUser->id,
                'token' => $token
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Your Account Has Been Created Successfully'
            ]);
        }
    }
}
