<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\categories;
use App\Models\orders;
use App\Models\order_detail;
use App\Models\services;
use App\Models\staff;
use App\Models\User;
use App\Models\subServices;
use Illuminate\Http\Request;
use Kutia\Larafirebase\Facades\Larafirebase;
use Illuminate\Support\Facades\Notification;
use App\Notifications\SendPushNotification;
use Carbon\CarbonPeriod;

class ordersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = orders::with('User')->with('order_detail.subServices')->with('order_detail.categories')->with('order_detail.staff')->with('services')->with('services.staff')->orderBy('id')->get();
        // $next =date('Y-m-d',strtotime('+30 days',strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        // echo $next ;
        // dd($orders);
        // die;

        return view('admin.orders.index', ['orders' => $orders]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = User::find(95);
        app('App\Http\Controllers\firbaseController')->push_notification_android($user->device_key, 'This is Title', 'Congratulations you added a new car !');

        die;
        $users = User::all();
        $sub_services = subServices::all();
        $staffs = staff::all();
        return view('admin.orders.create', ['sub_services' => $sub_services, 'users' => $users, 'staffs' => $staffs]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    public function calender()
    {
        // $previous30days = date('Y-m-d', strtotime('today - 5 days'));
        $next = date('Y-m-d', strtotime('+30 days', strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        $next = trim($next);
        $previous = date('Y-m-d', strtotime('-4 days', strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        $previous = trim($previous);
        $order_ids = order_detail::whereBetween('booking_date', [$previous, $next])->where('status', 1)->pluck('orders_id')->toArray();
        $services = services::where('comming_soon', 0)->get();
        // foreach($services as $service){

        // }
        $period = CarbonPeriod::create($previous, $next);
        $order = orders::whereIn('id', $order_ids)->with('services')->with('order_detail')->get();
        return view('admin.calendar', ['period' => $period]);
    }
    public function daily()
    {
        return view('admin.day');
    }
    public function revoke($id)
    {
        $order_detail = order_detail::where('orders_id', $id)->update([
            'status' => 2
        ]);
        return redirect(route('orders.index'));
    }
    public function accept($id)
    {
        $order_detail = order_detail::where('orders_id', $id)->update([
            'status' => 1
        ]);
        return redirect(route('orders.index'));
    }
    public function assign_staff(Request $request)
    {

        $order_detail = order_detail::where('id', $request->order_detail_id)->update([
            'staff_id' => $request->staff_id
        ]);
        return redirect(route('orders.index'));
    }
    public function all_details()
    {
        $data = order_detail::with('orders')->with('order_date_time')->with('orders.User')->get();
        return view('admin.orders.orders_details', ['details' => $data]);
    }
    public static function count_orders()
    {
        $count = order_detail::where('status', 1)->count();
        return $count;
    }
    public static function sum_total()
    {
        $ids = order_detail::where('status', 1)->pluck('orders_id')->toArray();
        $orders = orders::whereIn('id', $ids)->pluck('total_price')->toArray();
        $sum = 0;
        foreach ($orders as $item) {
            $sum = $sum + $item;
        }
        return $sum;
    }
    public function search_by_id(Request $request)
    {
        $request->validate([
            'search' => 'required'
        ]);
        $data = orders::where('special_number', 'like', '%' . $request->search . '%')->pluck('id')->toArray();
        $order_detail = order_detail::whereIn('orders_id', $data)->get();
        return view('admin.orders.orders_details', ['details' => $order_detail]);
    }
}
