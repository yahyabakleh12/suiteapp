<?php

namespace App\Http\Controllers\building;

use App\Http\Controllers\Controller;
use App\Models\building;
use App\Models\group_building;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Foundation\Auth\ThrottlesLogins;

class AuthController extends Controller
{
    use ThrottlesLogins;
    public function get_login()
    {
        return view('building.auth.login');
    }
    public function login(Request $request)
    {
             $request->validate([
            'name' => 'required',
            'password' => ['required'],
        ]);
        if(Auth::guard('group_building')->attempt($request->only('name','password'),$request->filled('remember'))){
            //Authenticated
            return redirect()
                ->intended(route('adminDashboard'))
                ->with('status','You are Logged in as Admin!');
        }
        return Redirect::back()->withfail(['msg' => 'Wronge credentials please try again !']);


        // $building = group_building::where('name', $request->name)->first();
        // if (!$building || !Hash::check($request->password, $building->password)) {
        //     return Redirect::back()->withfail(['msg' => 'Wronge credentials please try again !']);
        // } else {
        //    dd('test');
        //     return redirect(url('/building'));
        // }
    }
    
    public function username()
    {
        return 'name';
    }
    public function logout(Request $request)
    {
        if (Auth::guard('group_building')->check()) 
        {
            Auth::guard('group_building')->logout();
            return redirect()->route('buildingLogin');
        }

        $this->guard()->logout();
        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect('/');
    }
}
