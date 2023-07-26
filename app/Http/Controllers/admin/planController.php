<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\plan;
use Illuminate\Http\Request;

class planController extends Controller
{
    public function index(){
        $data= plan::all();
        return view('admin.plan.index',['plans'=>$data]);
    }
    public function create(){
        return view('admin.plan.create');
    }
    public function store(Request $request){
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
        ]);
        $free = 0 ;
        if($request->is_free == 'on'){
            $free=1;
        }
        Plan::create([
            'name'=>$request->name,
            'description'=>$request->description,
            'price'=>$request->price,
            'is_free'=>$free
        ]);
        return Redirect(route('plan.index'))->withSuccess('plan added successfully');
    }
    public function edit($id){
        $data = plan::find($id);
        return view('admin.plan.edit',['plan'=>$data]);
    }
    public function update(Request $request,$id){
        $request->validate([
            'name' => 'required',
            'description' => 'required',
            'price' => 'required',
        ]);
        $free = 0 ;
        if($request->is_free == 'on'){
            $free=1;
        }
        Plan::where('id',$id)->update([
            'name'=>$request->name,
            'description'=>$request->description,
            'price'=>$request->price,
            'is_free'=>$free
        ]);
        return Redirect(route('plan.index'))->withSuccess('plan updated successfully');
    }
    public function destroy($id){
        $data = plan::find($id);
        $data->delete();
        return Redirect(route('plan.index'))->withSuccess('plan Deleted successfully');
    }
}
