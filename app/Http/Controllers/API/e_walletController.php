<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\e_wallet_history;
use Illuminate\Http\Request;

class e_walletController extends Controller
{
    public function e_wallet_history(){
        $data = e_wallet_history::where('user_id',auth()->user()->id)->get();
        return response()->json([
            'status' => 200,
            'e_wallet_history' => $data,
        ]);
    }
}
