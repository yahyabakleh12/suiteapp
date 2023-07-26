<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class e_wallet_history extends Model
{
    use HasFactory;
    protected $table ='e_wallet_history'; 
    protected $fillable = [
        'transaction',
        'amount',
        'user_id',
        'type',
        'balance'
    ];
}
