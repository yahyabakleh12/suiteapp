<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\slider;
use Illuminate\Http\Request;

class sliderController extends Controller
{
    public function index()
    {
        $data = slider::all();
        return view('admin.slider.index',['sliders'=>$data]);
    }
    public function create()
    {
        return view('admin.slider.create');
    }
    public function store(Request $request)
    {
    }
    public function edit($id)
    {
    }
    public function update(Request $request, $id)
    {
    }
    public function destroy($id)
    {
    }
}
