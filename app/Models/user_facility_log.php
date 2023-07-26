<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class user_facility_log extends Model
{
    use HasFactory;
    protected $table = 'user_facility_log';
     protected $fillable = [
        'user_id',
        'facility_id',
        'building_id',
        'is_guest',
        'guest_id'
     ];
     public function User()
     {
         return $this->belongsTo(User::class, 'user_id');
     }
     public function facility_services()
     {
         return $this->belongsTo(facility_services::class, 'facility_id');
     }
     public function guest()
     {
         return $this->belongsTo(guest::class, 'guest_id');
     }

}
