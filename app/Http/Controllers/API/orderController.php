<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\cars;
use App\Models\order_date_time;
use App\Models\order_detail;
use App\Models\orders;
use App\Models\services;
use App\Models\staff;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\locker;
use App\Models\locker_user;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Events\Noticeevent;
use App\Models\car_orders;
use App\Models\categories;
use App\Models\e_wallet;
use App\Models\e_wallet_history;
use App\Models\frequency;
use App\Models\notification;
use App\Models\User;

class orderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cancel_order(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'order_id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $order = orders::where('id', $request->order_id)->update([
                'status' => 2
            ]);
            app('App\Http\Controllers\firbaseController')->push_notification_android(auth()->user()->device_key, 'canceling An order', 'Your order has been canceled');
            notification::create([
                'user_id' => auth()->user()->id,
                'message' => 'Your order has been canceled',
                'title' => 'canceling An order'
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Your order has been successfully canceled'
            ]);
        }
    }

    public function book(Request $request)
    {
        // return $request;
        $rules = [
            "frequency_id" => "required",
            "date" => "required",
            "time_sloat" => "required",
            "category_id" => "required",
            "totals_price" => "required",
            "servies_id" => "required",
        ];
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $locker_id = $request->locker_pin;
            $order = orders::create([
                "frequency_id" => $request->frequency_id,
                "date" => $request->date,
                "time_slote" => $request->time_sloat,
                "category_id" => $request->category_id,
                "totals_price" => $request->totals_price,
                "servies_id" => $request->servies_id,
                "houres" => $request->hours_professional,
                "proffessional" => $request->counter_professional_worker,
                "material" => $request->materials,
                "locker_id" => $request->$locker_id,
                "phone" => $request->direct_phone,
                "gender" => $request->gender,
                "total_price" => $request->totals_price,
                "note" => $request->note,
                "user_id" => auth()->user()->id
                // "status",
                // "frequency_status"


            ]);
            if ($request->totals_price > auth()->user()->balance) {
                app('App\Http\Controllers\firbaseController')->push_notification_android(auth()->user()->device_key, 'Fail to Book your order', 'Your order has not been booked due to insufficient funds');
                // event(new Noticeevent('User has placed an order with the id  #' . $order->id));
                notification::create([
                    'user_id' => auth()->user()->id,
                    'message' => 'Your order has not been booked due to insufficient funds',
                    'title' => 'Fail to Book your order'
                ]);
                return response()->json([
                    'status' => 203,
                    'message' => 'Your order has not been booked due to insufficient funds'
                ]);
            }
           
            $category = categories::find($request->category_id);
            $frq = frequency::find($request->frequency_id);
            
            if (!empty($request->car_ids)) {
                foreach ($request->car_ids as $item) {
                    car_orders::create([
                        'order_id' => $order->id,
                        'car_id' => $item,

                    ]);
                }
            }
            
            app('App\Http\Controllers\firbaseController')->push_notification_android(auth()->user()->device_key, 'placing An order', 'Your order is under processing');
            event(new Noticeevent('User has placed an order with the id  #' . $order->id));
            notification::create([
                'user_id' => auth()->user()->id,
                'message' => 'You have placed an order Successfully',
                'title' => 'placing an order'
            ]);
            $new_balance = auth()->user()->balance - $request->totals_price;
          
            e_wallet_history::create([
                'user_id'=>auth()->user()->id,
                'amount'=>$request->totals_price,
                'transaction'=> $category->name . ' for ' . $frq->title,
                'balance'=>$new_balance
            ]);
            User::where('id', auth()->user()->id)->update([
                'balance' => $new_balance
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Your order has been successfully booked'
            ]);
        }
    }
    public function history()
    {
        // app('App\Http\Controllers\firbaseController')->push_notification_android(auth()->user()->device_key,'placing An order', 'Your order is under processing');

        $orders = orders::where('user_id', auth()->user()->id)->with('frequency')->with('categories')->get();
        // $order_detail = array();
        // $i = 0;
        // foreach($orders as $item){
        //     $order_detail[$i]=$item;
        //     $order_detail[$i]['service'] = $item->services->name;
        //     $detail = order_detail::where('orders_id',$item->id)->get();
        //     unset($order_detail[$i]['service_id']);
        //     unset($order_detail[$i]['services']);
        //     $arr= array();
        //     $j=0;
        //     foreach($detail as $obj){
        //         $arr[$j] = $obj;
        //         $arr[$j]['subservice']=$obj->subServices->name;
        //         $arr[$j]['category'] = $obj->categories->name;
        //         $arr2= array();
        //         if($obj->service_type == 'car'){
        //             $arr2['type'] = $obj->cars->type;
        //             $arr2['plate_number'] = $obj->cars->plate_number;
        //             $arr2['emirate'] = $obj->cars->emirate;
        //             $arr2['plate_code'] = $obj->cars->plate_code;


        //         }else{

        //             $arr2['type'] =null;
        //             $arr2['plate_number'] = null;
        //             $arr2['emirate'] = null;
        //             $arr2['plate_code'] = null;

        //         }
        //         $arr[$j]['car']= $arr2;
        //         unset($arr[$j]['subservice_id']);
        //         unset($arr[$j]['categories_id']);
        //         unset($arr[$j]['staff_id']);
        //         unset($arr[$j]['sub_services']);
        //         unset($arr[$j]['categories']);
        //         unset($arr[$j]['cars']);
        //         $timing = order_date_time::where('order_detail_id',$obj->id)->get();
        //         $tt = array();
        //         $k = 0;
        //         foreach($timing as $element){
        //             $tt[$k]=$element;
        //             $k++;
        //         }
        //         $arr[$j]['time_date']= $tt;
        //         $j++;
        //     }
        //     $order_detail[$i]['order_detail']= $arr;
        //     $i++;
        // }
        // $cars = cars::where('user_id', auth()->user()->id)->get();
        foreach ($orders as $order) {
            $order['categories']['picture_path'] = url($order->categories->picture_path);
        }
        return response()->json([
            'status' => 200,
            'orders' => $orders,
            // 'cars' => $cars
        ]);
    }
}
