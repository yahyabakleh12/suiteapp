<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\locker;
use App\Models\locker_user;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class LockerController extends Controller
{
    public function book(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'start_date' => 'required',
            'end_date' => 'required',
            'pin' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {

            if(auth()->user()->building_id !=0){
                $user_lockers = locker_user::where('user_id', auth()->user()->id)->count();
                $user_lockers++;
                if ($user_lockers > 2) {
                    return response()->json([
                        'status' => 205,
                        'message' => 'You have reached the maximum Locker reservation allowed!',
                    ]);
                } else {
                    $locker_for_user = locker::where('building_id', auth()->user()->building_id)->pluck('id')->toArray();
                    $reserved_locker = locker_user::whereIn('locker_id', $locker_for_user)->groupBy('locker_id')->pluck('locker_id')->toArray();
                    // dd($reserved_locker);
                    // die;
                    if (!$reserved_locker) {
                        $locker = locker::where('building_id', auth()->user()->building_id)->first();
                        locker_user::create([
                            'locker_id' => $locker->id,
                            'user_id' => auth()->user()->id,
                            'pin' => Hash::make($request->pin),
                            'qr_code' => Hash::make(Str::random(64)),
                            'start_date' => $request->start_date,
                            'end_date' => $request->end_date
                        ]);
                        return response()->json([
                            'status' => 200,
                            'message' => 'Your Locker has been reserved successfully',
                        ]);
                    } elseif (count($reserved_locker) < count($locker_for_user)) {
                        $locker = locker::whereNotIn('id', $reserved_locker)->first();
                        locker_user::create([
                            'locker_id' => $locker->id,
                            'user_id' => auth()->user()->id,
                            'pin' => Hash::make($request->pin),
                            'qr_code' => Hash::make(Str::random(64)),
                            'start_date' => $request->start_date,
                            'end_date' => $request->end_date
                        ]);
                        return response()->json([
                            'status' => 200,
                            'message' => 'Your Locker has been reserved successfully',
                        ]);
                    } else {
                        $reserved_in_same_day = locker_user::whereIn('locker_id', $locker_for_user)->whereDate('start_date', $request->start_date)->whereDate('end_date', $request->end_date)->pluck('locker_id')->toArray();
                        if (!$reserved_in_same_day) {
                            $reserved_between = locker_user::whereIn('locker_id', $locker_for_user)->whereBetween('start_date', [$request->start_date, $request->end_date])->whereBetween('end_date', [$request->start_date, $request->end_date])->pluck('locker_id')->toArray();

                            if (!$reserved_between) {
                                $locker = locker::whereIn('id', $locker_for_user)->first();
                                locker_user::create([
                                    'locker_id' => $locker->id,
                                    'user_id' => auth()->user()->id,
                                    'pin' => Hash::make($request->pin),
                                    'qr_code' => Hash::make(Str::random(64)),
                                    'start_date' => $request->start_date,
                                    'end_date' => $request->end_date
                                ]);
                                return response()->json([
                                    'status' => 200,
                                    'message' => 'Your Locker has been reserved successfully',
                                ]);
                            } else {
                                $reserved_between1 = locker_user::whereIn('locker_id', $locker_for_user)->whereNotIn('locker_id', $reserved_between)->pluck('locker_id')->toArray();
                                if (!$reserved_between1) {
                                    return response()->json([
                                        'status' => 205,
                                        'message' => 'Sorry, There is no available Lockers in this date!',
                                    ]);
                                } else {
                                    $locker = locker::whereIn('id', $reserved_between1)->first();
                                    locker_user::create([
                                        'locker_id' => $locker->id,
                                        'user_id' => auth()->user()->id,
                                        'pin' => Hash::make($request->pin),
                                        'qr_code' => Hash::make(Str::random(64)),
                                        'start_date' => $request->start_date,
                                        'end_date' => $request->end_date
                                    ]);
                                    return response()->json([
                                        'status' => 200,
                                        'message' => 'Your Locker has been reserved successfully',
                                    ]);
                                }

                            }



                        } else {
                            $reserved_between2 = locker_user::whereIn('locker_id', $locker_for_user)->whereBetween('start_date', [$request->start_date, $request->end_date])->whereBetween('end_date', [$request->start_date, $request->end_date])->pluck('locker_id')->toArray();
                            if (!$reserved_between2) {
                                $locker = locker::whereIn('id', $locker_for_user)->whereNotIn('id', $reserved_in_same_day)->first();
                                locker_user::create([
                                    'locker_id' => $locker->id,
                                    'user_id' => auth()->user()->id,
                                    'pin' => Hash::make($request->pin),
                                    'qr_code' => Hash::make(Str::random(64)),
                                    'start_date' => $request->start_date,
                                    'end_date' => $request->end_date
                                ]);
                                return response()->json([
                                    'status' => 200,
                                    'message' => 'Your Locker has been reserved successfully',
                                ]);
                            } else {
                                $reserved_between3 = locker_user::whereIn('locker_id', $locker_for_user)->whereNotIn('locker_id', $reserved_between2)->pluck('locker_id')->toArray();
                                if (!$reserved_between3) {
                                    return response()->json([
                                        'status' => 205,
                                        'message' => 'Sorry, There is no available Lockers in this date!',
                                    ]);
                                } else {
                                    $locker = locker::whereIn('id', $reserved_between3)->first();
                                    locker_user::create([
                                        'locker_id' => $locker->id,
                                        'user_id' => auth()->user()->id,
                                        'pin' => Hash::make($request->pin),
                                        'qr_code' => Hash::make(Str::random(64)),
                                        'start_date' => $request->start_date,
                                        'end_date' => $request->end_date
                                    ]);
                                    return response()->json([
                                        'status' => 200,
                                        'message' => 'Your Locker has been reserved successfully',
                                    ]);
                                }
                            }
                        }
                    }
                }}else{
                return response()->json([
                    'status' => 401,
                    'message' => 'Please choose your building !',
                ]);
            }
        }
    }
    public function user_lockers()
    {

        $lockers = locker::where('user_id', auth()->user()->id)->get();
        foreach ($lockers as $item) {
        }
        return response()->json([
            'status' => 200,
            'lockers' => $lockers,
        ]);
    }
    public function Qr_scan(Request $request){
        $validator = Validator::make($request->all(), [
            'code' => 'required',
            'locker_id' => 'required',
            'Qr_code' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            return response()->json([
                'status' => 200,
                'locker_id'=>$request->locker_id,
                'board_number'=>rand(1,99),
                'box_number'=>rand(1,50),
                'message' =>'locker opening',
            ]);
        }
    }
    public function regenerate(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'pin' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            locker::where('id', $id)->update([
                'pin' => $request->pin,
                'qr_code' => Str::random(64),
                'status' => 1
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'Your pin and QR Code has been regenerated successfully',
            ]);
        }
    }
    public function cancel($id)
    {
        locker::where('id', $id)->where('user_id', auth()->user()->id)->update([
            'user_id' => null,
            'pin' => null,
            'qr_code' => null,
            'start_date' => null,
            'end_date' => null,
            'status' => 0
        ]);
        return response()->json([
            'status' => 200,
            'message' => 'Your locker has been canceled successfully',
        ]);
    }
}