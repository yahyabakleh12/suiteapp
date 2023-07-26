<?php

namespace App\Http\Controllers\building;

use App\Http\Controllers\Controller;
use App\Models\Facilities;
use App\Models\facility_services;
use App\Models\guest;
use App\Models\building;

use App\Models\user_facility_log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use PhpParser\Node\Expr\FuncCall;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('group_building')->except('logout');
        // $this->middleware('group_building');
    }
    public function root()
    {

        $details = array();
        
        return view('index2', ['details' => $details,'buildingname'=>'test']);
    }
    public function log()
    {
        $data = user_facility_log::where('building_id', Session::get('building_id'))->get();
        return view('building.users.log', ['logs' => $data]);
    }
    public function log_clear(Request $request)
    {
        user_facility_log::where('building_id', Session::get('building_id'))->delete();
    }
    public function bookings()
    {
        $data  = facility_services::where('building_id', Session::get('building_id'))->where('is_booking', 1)->pluck('id')->toArray();
        $booking = Facilities::whereIn('facility_service_id', $data)->where('is_guest', 0)->where('status', 0)->get();
        return view('building.Bookings.index', ['bookings' => $booking]);
    }
    public function bookings_edit($id)
    {
        $data1 = Facilities::find($id);
        $data = Facilities::where('user_id', $data1->user_id)->where('facility_service_id', $id)->where('date', $data1->date)->first();
        $facility = facility_services::find($data1->facility_service_id);

        if (empty($data)) {
            $startTime = strtotime($facility->start);
            $endTime   = strtotime($facility->end);

            $arrInterval = [];
            while ($endTime >= $startTime) {
                $valid = Facilities::where('facility_service_id', $id)->where('date', $data1->date)->pluck('time')->toArray();
                if (!in_array(date("H:i:s", $startTime), $valid)) {
                    $arrInterval[] = date("H:i:s", $startTime);
                    $startTime = strtotime('+' . $facility->duration . ' minutes', $startTime);
                }
            }

            $arr = $arrInterval;
        } else {
            $arr = [];
        }
        $data1['available'] = $arr;
        return view('building.Bookings.edit', ['booking' => $data1]);
    }
    public function bookings_update($id, Request $request)
    {
        $request->validate([
            'time' => 'required',
        ]);
        Facilities::where('id', $id)->update([
            'time' => $request->time
        ]);
        return Redirect(route('building.facility.bookings'))->withSuccess('updated successfully');
    }
    public function guest_register(Request $request)
    {
        $request->validate([
          'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'type'=> 'required'
        ]);
        $guest = guest::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'user_id' => $request->id2,
            'facility_service_id' => $request->id1,
            'type'=>$request->type
        ]);
        $data = Facilities::where('is_guest', 1)->where('user_id', $request->id2)->where('facility_service_id', $request->id1)->first();
        if (empty($data)) {
            return abort(404);
        } else {
            $qr = $data->qr . '_' . $guest->id;
            $data->update([
                'qr' => $qr
            ]);
            return view('guest_qr', ['code' => $qr]);
        }
    }
    public function guest_register1(Request $request)
    {
       
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'type'=> 'required'
        ]);
        $guest = guest::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'user_id' => $request->id2,
            'facility_service_id' => $request->id1,
            'type'=>$request->type
        ]);
        $data = Facilities::where('is_guest', 1)->where('user_id', $request->id2)->where('special',$request->special)->where('facility_service_id', $request->id1)->first();
        //  dd($request);
        // die;
        if (empty($data)) {
            return abort(404);
        } else {
            $qr = $data->qr . '_' . $guest->id;
            $data->update([
                'qr' => $qr
            ]);
            return view('guest_qr', ['code' => $qr]);
        }
    }
    public function building_interface(){
        return view('building.building_interface');
    }
}
