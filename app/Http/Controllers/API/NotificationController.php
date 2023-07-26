<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\notification;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    public function index(){
        $data = notification::where('user_id',auth()->user()->id)->where('status',0)->get();
        return response()->json([
            'status' => 200,
            'notification' =>$data,
        ]);
    }
    public function destroy($id){
        $not = notification::where('id',$id)->delete();
          return response()->json([
            'status' => 200,
            'message' =>'notification deleted successfully',
        ]);
    }
    public function delete_all(){
        notification::where('user_id',auth()->user()->id)->delete();
          return response()->json([
            'status' => 200,
            'message' =>'all notification deleted successfully',
        ]);
    }
}
