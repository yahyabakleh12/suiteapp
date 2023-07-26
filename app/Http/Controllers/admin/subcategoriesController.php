<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\plan;
use App\Models\services;
use App\Models\subcategories;
use App\Models\subcategories_plan;
use Illuminate\Http\Request;

class subcategoriesController extends Controller
{
    public function index(){
        $data = subcategories::all();
        return view('admin.subcategories.index',['subcategories'=>$data]);
    }
    public function create(){
        $services = services::all();
        $plan = plan::all();
        return view('admin.subcategories.create',['services'=>$services,'plan'=>$plan]);
    }
    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            'frequency' => 'required',
            'service' => 'required',
            'number_of_dates'=>'required'
        ]);
     
        $subcategory = subcategories::create([
            'title'=>$request->name,
           
            'services_id'=>$request->service,
            'number_of_dates'=>$request->number_of_dates
        ]);
        $plans= plan::all();
        foreach($plans as $plan){
            if($request['plan_'.$plan->id] !=0){
                subcategories_plan::create([
                    'plan_id'=>$plan->id,
                    'subcategories_id'=>$subcategory->id,
                    'price'=>$request['plan_'.$plan->id]
                ]);
            }
        }
        return Redirect(route('subcategories.index'))->withSuccess('Item added successfully');
    }
}
