<?php

namespace App\Http\Controllers\Auth;

use App\Models\staff;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Authenticatesstaffs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use App\Models\staffVerify;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Symfony\Contracts\Service\Attribute\Required;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class staffLoginController extends Controller
{
    use AuthenticatesUsers;

    protected $redirectTo = '/staff';

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function guard()
    {
        return Auth::guard('staff');
    }
    public function login(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'email' => 'required|max:191',
            'password' => 'required|min:8'
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $staff = staff::where('email', $request->email)->first();
            if (!$staff || !Hash::check($request->password, $staff->password)) {
                return response()->json([
                    'status' => 501,
                    'message' => 'Invalid credentials1'
                ]);
            } else {
                $ability = array('staff');
                $token = $staff->createToken($staff->email . '_Token',$ability)->plainTextToken;
                return response()->json([
                    'status' => 200,
                    'token' => $token,
                    'message' => 'Logged In successfully'
                ]);
            }
        }
    }
}
