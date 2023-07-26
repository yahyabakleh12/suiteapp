<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\time_slote;
use Exception;
use Illuminate\Http\Request;

class timesloteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = time_slote::all();
        return view('admin.time_slote.index', ['time_slote' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.time_slote.create');
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
            'time_from' => 'required',
            'time_to' => 'required'
        ]);
        time_slote::create([
            'time_from'=>$request->time_from,
            'time_to' =>$request->time_to
        ]);   
        return Redirect(route('time-slote.index'))->withSuccess('Time Slote added successfully');
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
 

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try{
        time_slote::find($id)->delete();
                return Redirect(route('time-slote.index'))->withSuccess('time slote Removed successfully');
        }catch(Exception){
            return Redirect(route('time-slote.index'))->withfail('you can not delete time slote because it is linked to some other component');
        }
    }
}
