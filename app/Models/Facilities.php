<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facilities extends Model
{
    use HasFactory;
    protected $table = 'facility';
    protected $fillable = [
        'user_id',
        'facility_service_id',
        'date',
        'time',
        'qr',
        'status',
        'is_guest',
        'building_id',
        'special',
        'duration'
    ];
    public function User()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function facility_services()
    {
        return $this->belongsTo(facility_services::class, 'facility_service_id');
    }
}
