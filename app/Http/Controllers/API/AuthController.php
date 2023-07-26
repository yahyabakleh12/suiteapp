<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Models\building;
use Illuminate\Http\Request;
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
use Illuminate\Validation\Rules\Password;

class AuthController extends Controller
{

    public function throttleKey()
    {
        return Str::lower(request('email')) . '|' . request()->ip();
    }
    public function checkTooManyFailedAttempts()
    {
        if (!RateLimiter::tooManyAttempts($this->throttleKey(), 5)) {
            return;
        }
        throw new Exception('IP address banned. Too many login attempts.');
    }
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|max:191',
            'password' => [
                'required',
            ],
            'device_key' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $this->checkTooManyFailedAttempts();

            $user = User::where('email', $request->email)->first();

            if (!$user || !Hash::check($request->password, $user->password)) {
                RateLimiter::hit($this->throttleKey(), $seconds = 3600);
                return response()->json([
                    'status' => 501,
                    'message' => 'Invalid credentials'
                ]);
            } else {
                try {
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
                            //send otp message code goes here
                            $ch = curl_init();
                            $timeout = 5;
                            $text = 'Your suitelife OTP is :'.$pin.' please DO NOT share it with anyone ';
                            $url = 'https://meapi.goinfinito.me/unified/v2/send?clientid=valtransv5ftyv0jbasz0us3&clientpassword=ii6d98m6kl87jbeyogp6kg5em42z4t1u&from=PARKONIC&to=+971'.$user->phone.'&text='.$text;
                            curl_setopt($ch, CURLOPT_URL, $url);
                            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
                            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
                            curl_setopt($ch, CURLOPT_HEADER, false);
                            curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
                            
                            return response()->json([
                                'status' => 201,
                                'message' => 'please verify your access'
                            ]);
                        } else {
                            DB::table('two_step_verification')
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
                            //send otp message code goes here
                            return response()->json([
                                'status' => 201,
                                'message' => 'please verify your access'
                            ]);
                        }
                    } else {
                        if ($user->building_id == null) {
                            $set_building = false;
                        } else {
                            $bilding = building::where('id', $user->building_id)->first();

                            if ($bilding->parkonic_residantial != 0) {
                                $set_building = true;
                            } else {
                                $set_building = false;
                            }
                        }

                        $ability = array('user');
                        $token = $user->createToken($user->email . '_Token', $ability)->plainTextToken;
                        $user->update([
                            'device_key' => $request->device_key,
                        ]);

                        RateLimiter::clear($this->throttleKey());
                        return response()->json([
                            'status' => 200,
                            'token' => $token,
                            'user' => $user,
                            'parkonic_residantial' => $set_building,
                            'message' => 'Logged In successfully'
                        ]);
                    }
                } catch (Exception $error) {
                    return response()->json([
                        'status' => 500,
                        'message' => 'login error',
                        'error' => $error,
                    ]);
                }
            }
        }
    }
    public function two_factory_auth(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'pin' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $user = User::where('email', $request->email)->first();

            $verify_login = DB::table('two_step_verification')
                ->where([
                    'phone' => $user->phone,
                    'pin' => $request->pin
                ])
                ->first();

            if (!$verify_login) {
                return response()->json([
                    'status' => 203,
                    'error' => 'Invalid pin!'
                ]);
            } else {
                $user = User::Where('phone', $user->phone)->first();
                $bilding = building::where('id', $user->building_id)->first();
                if ($bilding->parkonic_residantial != 0) {
                    $set_building = true;
                } else {
                    $set_building = false;
                }
                $ability = array('user');
                $token = $user->createToken($user->email . '_Token', $ability)->plainTextToken;
                RateLimiter::clear($this->throttleKey());
                DB::table('two_step_verification')
                ->where([
                    'phone' => $user->phone,
                    'pin' => $request->pin
                ])->delete();
                return response()->json([
                    'status' => 200,
                    'token' => $token,
                    'parkonic_residantial' => $set_building,
                    'message' => 'Logged In successfully'
                ]);
                // return response()->json([
                //     'status' => 200,
                //     'message' => 'Login Has Been Verified'
                // ]);
            }
        }
    }
    public function register(Request $request)
    {
        return $request;
        $rules = [
            'name' => 'required|max:191',
            'phone' => 'required|max:10|unique:users',
            'appartment_number' => 'required',
            'email' => 'required|max:191|unique:users',
            'password' => [
                'required',
                Password::min(8)
                    ->letters()
                    ->mixedCase()
                    ->numbers()
                    ->symbols(),
                'confirmed'
            ],
            'two_step' => 'required',
            'agree' => 'required',
            'building_id' => 'required',


        ];
        if ($request->building_id == 0) {
            $rules['address'] = 'required';
        }

        $validator = Validator::make($request->all(), $rules);


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


            $createUser = User::create([
                'name' => $request->name,
                'phone' => $request->phone,
                'appartment_number' => $request->appartment_number,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'two_step' => $two_step,
                'agree' => $agree,

                'building_id' => $request->building_id,

            ]);


            $token = Str::random(64);

            UserVerify::create([
                'user_id' => $createUser->id,
                'token' => $token
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Your Account Has Been Created Successfully',
                'user'=>$createUser
            ]);
        }
    }

    public function verifyAccount($token)
    {
        $verifyUser = UserVerify::where('token', $token)->first();
        if (!is_null($verifyUser)) {
            $user = $verifyUser->user;

            if (!$user->is_email_verified) {
                $verifyUser->user->is_email_verified = 1;
                $verifyUser->user->save();
                $message = "Your e-mail is verified. You can now login.";
                return response()->json([
                    'status' => 200,
                    'message' => $message
                ]);
            } else {
                $message = "Your e-mail is already verified. You can now login.";
                return response()->json([
                    'status' => 200,
                    'message' => $message
                ]);
            }
        } else {
            $message = 'Sorry your email cannot be identified.';
            return response()->json([
                'status' => 403,
                'message' => $message
            ]);
        }
    }
    public function logout()
    {
        $access_token = DB::table('personal_access_tokens')
            ->where([
                'tokenable_id' => auth()->user()->id,
            ])
            ->first();
        if (!$access_token) {
            return response()->json([
                'status' => 404,
                'error' => 'Already Logged Out'
            ]);
        } else {
            DB::table('personal_access_tokens')
                ->where([
                    'tokenable_id' => auth()->user()->id,
                ])
                ->delete();
            return response()->json([
                'status' => 200,
                'message' => 'You Have Been Logged Out Successfuly'
            ]);
        }
    }
    public function unauthanticated()
    {
        return response()->json([
            'status' => 401,
            'error' => 'Unauthrized Access !'
        ]);
    }
    public function register_face(Request $request){
         $validator = Validator::make($request->all(), [
            'userid' => 'required',
            'face' => 'required'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $user = User::findOrFail($request->userid);
            $user->update([
                'face'=>$request->face
                ]);
                 return response()->json([
                'status' => 200,
                'message' => $request->face
            ]);
        }
    }
    public function get_users_faces($id){
        try{
        $data = User::where('building_id',$id)->where('face','!=',null)->get();
        return $data;
        }catch(Exception $error){
            
        }
    }
}
