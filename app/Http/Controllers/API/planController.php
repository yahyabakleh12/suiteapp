<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\plan;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class planController extends Controller
{
    public function get_plans()
    {
        $data = plan::all();
        return response()->json([
            'status' => 200,
            'plans' => $data
        ]);
    }
    public function set_user_plan(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'plan_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {

            User::where('id', auth()->user()->id)->update([
                'plan_id' => $request->plan_id
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Plan has set successfully'
            ]);
        }
    }

}
