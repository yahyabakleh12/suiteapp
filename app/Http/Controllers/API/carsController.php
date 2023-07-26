<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\cars;
use Illuminate\Support\Facades\Validator;


class carsController extends Controller

{

    public function index()
    {
        $data = cars::where('user_id', auth()->user()->id)->get();
        return response()->json([
            'status' => 200,
            'cars' => $data
        ]);
    }
    public function add_car(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'emirate' => 'required',
            'plate_code' => 'required',
            'type' => 'required',
            'plate_number' => 'required|max:6|unique:cars,plate_number',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            cars::create([
                'emirate' => $request->emirate,
                'plate_code' => $request->plate_code,
                'type' => $request->type,
                'plate_number' => $request->plate_number,
                'user_id' => auth()->user()->id
            ]);
            // if (auth()->user()->device_key  !='') {
            //     app('App\Http\Controllers\firbaseController')->push_notification_android(auth()->user()->device_key, 'Congratulations you added a new car !');
            // }
            return response()->json([
                'status' => 200,
                'message' => 'Car Has Been added Successfully'
            ]);
        }
    }
    public function update_car(Request $request, $id)
    {
        $car = cars::findOrFail($id);
        if ($request->plate_number == $car->plate_number) {
            $validator = Validator::make($request->all(), [
                'emirate' => 'required',
            'plate_code' => 'required',
            'type' => 'required',
          
            ]);
        } else {
            $validator = Validator::make($request->all(), [
                'emirate' => 'required',
                'plate_code' => 'required',
                'type' => 'required',
                'plate_number' => 'required|unique:cars,plate_number|max:6',
            ]);
        }
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            cars::where('id', $id)->update([
                'emirate' => $request->emirate,
                'plate_code' => $request->plate_code,
                'type' => $request->type,
                'plate_number' => $request->plate_number,
                'user_id' => auth()->user()->id
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Car Has Been Updated Successfully'
            ]);
        }
    }
    public function delete_car($id)
    {
        $car = cars::findOrFail($id);
        $car->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Car Has Been Deleted Successfully'
        ]);
    }
}
