<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class plan extends Model
{
    use HasFactory;
    protected $table = 'plan';
    protected $fillable = [
        'name',
        'description',
        'price',
        'is_free'
    ];
    public function subcategories_plan()
    {
        return $this->hasMany(subcategories_plan::class);
    }
    public function User()
    {
        return $this->hasMany(User::class);
    }
    public function service_plan()
    {
        return $this->hasMany(service_plan::class);
    }
}
