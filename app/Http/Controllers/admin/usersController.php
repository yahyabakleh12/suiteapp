<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\building;
use App\Models\User;
use App\Models\locker_user;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class usersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = User::all();;
        return view('admin.users.index', ['users' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $buildings = building::all();
        return view('admin.users.create', ['buildings' => $buildings]);
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
            'phone' => 'required|max:10|unique:users',
            'appartment_number' => 'required',
            'email' => 'required|max:191|unique:users',
            'building_id' => 'required',
            'password' => [
                'required',
                Password::min(8)
                    ->letters()
                    ->mixedCase()
                    ->numbers()
                    ->symbols()
                    ->uncompromised(),
                'confirmed'
            ],

        ]);
        if ($request->two_step == 'on') {
            $two = 1;
        } else {
            $two = 0;
        }
        $b= building::find($request->building_id);
        $area_id = $b->area_id;
        User::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'appartment_number' => $request->appartment_number,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'two_step' => $two,
            'agree' => 1,
            'building_id' => $request->building_id,
            'area_id'=>$area_id
        ]);
        return Redirect(route('users.index'))->withSuccess('user added successfully');
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
        $user = User::findOrFail($id);
        $buildings = building::all();
        return view('admin.users.edit', ['user' => $user, 'buildings' => $buildings]);
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
            'appartment_number' => 'required',
            'building_id' => 'required'
        ]);
        if ($request->two_step == 'on') {
            $two = 1;
        } else {
            $two = 0;
        }
        $user = User::findOrFail($id);
        if ($request->email != $user->email) {
            $request->validate([
                'email' => 'required|max:191|unique:users',
            ]);
        }
        if ($request->phone != $user->phone) {
            $request->validate([ 
                'phone' => 'required|max:10|unique:users',
            ]);
        }
        if ($request->password !=  "") {
            $request->validate([
                'password' => [
                    'required',
                    Password::min(8)
                        ->letters()
                        ->mixedCase()
                        ->numbers()
                        ->symbols()
                        ->uncompromised(),
                    'confirmed'
                ],
            ]);
            $b= building::find($request->building_id);
            $area_id = $b->area_id;
            User::where('id', $id)->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'appartment_number' => $request->appartment_number,
                'email' => $request->email,
                'two_step' => $two,
                'building_id' => $request->building_id,
                'area_id'=>$area_id

            ]);
            return Redirect(route('users.index'))->withSuccess('user updated successfully');
        } else {
            $b= building::find($request->building_id);
            $area_id = $b->area_id;
            User::where('id', $id)->update([
                'name' => $request->name,
                'phone' => $request->phone,
                'appartment_number' => $request->appartment_number,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'two_step' => $two,
                'building_id' => $request->building_id,
                'area_id'=>$area_id

            ]);
            return Redirect(route('users.index'))->withSuccess('user updated successfully');
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
        $lockers = locker_user::where('user_id', $id)->get();
        foreach ($lockers as $locker) {
            $locker->delete();
        }
        $user = User::findOrFail($id);
        $user->delete();
        return Redirect(route('users.index'))->withSuccess('user with his lockers has been deleted successfully');
    }
    public static function count(){
        $count = User::count();
        return $count;
    }
}
