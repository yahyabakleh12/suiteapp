<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\area;
use Illuminate\Http\Request;
use App\Models\building;
use App\Models\building_services;
use App\Models\services;
use Exception;

class buildingsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = building::all();
        return view('admin.buildings.index', ['buildings' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $services = services::where('comming_soon', 0)->get();

        $area = area::all();
        return view('admin.buildings.create', ['area' => $area, 'services' => $services]);
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
            'location' => ['required'],
            'area_id' => ['required'],
            'services' => 'required'
        ]);
        if ($request->parkonic_residantial == 'on') {
            $parkonic_residantial = 1;
        } else {
            $parkonic_residantial = 0;
        }
        $building = building::create([
            'name' => $request->name,
            'location' => $request->location,
            'area_id' => $request->area_id,
            'parkonic_residantial' => $parkonic_residantial
        ]);
        foreach ($request->services as $item) {
            building_services::create([
                'service_id' => $item,
                'building_id' => $building->id
            ]);
        }
        return Redirect(route('buildings.index'))->withSuccess('building added successfully');
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
        $services = services::all();
        $area = area::all();
        $building = building::findOrFail($id);
        return view('admin.buildings.edit', ['building' => $building, 'area' => $area, 'services' => $services]);
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
        $building = building::findOrFail($id);
        $request->validate([
            'name' => 'required',
            'location' => ['required'],
            'area_id' => ['required'],
            'services' => 'required'

        ]);
        if ($request->parkonic_residantial == 'on') {
            $parkonic_residantial = 1;
        } else {
            $parkonic_residantial = 0;
        }
        $b_s = building_services::where('building_id', $id)->get();
        foreach ($b_s as  $t_s) {
            $t_s->delete();
        }
        building::where('id', $id)->update([
            'name' => $request->name,
            'location' => $request->location,
            'area_id' => $request->area_id,
            'parkonic_residantial' => $parkonic_residantial
        ]);
        foreach ($request->services as $item) {
            building_services::create([
                'service_id' => $item,
                'building_id' => $building->id
            ]);
        }
        return Redirect(route('buildings.index'))->withSuccess('edit has been saved successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $building = building::findOrFail($id);
            $building->delete();
            return Redirect(route('buildings.index'))->withSuccess('building has been deleted successfully');
        } catch (Exception) {
            return Redirect(route('buildings.index'))->withfail('building has been not deleted because it is linked to some other component');
        }
    }
    public static function count(){
        $count = building::count();
        return $count;
    }
}
