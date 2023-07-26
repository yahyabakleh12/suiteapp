<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\area;
use App\Models\visitor_address;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class areaController extends Controller
{
    public function index()
    {
        $data = area::all();
        return response()->json([
            'status' => 200,
            'area' => $data
        ]);
    }
    public function visitor_address(Request $request){
        $validator = Validator::make($request->all(), [
            'address' => 'required',
            'fcm' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            visitor_address::create([
                'address'=>$request->address,
                'fcm'=>$request->fcm
            ]);
        }
        return response()->json([
            'status' => 200,
            'message' => 'Thank you! once we provide services in your area we will inform you'
        ]);
    }
}
