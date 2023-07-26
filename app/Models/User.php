<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'phone',
        'appartment_number',
        'email',
        'password',
        'is_email_verified',
        'two_step',
        'agree',
        'building_id',
        'area_id',
        'device_key',
        'address',
        'area_address',
        'is_parkonic',
        'is_verfied',
        'active',
        'face',
        'rate',
        'nfc',
        'sync'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function building()
    {
        return $this->belongsTo(building::class, 'building_id');
    }
    public function plan()
    {
        return $this->belongsTo(plan::class, 'plan_id');
    }
    public function user_facility_bloking()
    {
        return $this->hasMany(user_facility_bloking::class);
    }
    public function guest()
    {
        return $this->hasMany(guest::class);
    }
    public function user_facility_log()
    {
        return $this->hasMany(user_facility_log::class);
    }
    public function Facilities()
    {
        return $this->hasMany(Facilities::class);
    }
}
