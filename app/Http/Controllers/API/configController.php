<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\config;
use Illuminate\Http\Request;

class configController extends Controller
{
    
    public function config(){
    $config = config::first();
    return response()->json([
        'status' => 200,
        'locker_price' => $config->locker_charge_for_services,
        'show_staff'=>$config->show_staff
    ]);
    }
}
