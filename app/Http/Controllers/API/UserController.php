<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Models\building;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
class UserController extends Controller
{
    public function generate_nfc(Request $request){
        $rand = Str::random(128);
        $id = auth()->user()->id;
        $ex = User::where('nfc',$rand)->first();
        if(isset($ex)){
            $rand =  Str::random(128);
        }
        $user = User::find($id);
        $user->update([
            'nfc' => $rand,
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'User Has Been Edited successfully'
        ]);
    }
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required',
            'phone'=>'required',
            'appartment_number'=>'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $id = auth()->user()->id;
            $user = User::find($id);
           
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'phone' => $request->phone,
                'appartment_number' => $request->appartment_number,
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'User Has Been Edited successfully'
            ]);
        }
    }
    public function set_user_building(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'building_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            User::where('id', auth()->user()->id)->update([
                'building_id' => $request->building_id
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'building Has Been Set Successfully'
            ]);
        }
    }
    public function show(){
        $user = User::findOrFail(auth()->user()->id);
        $bilding = building::where('id', $user->building_id)->first();
        if ($bilding->parkonic_residantial != 0) {
            $set_building = true;
        } else {
            $set_building = false;
        }
 
        return response()->json([
            'status' => 200,
            'user' => $user,
            'plan' => $user->plan->name,
        ]);
    }
    public function rate_us(Request $request){
        $id = auth()->user()->id;
        $user = User::find($id);
       
        $user->update([
            'rate' => $request->rate,
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'your feed back has been set successfully'
        ]);
    }
}