<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\staff;
use App\Models\services;
use Illuminate\Support\Facades\Hash;
class staffController extends Controller
{
      /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       
        $data = staff::all();
        return view('admin.staff.index', ['staff' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $services = services::all();
        return view('admin.staff.create', ['services' => $services]);
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
            'name' => 'required|max:191',
            'phone' => 'required|max:10|unique:staff',
            'rate' => 'required|max:5|min:0',
            'email' => 'required|max:191|unique:staff',
            'password' => 'required|min:8|confirmed',
            'service_id' => 'required'
        ]);
     
        staff::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'rate' => $request->rate,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'service_id' => $request->service_id,
        ]);
        return Redirect(route('staff.index'))->withSuccess('staff added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $staff = staff::findOrFail($id);
        $services = services::all();
        return view('admin.staff.edit', ['staff' => $staff, 'services' => $services]);
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
            'name' => 'required|max:191',
            'rate' => 'required|max:5|min:0',
            'service_id' => 'required'
        ]);
        $staff = staff::findOrFail($id);
        if ($request->email != $staff->email) {
            $request->validate([
                'email' => 'required|max:191|unique:staff',
            ]);
        }
        if ($request->phone != $staff->phone) {
            $request->validate([
                'phone' => 'required|max:10|unique:staff',
            ]);
        }
        if ($request->password !=  null) {
            $request->validate([
                'password' => 'required|min:8|confirmed',
            ]);
            staff::where('id', $id)->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'rate' => $request->rate,
                'email' => $request->email,
                'service_id' => $request->service_id,

            ]);
            return Redirect(route('staff.index'))->withSuccess('staff updated successfully');
        } else {
            staff::where('id', $id)->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'rate' => $request->rate,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'service_id' => $request->service_id,

            ]);
            return Redirect(route('staff.index'))->withSuccess('staff updated successfully');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $staff = staff::findOrFail($id);
        $staff->delete();
        return Redirect(route('staff.index'))->withSuccess('staff has been deleted successfully');
    }
    public function add_staff(Request $request){
        $request->validate([
            'name' => 'required|max:191',
            'phone' => 'required|max:10|unique:staff',
            'rate' => 'required|max:5|min:0',
            'email' => 'required|max:191|unique:staff',
            'password' => 'required|min:8|confirmed',
            'service_id' => 'required'
        ]);
     
        staff::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'rate' => $request->rate,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'service_id' => $request->service_id,
        ]);
        return Redirect(route('services.show',$request->service_id))->withSuccess('subServices added successfully');

    }
}
