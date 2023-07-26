<?php

namespace App\Http\Controllers\building;

use App\Http\Controllers\Controller;
use App\Models\facility_services;
use App\Models\User;
use App\Models\user_facility_bloking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class userController extends Controller
{
    public function index()
    {
        $data = User::where('building_id', Session::get('building_id'))->get();
        $facilities = facility_services::where('building_id', Session::get('building_id'))->get();
        return view('building.users.index', ['users' => $data, 'facilities' => $facilities]);
    }
    public function block($id)
    {
        $facilities = facility_services::where('building_id', Session::get('building_id'))->get();
        return view('building.users.block', ['fasilities' => $facilities]);
    }
    public function activate(Request $request, $id)
    {
        User::where('id', $id)->update([
            'active' => 1
        ]);
        return redirect(route('building.user'));
    }
    public function restrict(Request $request, $id)
    {
        user_facility_bloking::create([
            'user_id' => $id,
            'facility_id' => $request->facility_service_id
        ]);
        return redirect(route('building.user'));
    }
    public function unrestrict(Request $request, $id)
    {
        user_facility_bloking::where('user_id', $id)->where('facility_id', $request->facility_service_id)->delete();
        return redirect(route('building.user'));
    }
}
