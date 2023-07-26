<?php

namespace App\Http\Controllers\admin;


use App\Http\Controllers\Controller;
use App\Models\area;
use Exception;
use Illuminate\Http\Request;

class areaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $area = area::all();
        return view('admin.area.index', ['area' => $area]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.area.create');
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

        ]);
        area::create([
            'name' => $request->name,
        ]);
        return Redirect(route('area.index'))->withSuccess('Area added successfully');
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
        $data = area::findOrFail($id);
        return view('admin.area.edit', ['Area' => $data]);
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

        ]);
        area::where('id', $id)->update([
            'name' => $request->name,
        ]);
        return Redirect(route('area.index'))->withSuccess('Area Updated successfully');
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
            $area = area::findOrFail($id);
            $area->delete();
            return Redirect(route('area.index'))->withSuccess('area has been deleted successfully');
        } catch (Exception) {
            return Redirect(route('area.index'))->withfail('you can not delete area because it is linked to some other component');
        }
    }
}
