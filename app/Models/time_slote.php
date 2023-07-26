<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class time_slote extends Model
{
    use HasFactory;
    protected $fillable = [

    'time_from',
    'time_to'
    ]; 
    protected $table = 'time_slote';
    public function time_slote_subservices()
    {
        return $this->hasMany(time_slote_subservices::class);
    }
    public function order_date_time()
    {
        return $this->hasMany(order_date_time::class);
    }
}
