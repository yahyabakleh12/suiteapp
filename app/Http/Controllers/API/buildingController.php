<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\appartment;
use App\Models\building;


class buildingController extends Controller
{
    //
    public function all(Request $request)
    {
        $data = building::all();
        return response()->json([
            'status' => 200,
            'buildings' => $data,
        ]);
    }
    public function get_appartment($id){
        $data = appartment::where('building_id',$id)->get();
        return response()->json([
            'status' => 200,
            'apartments' => $data,
        ]);
    }
}