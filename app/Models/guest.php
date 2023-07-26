<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class guest extends Model
{
    use HasFactory;
    protected $table = 'guest';
    protected $fillable = [
        'name',
        'phone',
        'email',
        'user_id',
        'facility_service_id',
        'type'
    ];
    public function User()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function facility_services()
    {
        return $this->belongsTo(facility_services::class, 'facility_service_id');
    }
    public function user_facility_log()
    {
        return $this->hasMany(user_facility_log::class);
    }

}
