<?php

namespace App\Http\Controllers\building;

use App\Http\Controllers\Controller;
use App\Models\facility_services;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class facilityController extends Controller
{
    public function index()
    {
        $data = facility_services::select('id', 'name', 'start', 'end', 'is_booking', 'is_all_time', 'sharing', 'duration')->where('building_id', Session::get('building_id'))->get();
        return view('building.facilities.index', ['facilities' => $data]);
    }
    public function edit($id)
    {
        $data = facility_services::select('id', 'name', 'start', 'end', 'is_booking', 'is_all_time','duration', 'sharing')->where('id', $id)->first();
        return view('building.facilities.edit', ['facility' => $data]);
    }
    public function update(Request $request, $id)
    {
        $fa = facility_services::find($id);
        if ($fa->is_all_time == 0) {
            $request->validate([
                'start' => 'required',
                'end' => 'required',

            ]);
        }
        $sharing = 0;
        if ($request->sharing == "on") {
            $sharing = 1;
        }
        facility_services::where('id', $id)->update([
            'start' => $request->start,
            'end' => $request->end,
            'sharing' => $sharing,
            'duration'=>$request->duration
        ]);
        return Redirect(route('building.facility'))->withSuccess('Facility updated successfully');
    }
}
