<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\car_orders;
use App\Models\e_wallet_history;
use Illuminate\Http\Request;
use App\Models\categories;
use App\Models\frequency;
use App\Models\orders;
use App\Models\services;
use App\Models\subServices;
use Laravel\Ui\Presets\React;
use PhpParser\Node\Expr\FuncCall;

class categoriesController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {


        $categories = categories::with('frequency')->with('services')->get();
        foreach ($categories as $item) {
            $arr = array();
            $arr = explode("/", $item->discription, (substr_count($item->discription, '/') + 1));
            $item['discription'] = $arr;
            $arr1 = array();
            $arr1 = explode("/", $item->time_slote, (substr_count($item->time_slote, '/') + 1));
            $item['time_slote'] = $arr1;
        }
        return view('admin.categories.index', ['categories' => $categories]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $services = services::all();
        return view('admin.categories.create', ['services' => $services]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // dd($request);
        // die;
        $request->validate([
            'name' => 'required',
            'service_id' => 'required',
            'image' => ['required', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
            'frequency.*.title' => 'required',
            'frequency.*.description' => 'required',
            'frequency.*.number_of_dates' => 'required',
            'frequency.*.price' => 'required',
            'addmordescription.*' => 'required',
            'timeslote.*' => 'required'
        ]);
        $multipale_staff = 0;
        $multipale_houres = 0;
        $is_meterial = 0;
        $is_gender = 0;

        if ($request->multipale_staff == "on") {
            $multipale_staff = 1;
        }
        if ($request->multipale_houres == "on") {
            $multipale_houres = 1;
        }
        if ($request->meterial == "on") {
            $is_meterial = 1;
        }
        if ($request->is_gender == "on") {
            $is_gender = 1;
        }

        $description = '';
        foreach ($request->addmordescription as $item) {
            $description = $description . $item . '/';
        }

        $description = substr($description, 0, -1);
        $timeslote = '';
        foreach ($request->timeslote as $obj) {
            $timeslote = $timeslote . $obj . '/';
        }
        $timeslote = substr($timeslote, 0, -1);

        if (request()->has('image')) {
            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/categories_images/');
            $image->move($imagePath, $imageName);
        }
        $category = categories::create([
            'name' => $request->name,
            'services_id' => $request->service_id,
            'picture_path' => '/categories_images/' . $imageName,
            'discription' => $description,
            'picture_url' => url('/categories_images/' . $imageName),
            'time_slote' => $timeslote,
            'multipale_staff' => $multipale_staff,
            'multipale_houres' => $multipale_houres,
            'is_meterial' => $is_meterial,
            'is_gender' => $is_gender,
            'staff_price' => $request->staff_price,
            'hour_price'=>$request->hour_price,
            'meterial_price'=>$request->meterial_price,
            'price'=>$request->price
        ]);
     
        foreach ($request->frequency as $item1) {
            frequency::create([
                'title' => $item1['title'],
                'description' => $item1['description'],
                'number_of_dates' => $item1['number_of_dates'],
                'price' => $item1['price'],
                'category_id' => $category->id
            ]);
          
        }
        return Redirect(route('categories.index'))->withSuccess('category added successfully');
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
        $category = categories::findOrFail($id);
        $i = 0;
        $cat = array();
        $arr = array();
        $arr = explode("/", $category->discription, (substr_count($category->discription, '/') + 1));
        $category['discription'] = $arr;

        return view('admin.categories.edit', ['category' => $category, 'services' => $services]);
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
            'service_id' => 'required',

        ]);
        $category = categories::findOrFail($id);
        $imageName = substr($category->picture_path, strpos($category->picture_path, '/', 2) + 1);
        if (request()->has('image')) {
            $request->validate([

                'image' => ['required', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
            ]);


            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/categories_images/');
            $image->move($imagePath, $imageName);
        }
        categories::where('id', $id)->update([
            'name' => $request->name,
            'services_id' => $request->service_id,
            'picture_path' => '/categories_images/' . $imageName,

        ]);
        return Redirect(route('categories.index'))->withSuccess('category updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = categories::findOrFail($id);
        frequency::where('category_id',$id)->delete();
        $orders = orders::where('category_id',$id)->pluck('id')->toArray();
        car_orders::whereIn('order_id',$orders)->delete();
        orders::where('category_id',$id)->delete();
        $category->delete();
        return Redirect(route('categories.index'))->withSuccess('category deleted successfully');
    }
    public function add_category(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'services_id' => 'required',
        ]);
        categories::create([
            'name' => $request->name,
            'services_id' => $request->service_id
        ]);
        return Redirect(route('services.show', $request->service_id))->withSuccess('category added successfully');
    }
}
