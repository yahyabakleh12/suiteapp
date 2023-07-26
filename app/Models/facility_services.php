<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class facility_services extends Model
{
    use HasFactory;
    protected $table = 'facility_services';
    protected $fillable = [
        'name',
        'start',
        'end',
        'building_id',
        'is_booking',
        'is_all_time',
        'device_key',
        'sharing',
        'duration'
    ];
    public function user_facility_bloking()
    {
        return $this->hasMany(user_facility_bloking::class);
    }
    public function user_facility_log()
    {
        return $this->hasMany(user_facility_log::class);
    }
    public function Facilities()
    {
        return $this->hasMany(Facilities::class);
    }
    public function guest()
    {
        return $this->hasMany(guest::class);
    }
}
