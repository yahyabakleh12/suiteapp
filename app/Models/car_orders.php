<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class car_orders extends Model
{
    use HasFactory;
    protected $table = 'order_car';
    protected $fillable = [
        'car_id',
        'order_id',
        'status'
    ];
}
