<?php

namespace App\Http\Controllers\API\staff;

use App\Http\Controllers\Controller;
use App\Models\staff;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
class ForgetPasswordController extends Controller
{
    public function submitForgetPasswordForm(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:staff',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'=>501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {

            $old = DB::table('staff_password_resets')
                ->where([
                    'email' => $request->email,
                ])
                ->first();
                if(!$old){
                    $pin = rand(1000, 9999);

                    DB::table('staff_password_resets')->insert([
                        'email' => $request->email,
                        'pin' => $pin,
                        'created_at' => Carbon::now()
                    ]);
        
                    // Mail::send('email.emailVerificationEmail', ['pin' => $pin], function ($message) use ($request) {
                    //     $message->to($request->email);
                    //     $message->subject('Reset Password');
                    // });
                    return response()->json([
                        'status' => 200,
                        'message' => 'We have e-mailed your password reset pin!'
                    ]);
                }else{
                    return response()->json([
                        'status' => 202,
                        'message' => 'We have e-mailed your password reset pin!'
                    ]);
                }
            
        }
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function verifypin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:staff',
            'pin' => 'required|min:4'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'=>501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {

            $updatePassword = DB::table('staff_password_resets')
                ->where([
                    'email' => $request->email,
                    'pin' => $request->pin
                ])
                ->first();

            if (!$updatePassword) {
                return response()->json([
                    'status' => 203,
                    'message' => 'Invalid pin!'
                ]);
            } else {
                
                return response()->json([
                    'status' => 200,
                    'message' => 'PIN Has Been Verified'
                ]);
            }
        }
    }

    /**
     * Write code on Method
     *
     * @return response()
     */
    public function submitResetPasswordForm(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:staff',
            'pin' => 'required|min:4',
            'password' => 'required|string|min:6|confirmed',

        ]);
        if ($validator->fails()) {
            return response()->json([
                'status'=>501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {

            $updatePassword = DB::table('password_resets')
                ->where([
                    'email' => $request->email,
                    'pin' => $request->pin
                ])
                ->first();

            if (!$updatePassword) {
                return response()->json([
                    'status' => 203,
                    'message' => 'Invalid pin!'
                ]);
            }else{
                DB::table('staff_password_resets')
                ->where([
                    'email' => $request->email,
                    'pin' => $request->pin
                ])
                ->delete();
                $user = staff::where('email', $request->email)
                ->update(['password' => Hash::make($request->password)]);

            DB::table('staff_password_resets')->where(['email' => $request->email])->delete();

            return response()->json([
                'status' => 200,
                'message' => 'your password have changed successfully'
            ]);
            }

            
        }
    }
}
