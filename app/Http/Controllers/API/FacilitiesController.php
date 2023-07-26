<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Facilities;
use App\Models\facility_services;
use App\Models\User;
use App\Models\user_facility_bloking;
use App\Models\user_facility_log;
use DateTime;
use Exception;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class FacilitiesController extends Controller
{
    public function guest_access($id1, $id2)
    {
        return view('guest_reg',['id1'=>$id1,'id2'=>$id2]);
       
      
    }
    public function guest_access2($id1, $id2,$special)
    {
        return view('guest_reg1',['id1'=>$id1,'id2'=>$id2,'special'=>$special]);
       
      
    }
    public function facility_services()
    {
        $data = facility_services::where('building_id', auth()->user()->building_id)->get();
        $blok = user_facility_bloking::where('user_id',auth()->user()->id)->get();
        foreach ($data as $item) {
              $item['block'] =0;
            foreach($blok as $obj){
                if($item->id == $obj->facility_id){
                    $item['block'] =1;
                }
            }
            $item['picture_url'] = url($item->image_path);
        }
        return response()->json([
            'status' => 200,
            'facility_services' => $data,
        ]);
    }
    public function available(Request $request, $id)
    {
        $data = Facilities::where('user_id', auth()->user()->id)->where('facility_service_id', $id)->where('date', $request->date)->first();
        $facility = facility_services::find($id);

        if (empty($data)) {
            $startTime = strtotime($facility->start);
            $endTime   = strtotime($facility->end);

            $arrInterval = [];
            while ($endTime >= $startTime) {
                $valid = Facilities::where('facility_service_id', $id)->where('date', $request->date)->pluck('time')->toArray();
                if (!in_array(date("H:i:s", $startTime), $valid)) {
                    $arrInterval[] = date("H:i:s", $startTime);
                    $startTime = strtotime('+'.$facility->duration.' minutes', $startTime);
                }
            }
            return response()->json([
                'status' => 200,
                'available' => $arrInterval,
            ]);
        } else {
            return response()->json([
                'status' => 403,
                'message' => 'You have a booking at the same day at ' . $data->time,
            ]);
        }
    }

    public function facility($id)
    {
        $facility = facility_services::find($id);
        Facilities::where('user_id', auth()->user()->id)->where('facility_service_id', $facility->id)->delete();
        $qr = auth()->user()->id . '_' . $facility->id . '_sl_' . Str::random(64);
        $guest_qr = 'guest_' . auth()->user()->id . '_' . $facility->id . '_sl_' . Str::random(64);
        Facilities::create([
            'user_id' => auth()->user()->id,
            'facility_service_id' => $id,
            'qr' => $qr,
            'status' => 0,
            'building_id' => auth()->user()->building_id
        ]);
        Facilities::create([
            'user_id' => auth()->user()->id,
            'facility_service_id' => $id,
            'qr' => $guest_qr,
            'status' => 0,
            'is_guest' => 1,
            'building_id' => auth()->user()->building_id
        ]);
        $url = 'https://suitelife.ae/guest_qr_code/' . $id . '/' . auth()->user()->id;
        return response()->json([
            'status' => 200,
            'Qr' => $qr,
            'is_booking' => $facility->is_booking,
            'url' => $url,
            'sharing' => $facility->sharing
        ]);
    }
    public function book(Request $request, $id)
    {

        $validator = Validator::make($request->all(), [
            'date' => 'required',
            'time' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            $fa = facility_services::find($id);
            $special = rand(1111, 9999);

            $date = $request->date;
            $time = $request->time;
            $special = rand(1111, 9999);
            $qr = auth()->user()->id . '_' . $id . '_' . $special . '_sl_' . Str::random(64);
            Facilities::create([
                'user_id' => auth()->user()->id,
                'date' => $date,
                'time' => $time,
                'qr' => $qr,
                'status' => 0,
                'facility_service_id' => $id,
                'building_id' => auth()->user()->building_id,
                'special' => $special,
                'duration'=>$fa->duration
            ]);
            $special = rand(1111, 9999);
            $qr = 'guest_'.auth()->user()->id . '_' . $id . '_' . $special . '_sl_' . Str::random(64);
            Facilities::create([
                'user_id' => auth()->user()->id,
                'date' => $date,
                'time' => $time,
                'qr' => $qr,
                'status' => 0,
                'facility_service_id' => $id,
                'building_id' => auth()->user()->building_id,
                'special' => $special,
                'is_guest' => 1,
                  'duration'=>$fa->duration
            ]);
            return response()->json([
                'status' => 200,
                'message' => 'We reserved the date and time for you!'
            ]);
        }
    }
    public function check_nfc(Request $request,$device_id){
        $validator = Validator::make($request->all(), [
            'nfc' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            // try{
                $nuser =  User::where('nfc',$request->nfc)->first();
                if(!empty($nuser)){
                $user_id = $nuser->id;
                $user = User::findOrFail($user_id);
                $guest= 0;
                $guest_id = 0;
                $facilities = facility_services::where('device_key', $device_id)->first();
                $facilities2 =  facility_services::where('building_id',$user->building_id)->pluck('device_key')->toArray();
                if ($user->building_id == $facilities->building_id) {
                    if ($user->active == 1) {
                        if (in_array($device_id,$facilities2)) {
                            if ($facilities->is_all_time == 1) {

                                $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                // if ($guest == 1) {
                                //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->first();
                                // } else {
                                //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->first();
                                // }
                                // if ($Valid->qr == $request->qr) {
                                if (!empty($bloked)) {
                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Unauthorized Access.Your QR Code is unauthorized to access.Kindly contact building management at 800-72756642 for assistance. Thank you!   '
                                    ]);
                                }
                                // if ($guest == 1) {
                                //     user_facility_log::create([
                                //         'user_id' => $user_id,
                                //         'facility_id' => $facilities->id,
                                //         'guest_id' => $guest_id,
                                //         'building_id' => $facilities->building_id,
                                //         'is_guest' => 1
                                //     ]);
                                // } else {
                                //     user_facility_log::create([
                                //         'user_id' => $user_id,
                                //         'facility_id' => $facilities->id,
                                //         'building_id' => $facilities->building_id,
                                //     ]);
                                // }
                                $user->update([
                                    'nfc'=>null
                                ]);
                                return response()->json([
                                    'status' => 200,
                                    'message' => 'Access Approved Thank you! '
                                ]);
                                // } else {
                                //     return response()->json([
                                //         'status' => 403,
                                //         'message' => 'Access Denied.Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.Thank you !'
                                //     ]);
                                // }
                            } elseif ($facilities->is_booking == 1) {
                                $current_time = time();
                                $arr = explode("_", $request->qr, 5);
                                //  dd($arr);
                                //  die;
                                $user_id = $arr[0];

                                $facility_service_id = $arr[1];
                                $special = $arr[2];

                                if ($current_time >= strtotime($facilities->start) && strtotime($facilities->end) >= $current_time) {
                                    $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                    // if ($guest == 1) {

                                    //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->where('special', $special)->first();
                                    // } else {

                                    //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('special', $special)->first();
                                    // }

                                    // if ($Valid->qr == $request->qr) {
                                        $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('special', $special)->first();
                                        if (!empty($bloked)) {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Unauthorized Access.Your QR Code is unauthorized to access ' . $facilities->name . '.  Kindly contact building management at 800-72756642 for assistance. Thank you! '
                                            ]);
                                        }

                                        $currentDate = date('Y-m-d');

                                        if (strtotime($currentDate) == strtotime($Valid->date) && $current_time >= strtotime($Valid->time) && (strtotime($Valid->time) + (($Valid->duration) * 60)) >= $current_time) {


                                            Facilities::where('id', $Valid->id)->update([
                                                'status' => 1
                                            ]);
                                            // if ($guest == 1) {
                                            //     user_facility_log::create([
                                            //         'user_id' => $user_id,
                                            //         'facility_id' => $facilities->id,
                                            //         'guest_id' => $guest_id,
                                            //         'building_id' => $facilities->building_id,
                                            //         'is_guest' => 1
                                            //     ]);
                                            // } else {
                                            //     user_facility_log::create([
                                            //         'user_id' => $user_id,
                                            //         'facility_id' => $facilities->id,
                                            //         'building_id' => $facilities->building_id,
                                            //     ]);
                                            // }
                                            // if ($guest == 1) {
                                            //     user_facility_log::create([
                                            //         'user_id' => $user_id,
                                            //         'facility_id' => $facilities->id,
                                            //         'guest_id' => $guest_id,
                                            //         'building_id' => $facilities->building_id,
                                            //         'is_guest' => 1
                                            //     ]);
                                            // } else {
                                            //     user_facility_log::create([
                                            //         'user_id' => $user_id,
                                            //         'facility_id' => $facilities->id,
                                            //         'building_id' => $facilities->building_id,
                                            //     ]);
                                            // }
                                            $user->update([
                                                'nfc'=>null
                                            ]);
                                            return response()->json([
                                                'status' => 200,
                                                'message' => 'Access Approved  Thank you!'
                                            ]);
                                        } else {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Access Denied.Your scheduled access time is in ' . $Valid->date . ' at ' . $Valid->time . '. Please wait until your scheduled time to scan the QR code.'
                                            ]);
                                        }
                                    // } else {
                                    //     return response()->json([
                                    //         'status' => 403,
                                    //         'message' => 'Access Denied.  Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.  Thank you!'
                                    //     ]);
                                    // }
                                } else {

                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Sorry, ' . $facilities->name . ' is currently closed.  Operation hours are from ' . $facilities->start . ' to ' . $facilities->end . ' Thank you! '
                                    ]);
                                }
                            } else {
                                $current_time = time();

                                if ($current_time >= strtotime($facilities->start) && strtotime($facilities->end) >= $current_time) {
                                    $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                    // if ($guest == 1) {
                                    //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->first();
                                    // } else {
                                    //     $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->first();
                                    // }
                                    // if ($Valid->qr == $request->qr) {
                                        if (!empty($bloked)) {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Unauthorized Access.  Your QR Code is unauthorized to access ' . $facilities->name . '. Kindly contact building management at 800-72756642 for assistance. Thank you! '
                                            ]);
                                        }
                                        // if ($guest == 1) {
                                        //     user_facility_log::create([
                                        //         'user_id' => $user_id,
                                        //         'facility_id' => $facilities->id,
                                        //         'guest_id' => $guest_id,
                                        //         'building_id' => $facilities->building_id,
                                        //         'is_guest' => 1
                                        //     ]);
                                        // } else {
                                        //     user_facility_log::create([
                                        //         'user_id' => $user_id,
                                        //         'facility_id' => $facilities->id,
                                        //         'building_id' => $facilities->building_id,
                                        //     ]);
                                        // }
                                        $user->update([
                                            'nfc'=>null
                                        ]);
                                        return response()->json([
                                            'status' => 200,
                                            'message' => 'Access Approved Thank you! '
                                        ]);
                                    // } else {
                                    //     return response()->json([
                                    //         'status' => 403,
                                    //         'message' => 'Access Denied.   Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.  Thank you!'
                                    //     ]);
                                    // }
                                } else {

                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Sorry, ' . $facilities->name . ' is currently closed.   Operation hours are from ' . $facilities->start . ' to ' . $facilities->end . ' Thank you! '
                                    ]);
                                }
                            }
                        } else {
                            return response()->json([
                                'status' => 403,
                                'message' => 'Invalid QR Code  Your QR Code is unauthorized to access ' . $facilities->name . '.  Please contact building management at 800-72756642 for assistance.Thank you!'
                            ]);
                        }
                    } else {
                        return response()->json([
                            'status' => 403,
                            'message' => 'Invalid QR Code Sorry, it seems that you are currently not an active user.Please contact building management at 800-72756642 for assistance.Thank you!'
                        ]);
                    }
                } else {
                    return response()->json([
                        'status' => 403,
                        'message' => 'sorry you are not registerd in this building'
                    ]);
                }
            }else{
                return response()->json([
                    'status' => 403,
                    'message' => 'You have already used your offline access key please get internet connection to get access again'
                ]);
            }
            // }catch (Exception $error) {
            //     return response()->json([
            //         'status' => 500,
            //         'message' => 'Sorry, we are experiencing technical issues with the QR code scanner.  Please contact building management at 800-72756642 for assistance. Thank you!',

            //     ]);
            // }
        }
    }
    public function check_qr(Request $request, $device_id)
    {
        $validator = Validator::make($request->all(), [
            'qr' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 501,
                'validation_errors' => $validator->messages(),
            ]);
        } else {
            try {
                $arr = explode("_", $request->qr, 3);
              
                $user_id = $arr[0];

                $facility_service_id = $arr[1];
                $guest = 0;
                if ($user_id == 'guest') {
                    $arr = explode("_", $request->qr, 7);
                    //  dd($arr);
                    //  die;
                    $user_id = $arr[1];
                    $guest = 1;
                    $facility_service_id = $arr[2];
                    $guest_id = $arr[5];
                }
                $user = User::findOrFail($user_id);
                $facilities = facility_services::where('device_key', $device_id)->first();
                $facilities2 =  facility_services::find($facility_service_id);
                if ($user->building_id == $facilities->building_id) {
                    if ($user->active == 1) {
                        if ($facilities2->device_key == $device_id) {
                            if ($facilities->is_all_time == 1) {

                                $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                if ($guest == 1) {
                                    $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->first();
                                } else {
                                    $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->first();
                                }
                                if ($Valid->qr == $request->qr) {
                                    if (!empty($bloked)) {
                                        return response()->json([
                                            'status' => 403,
                                            'message' => 'Unauthorized Access.Your QR Code is unauthorized to access.Kindly contact building management at 800-72756642 for assistance. Thank you!   '
                                        ]);
                                    }
                                    if($guest == 1){
                                        user_facility_log::create([
                                            'user_id'=>$user_id,
                                            'facility_id'=>$facilities->id,
                                            'guest_id'=>$guest_id,
                                            'building_id'=>$facilities->building_id,
                                            'is_guest'=>1
                                        ]);
                                    }else{
                                        user_facility_log::create([
                                            'user_id'=>$user_id,
                                            'facility_id'=>$facilities->id,
                                            'building_id'=>$facilities->building_id,
                                        ]);
                                    }
                                    $user->update([
                                        'nfc'=>null
                                    ]);
                                    return response()->json([
                                        'status' => 200,
                                        'message' => 'Access Approved Thank you! '
                                    ]);
                                } else {
                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Access Denied.Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.Thank you !'
                                    ]);
                                }
                            } elseif ($facilities->is_booking == 1) {
                                $current_time = time();
                                $arr = explode("_", $request->qr, 5);
                                //  dd($arr);
                                //  die;
                                $user_id = $arr[0];

                                $facility_service_id = $arr[1];
                                $special = $arr[2];

                                if ($current_time >= strtotime($facilities->start) && strtotime($facilities->end) >= $current_time) {
                                    $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                    if ($guest == 1) {

                                        $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->where('special', $special)->first();
                                    } else {

                                        $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('special', $special)->first();
                                        
                                    }
                                     
                                    if ($Valid->qr == $request->qr) {

                                        if (!empty($bloked)) {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Unauthorized Access.Your QR Code is unauthorized to access ' . $facilities->name . '.  Kindly contact building management at 800-72756642 for assistance. Thank you! '
                                            ]);
                                        }
                                        
                                        $currentDate = date('Y-m-d');

                                        if (strtotime($currentDate) == strtotime($Valid->date) && $current_time >= strtotime($Valid->time) && (strtotime($Valid->time) + (($Valid->duration)*60)) >= $current_time) {
                                           
                                               
                                                Facilities::where('id', $Valid->id)->update([
                                                    'status' => 1
                                                ]);
                                                if($guest == 1){
                                                    user_facility_log::create([
                                                        'user_id'=>$user_id,
                                                        'facility_id'=>$facilities->id,
                                                        'guest_id'=>$guest_id,
                                                        'building_id'=>$facilities->building_id,
                                                        'is_guest'=>1
                                                    ]);
                                                }else{
                                                    user_facility_log::create([
                                                        'user_id'=>$user_id,
                                                        'facility_id'=>$facilities->id,
                                                        'building_id'=>$facilities->building_id,
                                                    ]);
                                                }
                                                if($guest == 1){
                                                    user_facility_log::create([
                                                        'user_id'=>$user_id,
                                                        'facility_id'=>$facilities->id,
                                                        'guest_id'=>$guest_id,
                                                        'building_id'=>$facilities->building_id,
                                                        'is_guest'=>1
                                                    ]);
                                                }else{
                                                    user_facility_log::create([
                                                        'user_id'=>$user_id,
                                                        'facility_id'=>$facilities->id,
                                                        'building_id'=>$facilities->building_id,
                                                    ]);
                                                }
                                                return response()->json([
                                                    'status' => 200,
                                                    'message' => 'Access Approved  Thank you!'
                                                ]);
                                           
                                        } else {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Access Denied.Your scheduled access time is in ' . $Valid->date . ' at ' . $Valid->time . '. Please wait until your scheduled time to scan the QR code.'
                                            ]);
                                        }
                                    } else {
                                        return response()->json([
                                            'status' => 403,
                                            'message' => 'Access Denied.  Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.  Thank you!'
                                        ]);
                                    }
                                } else {

                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Sorry, ' . $facilities->name . ' is currently closed.  Operation hours are from ' . $facilities->start . ' to ' . $facilities->end . ' Thank you! '
                                    ]);
                                }
                            } else {
                                $current_time = time();

                                if ($current_time >= strtotime($facilities->start) && strtotime($facilities->end) >= $current_time) {
                                    $bloked = user_facility_bloking::where("user_id", $user_id)->where('facility_id', $facilities->id)->first();
                                    if ($guest == 1) {
                                        $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->where('is_guest', 1)->first();
                                    } else {
                                        $Valid = Facilities::where('user_id', $user_id)->where('facility_service_id', $facilities->id)->first();
                                    }
                                    if ($Valid->qr == $request->qr) {
                                        if (!empty($bloked)) {
                                            return response()->json([
                                                'status' => 403,
                                                'message' => 'Unauthorized Access.  Your QR Code is unauthorized to access ' . $facilities->name . '. Kindly contact building management at 800-72756642 for assistance. Thank you! '
                                            ]);
                                        }
                                        if($guest == 1){
                                            user_facility_log::create([
                                                'user_id'=>$user_id,
                                                'facility_id'=>$facilities->id,
                                                'guest_id'=>$guest_id,
                                                'building_id'=>$facilities->building_id,
                                                'is_guest'=>1
                                            ]);
                                        }else{
                                            user_facility_log::create([
                                                'user_id'=>$user_id,
                                                'facility_id'=>$facilities->id,
                                                'building_id'=>$facilities->building_id,
                                            ]);
                                        }
                                        return response()->json([
                                            'status' => 200,
                                            'message' => 'Access Approved Thank you! '
                                        ]);
                                    } else {
                                        return response()->json([
                                            'status' => 403,
                                            'message' => 'Access Denied.   Sorry, your QR code is invalid. Please request a Suite Life QR code from the resident or your host.  Thank you!'
                                        ]);
                                    }
                                } else {

                                    return response()->json([
                                        'status' => 403,
                                        'message' => 'Sorry, ' . $facilities->name . ' is currently closed.   Operation hours are from ' . $facilities->start . ' to ' . $facilities->end . ' Thank you! '
                                    ]);
                                }
                            }
                        } else {
                            return response()->json([
                                'status' => 403,
                                'message' => 'Invalid QR Code  Your QR Code is unauthorized to access ' . $facilities->name . '.  Please contact building management at 800-72756642 for assistance.Thank you!'
                            ]);
                        }
                    } else {
                        return response()->json([
                            'status' => 403,
                            'message' => 'Invalid QR Code Sorry, it seems that you are currently not an active user.Please contact building management at 800-72756642 for assistance.Thank you!'
                        ]);
                    }
                } else {
                    return response()->json([
                        'status' => 403,
                        'message' => 'sorry you are not registerd in this building'
                    ]);
                }
            } catch (Exception $error) {
                return response()->json([
                    'status' => 500,
                    'message' => 'Sorry, we are experiencing technical issues with the QR code scanner.  Please contact building management at 800-72756642 for assistance. Thank you!',

                ]);
            }
        }
    }
    public function get_booking($id)
    {
        $facilities = Facilities::where('user_id', auth()->user()->id)->where('is_guest', 0)->where('facility_service_id', $id)->with('facility_services')->orderBy('id')->get();
       foreach($facilities as $item){
        $url = 'https://suitelife.ae/guest_qr_code/' . $id . '/' . auth()->user()->id.'/'.$item->special;
        $item['url'] = $url;
       }
        return response()->json([
            'status' => 200,
            'facilities' => $facilities,
        ]);
    }
}
