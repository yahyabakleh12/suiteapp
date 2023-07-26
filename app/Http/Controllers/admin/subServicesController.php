<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\subServices;
use App\Models\categories;
use App\Models\services;
use App\Models\time_slote;
use App\Models\time_slote_subservices;

class subServicesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $services = services::all();
        $categories = categories::whereBelongsTo($services)->get();
        $data = subServices::whereBelongsTo($categories)->get();
        return view('admin.subServices.index', ['subServices' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = categories::all();
        $time_slote = time_slote::all();
        return view('admin.subServices.create', ['categories' => $categories, 'time_slote' => $time_slote]);
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
            'price' => 'required',
            'category_id' => 'required',
            'time_slote_id' => 'required',
            'promotion_from'=>'required',
            'promotion_to'=>'required',
            'discount'=>'required',
            'number_of_dates'=>'required'
        ]);
        $category = categories::findOrFail($request->category_id);

        $subservices = subServices::create([
            'name' => $request->name,
            'price' => $request->price,
            'category_id' => $request->category_id,
            'service_id' => $category->services_id,
            'promotion_from'=>$request->promotion_from,
            'promotion_to'=>$request->promotion_to,
            'discount'=>$request->discount,
            'number_of_dates'=>$request->number_of_dates
        ]);
      
        foreach ($request->time_slote_id as $item) {
            time_slote_subservices::create([
                'time_slote_id' => $item,
                'sub_services_id' => $subservices->id
            ]);
        }
        return Redirect(route('subServices.index'))->withSuccess('subServices added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
return $id;    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $services = services::all();
        $categories = categories::whereBelongsTo($services)->get();
        $subService = subServices::findOrFail($id);
        $time_slote = time_slote::all();
        return view('admin.subServices.edit', ['subService' => $subService, 'categories' => $categories,'time_slote'=>$time_slote]);
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
            'price' => 'required',
            'category_id' => 'required',
            'time_slote_id'=>'required',
            'promotion_from'=>'required',
            'promotion_to'=>'required',
            'discount'=>'required',
            'number_of_dates'=>'required'

        ]);
        $category = categories::findOrFail($request->category_id);
        subServices::where('id', $id)->update([
            'name' => $request->name,
            'price' => $request->price,
            'category_id' => $request->category_id,
            'service_id' => $category->services_id,
            'promotion_from'=>$request->promotion_from,
            'promotion_to'=>$request->promotion_to,
            'discount'=>$request->discount,
            'number_of_dates'=>$request->number_of_dates
        ]);
        time_slote_subservices::where('sub_services_id', $id)->delete();
        foreach ($request->time_slote_id as $item) {
            time_slote_subservices::create([
                'time_slote_id' => $item,
                'sub_services_id' => $id
            ]);
        }

        return Redirect(route('subServices.index'))->withSuccess('subServices updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $subService = subServices::findOrFail($id);
        time_slote_subservices::where('sub_services_id', $id)->delete();
        $subService->delete();
        return Redirect(route('subServices.index'))->withSuccess('subServices has been deleted successfully');
    }
    public function add_subservice(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'price' => 'required',
            'category_id' => 'required'
        ]);
        $category = categories::findOrFail($request->category_id);
        subServices::create([
            'name' => $request->name,
            'price' => $request->price,
            'category_id' => $request->category_id,
            'service_id' => $category->service_id
        ]);

        return Redirect(route('services.show', $category->service_id))->withSuccess('subServices added successfully');
    }
}
