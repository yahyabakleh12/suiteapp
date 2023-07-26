<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class time_slote_subservices extends Model
{
    use HasFactory;
    protected $fillable = [
        'time_slote_id',
        'sub_services_id'

    ];
    protected $table = 'time_slote_subservices';
    public function subServices()
    {
        return $this->belongsTo(subServices::class, 'sub_services_id');
    }
    public function time_slote()
    {
        return $this->belongsTo(time_slote::class, 'time_slote_id');
    }
}
