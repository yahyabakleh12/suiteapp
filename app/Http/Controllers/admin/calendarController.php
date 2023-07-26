<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\order_date_time;
use App\Models\order_detail;
use App\Models\orders;
use App\Models\services;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;

class calendarController extends Controller
{
    public function calender()
    {
        // $previous30days = date('Y-m-d', strtotime('today - 5 days'));
        $next = date('Y-m-d', strtotime('+30 days', strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        $next = trim($next);
        $previous = date('Y-m-d', strtotime('-4 days', strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        $previous = trim($previous);
        $period = CarbonPeriod::create($previous, $next);
        $services = services::where('comming_soon',0)->get();

        return view('admin.calendar', ['period' => $period, 'services' => $services]);
    }
    public function daily($date)
    {
        $dates = order_date_time::where('date', $date)->where('status',0)->pluck('order_detail_id')->toArray();
        $data = order_detail::whereIn('id', $dates)->with('orders')->with('order_date_time')->with('orders.User')->get();
        return view('admin.orders.orders_details', ['details' => $data]);
    }
    public static function get_services_count($date, $id)
    {
        $dates = order_date_time::where('date', $date)->where('status',0)->pluck('order_detail_id')->toArray();
        $order_detail = order_detail::whereIn('id', $dates)->pluck('orders_id')->toArray();
        $orders = orders::whereIn('id', $order_detail)->where('service_id', $id)->count();
        return $orders;
    }
    public static function get_orders($date)
    {

        $dates = order_date_time::where('date', $date)->where('status',0)->count();
        if ($dates > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
