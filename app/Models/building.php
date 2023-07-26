<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class building extends Authenticatable
{
    use HasFactory;
    protected $guard = "building";
    protected $table = 'building';
    protected $fillable = [
        'name',
        'location',
        'parkonic_residantial',
        'area_id',
        'password'
    ];
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function users()
    {
        return $this->hasMany(User::class);
    }
    public function building_services()
    {
        return $this->hasMany(building_services::class);
    }
    public function area()
    {
        return $this->belongsTo(area::class,'area_id');
    }
}