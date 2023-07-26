<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\promotion_subservices;
use App\Models\promotions;
use App\Models\subServices;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class promoitionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = promotions::all();
        return view('admin.promotions.index', ['promotions' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data = subServices::all();
        return view('admin.promotions.create', ['subservices' => $data]);
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
            'subservice_id' => 'required',
            'discount' => 'required',
            'image' => ['required', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
        ]);
        if (request()->has('image')) {
            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/promotion_images/');
            $image->move($imagePath, $imageName);
        }
        $pic_url = 'http://192.168.20.242/parkonicHomeServices/public/promotion_images/' . $imageName;
        $promotion = promotions::create([
            'title' => $request->name,
            'discount' => $request->discount,
            'picture_url' => $pic_url,
            'picture_path' => '/promotion_images/' . $imageName
        ]);
        $total_price = 0;
        foreach ($request->subservice_id as $item) {
            $subservice = subServices::find($item);
            $percent = $subservice->price * ($request->discount / 100);
            $after_discount_price = $subservice->price - $percent;
            promotion_subservices::create([
                'subservice_id' => $item,
                'promotions_id' => $promotion->id,
                'price' => $after_discount_price
            ]);
            $total_price = $total_price + $after_discount_price;
        }
        $promotion->update([
            'total_price' => $total_price,
        ]);
        return Redirect(route('promotions.index'))->withSuccess('Promotion added successfully');
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
        $pro = promotions::find($id);
        $data = subServices::all();
        return view('admin.promotions.edit', ['subservices' => $data, 'promotion' => $pro]);
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
            'subservice_id' => 'required',
            'discount' => 'required',

        ]);
        $promotion = promotions::findOrFail($id);
        promotion_subservices::where('promotions_id', $promotion->id)->delete();
        $total_price = 0;
        foreach ($request->subservice_id as $item) {
            $subservice = subServices::findOrFail($item);
            $percent = $subservice->price * ($request->discount / 100);
            $after_discount_price = $subservice->price - $percent;
            promotion_subservices::create([
                'subservice_id' => $item,
                'promotions_id' => $promotion->id,
                'price' => $after_discount_price
            ]);
            $total_price = $total_price + $after_discount_price;
        }




        $imageName = substr($promotion->picture_path, strpos($promotion->picture_path, '/', 2) + 1);
        if (request()->has('image')) {
            $request->validate([

                'image' => ['required', 'image', 'mimes:jpg,jpeg,png', 'max:1024'],
            ]);


            $image = request()->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $imagePath = public_path('/promotion_images/');
            $image->move($imagePath, $imageName);
            $pic_url = 'http://192.168.20.242/parkonicHomeServices/public/promotion_images/' . $imageName;
            $promotion->update([
                'title' => $request->name,
                'discount' => $request->discount,
                'picture_url' => $pic_url,
                'picture_path' => '/promotion_images/' . $imageName
            ]);
        }else{
            $promotion->update([
                'title' => $request->name,
                'discount' => $request->discount,
               
            ]);
        }
        $promotion->update([
            'total_price' => $total_price,
        ]);
        return Redirect(route('promotions.index'))->withSuccess('promotion updated successfully');   
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $promotion = promotions::findOrFail($id);
        promotion_subservices::where('promotions_id', $promotion->id)->delete();
        $promotion->delete();
        return Redirect(route('promotions.index'))->withSuccess('promotion has been deleted successfully');    
    }
}
