<?php

namespace App\Http\Controllers;

use App\Models\orders;
use Illuminate\Http\Request;

class firbaseController extends Controller
{
    public function push_notification_android($device_key, $title, $message)
    {
        $SERVER_API_KEY = 'AAAAJL_xoUU:APA91bGYfSl7xZYBPKiPphQYmAZMRBTT-LNFsIsafsXDMwVyigrt2Zk1tbvXUvs5VQ9dh6m_HrVwN4XgiTzchtCo5LJ1CItsy_6WUHx4vPjDPboogzSlLrSuSveoNBNkvavVz3T5noBl';

        $data = [
            "registration_ids" => [$device_key],
            "notification" => [
                "title" => $title,
                "body" => $message,
            ]
        ];
        $dataString = json_encode($data);

        $headers = [
            'Authorization: key=' . $SERVER_API_KEY,
            'Content-Type: application/json',
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $dataString);

        $response = curl_exec($ch);
        return $response;
    }
    public function test(){
        //this get 
        return view('test');
    }
    public function test1(){
        
        // this is post 
        return view('test2');
    }
}
