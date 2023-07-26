<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\services;
use App\Models\categories;
use App\Models\plan;
use App\Models\service_plan;
use App\Models\staff;
use App\Models\subServices;
use Illuminate\Http\Request;
use PhpParser\Node\Stmt\Foreach_;

class servicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = services::all();
        return view('admin.services.index',['services'=>$data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $plan = plan::all();
        return view('admin.services.create',['plan'=>$plan]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'image' => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
            'item_type'=>'required',
            'plan'=>'required',
        ]);
        
        if (request()->has('image')) {            
            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/services_images/');
            $image->move($imagePath, $imageName);
        }
        $service =services::create([
            'name'=>$request->name,
            'picture_path'=>'/services_images/'.$imageName,
            'item_type'=>$request->item_type,
        ]);
        foreach($request->plan as $object){
            service_plan::create([
                'services_id'=>$service->id,
                'plan_id'=>$object
            ]);
        }
        return Redirect(route('services.index'))->withSuccess('service added successfully');    
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $service = services::findOrFail($id);
        $categories = categories::whereBelongsTo($service)->get();
        $subServices = subServices::whereBelongsTo($service)->get();
        $staff = staff::whereBelongsTo($service)->get();
        return view('admin.services.all', ['service' => $service,'categories'=>$categories,'subServices'=>$subServices,'staff'=>$staff]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $service = services::findOrFail($id);
        $plan = plan::all();
        // $subServices = subServices::whereBelongsTo($service)->get();
        return view('admin.services.edit', ['service' => $service,'plan'=>$plan]);

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
        $request->validate([
            'name' => 'required',
            'image' => ['nullable', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
            'item_type'=>'required',
            'plan'=>'required',
        ]);
      
     
        $service = services::findOrFail($id);
        $imageName =substr($service->picture_path, strpos($service->picture_path, '/', 2) + 1);
        if (request()->has('image')) {            
            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/services_images/');
            $image->move($imagePath, $imageName);
        }
        services::where('id',$id)->update([
            'name'=>$request->name,
            'picture_path'=>'/services_images/'.$imageName,
            'item_type'=>$request->item_type,
        ]);
        service_plan::where('services_id',$id)->delete();
        foreach($request->plan as $object){
            service_plan::create([
                'services_id'=>$id,
                'plan_id'=>$object
            ]);
        }
        return Redirect(route('services.index'))->withSuccess('service updated successfully');   
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $service = services::findOrFail($id);
        $service->delete();
        return Redirect(route('services.index'))->withSuccess('service has been deleted successfully');    
    }
}
