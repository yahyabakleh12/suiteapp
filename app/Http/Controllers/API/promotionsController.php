<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\categories;
use App\Models\promotion_subservices;
use App\Models\promotions;
use App\Models\subServices;
use Illuminate\Http\Request;

class promotionsController extends Controller
{
    public function index()
    {
        $data = promotions::all();
        return response()->json([
            'status' => 200,
            'promotions' => $data
        ]);
    }
    public function show($id)
    {
        $promotion = promotions::findOrFail($id);
        $promotion_subservices = promotion_subservices::whereBelongsTo($promotion)->pluck('subservice_id')->toArray();
        $promotion_subservices_data = promotion_subservices::whereBelongsTo($promotion)->get();
        $subservices = subServices::wherein('id',$promotion_subservices)->get();
        $subservices_categories = subServices::wherein('id',$promotion_subservices)->pluck('category_id')->toArray();
        $categories = categories::wherein('id',$subservices_categories)->with('services')->get();
        foreach($subservices as $item){
             foreach($promotion_subservices_data as$obj){
                if($item->id == $obj->subservice_id){
                    $item['promotion_price']= $obj->price;
                }
             }
           
        }
        
        $i=0;
       $cat = array();
       //bug for multible categories and subservices 
        foreach($categories as $item1){
            $arr=array();
            $arr = explode("/", $item1->discription, (substr_count($item1->discription,'/')+1 ));
            $item1->discription= $arr;
            $item1['picture_url'] = url($item1->picture_path);
            $cat[$i] = $item1;
            $i++;
           
        }
    //     $new_subservices = array();
    //     $j=0;
    //    foreach($subservices as $item){
    //         $time_slote = $item->time_slote_subservices;
    //         $time_arr = array();
    //         $i = 0;
    //         foreach($time_slote as $obj){
    //             $time = $obj->time_slote->time;
    //             $time_arr[$i] = $time;
    //             $i++;
    //         }
    //         $item['time_slote'] = $time_arr;
    //         $new_subservices[$j] = $item; 
    //    }
       
        return response()->json([
            'status' => 200,
            'promotion' => $promotion,
            'subservices'=>$subservices,
            'categories'=>$cat
        ]);
    }
    public function get_image($id)
    {
        $service = promotions::find($id);

        return response()->file(public_path($service->picture_path));
    }
}
