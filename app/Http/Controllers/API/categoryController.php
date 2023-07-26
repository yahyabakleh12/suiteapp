<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\categories;
use App\Models\frequency;
use App\Models\subcategories;
use App\Models\subcategories_plan;
use Illuminate\Http\Request;

class categoryController extends Controller
{
    public function get_image($id)
    {
        $service = categories::find($id);

        return response()->file(public_path($service->picture_path));
    }
    public function get_subcategory($id)
    {
        $sub = subcategories_plan::where('plan_id', auth()->user()->plan_id)->pluck('subcategories_id')->toArray();
        $data = subcategories::where('category_id', $id)->whereIn('id', $sub)->get();
        $i = 0;
        $cat = array();
        foreach ($data as $item) {
            $arr = array();
            $arr = explode("/", $item->description, (substr_count($item->description, '/') + 1));
            $item['description'] = $arr;
            $item['picture_url'] = url($item->picture_path);
            $cat[$i] = $item;
            $i++;
        }
        return response()->json([
            'status' => 200,
            'subcategories' => $cat
        ]);
    }
    public function get_booking_conf($id)
    {
        $categories = categories::find($id);
        $frequency = frequency::where('category_id', $id)->get();


        $arr = array();
        $arr = explode("/", $categories->discription, (substr_count($categories->discription, '/') + 1));
        $arr1 = array();
        $arr1 = explode("/", $categories->time_slote, (substr_count($categories->time_slote, '/') + 1));
        $categories['discription'] = $arr;
        $categories['time_slote'] = $arr1;
        $categories['picture_url'] = url($categories->picture_path);
        $categories['item_type']= $categories->services->item_type;

        return response()->json([
            'status' => 200,
            'frequency' => $frequency,
            'categories' => $categories
        ]);
    }
}
