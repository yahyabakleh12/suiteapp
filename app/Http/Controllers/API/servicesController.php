<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\building;
use App\Models\building_services;
use App\Models\services;
use App\Models\categories;
use App\Models\subServices;
use App\Models\cars;
use App\Models\locker;
use App\Models\locker_user;
use App\Models\order_detail;
use App\Models\orders;
use App\Models\promotions;
use App\Models\service_plan;
use App\Models\slider;
use App\Models\staff;
use App\Models\subcategories;
use Illuminate\Support\Facades\Schema;
use Carbon\CarbonPeriod;
use Illuminate\Support\Facades\Auth;

class servicesController extends Controller
{
    public function all()
    {
        if (Auth::check()) {
            $plan  = service_plan::where('plan_id', auth()->user()->plan_id)->pluck('services_id')->toArray();
            $data = services::whereIn('id', $plan)->get();
        } else {
            $data = services::all();
        }
        $categories = categories::all();
        foreach ($data as $service) {
            $service['picture_url'] = url($service->picture_path);
        }
        $slider = slider::where('active',1)->get();
        foreach ($slider as $object) {
            $object['picture_url'] = url($object->picture);
        }
        $i = 0;
        $cat = array();
        foreach ($categories as $item) {
            $arr = array();
            $arr = explode("/", $item->discription, (substr_count($item->discription, '/') + 1));
            $item['discription'] = $arr;
            $item['picture_url'] = url($item->picture_path);
            $cat[$i] = $item;
            $i++;
        }
        return response()->json([
            'status' => 200,
            'services' => $data,
            'slider'=>$slider,
            'subservices'=>$cat

        ]);
    }
    public function get_image($id)
    {
        // Schema::connection('mysql')->create('mytable_' . $id, function ($table) {
        //     $table->increments('id', 255);
        //     $table->string('var');
        //     $table->text('text');
        //     $table->integer('number');
        //     $table->timestamps();
        // });
        $service = services::find($id);

        return response()->file(public_path($service->picture_path));
    }
    public function show($id)
    {

        // $subservices = subServices::where('service_id', $id)->get();
        // $staff = staff::where('services_id', $id)->get();
        $service = services::findOrFail($id);
        $service['picture_url'] = url($service->picture_path);
        $categories = categories::where('services_id', $id)->get();
        $subcategories = subcategories::where('services_id',$id)->get();
        // $new_subservices = array();
        // $j = 0;
        // foreach ($subservices as $item) {
        //     $time_slote = $item->time_slote_subservices;
        //     $time_arr = array();
        //     $i = 0;
        //     foreach ($time_slote as $obj) {
        //         $time = $obj->time_slote->time;
        //         $time_arr[$i] = $time;
        //         $i++;
        //     }
        //     $item['time_slote'] = $time_arr;
        //     $new_subservices[$j] = $item;
        //     $j++;
        // }
        $i = 0;
        $cat = array();
        foreach ($categories as $item) {
            $arr = array();
            $arr = explode("/", $item->discription, (substr_count($item->discription, '/') + 1));
            $item['discription'] = $arr;
            $item['picture_url'] = url($item->picture_path);
            $cat[$i] = $item;
            $i++;
        }




        return response()->json([
            'status' => 200,
            'service' => $service,
            'categories' => $cat,
            'subcategories' => $subcategories,
            // 'staff' => $stsaff,

        ]);
    }
    public function free_date($id)
    {
        $next = date('Y-m-d', strtotime('+30 days', strtotime(str_replace('/', '-', date('Y-m-d'))))) . PHP_EOL;
        $next = trim($next);

        $period = CarbonPeriod::create(date('Y-m-d'), $next);
        $subservices = subServices::find($id);
        $staff = staff::where('services_id', $subservices->service_id)->count();
        $i = 0;
        $free_dates = array();
        // Iterate over the period
        foreach ($period as $date) {


            $arr = array();
            $time_slote = $subservices->time_slote_subservices;
            $time_arr = array();
            $k = 0;
            foreach ($time_slote as $obj) {
                $time = array(
                    'time_from' => $obj->time_slote->time_from,
                    'time_to' => $obj->time_slote->time_to
                );
                $time_arr[$k] = $time;
                $k++;
            }
            $arr = $time_arr;

            $date1 = $date->format('Y-m-d');
            $final = array(
                'date' => $date1,
                'time_slote' => $arr
            );
            $free_dates[$i] = $final;

            $i++;
        }
        return response()->json([
            'status' => 200,
            'dates' => $free_dates,

        ]);
    }
}

