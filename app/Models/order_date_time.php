<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class order_date_time extends Model
{
    use HasFactory;
    protected $table='order_date_time';
    protected $fillable = [
        'time_to',
        'time_from',
        'order_detail_id',
        'status ',
        'date'
    ];
    public function order_detail()
    {
        return $this->belongsTo(order_detail::class, 'order_detail_id');
    }
    public function time_slote()
    {
        return $this->belongsTo(time_slote::class, 'time_slote_id');
    }
}
