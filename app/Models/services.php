<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class services extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'picture_path',
        'item_type',
        'is_membership',
        'is_order',
        'plan_id'
    ];

    protected $table = 'services';
    public function building_services()
    {
        return $this->hasMany(building_services::class);
    }
    public function subcategories()
    {
        return $this->hasMany(subcategories::class);
    }
    public function staff()
    {
        return $this->hasMany(staff::class);
    }
    public function orders()
    {
        return $this->hasMany(orders::class);
    }
    public function subServices()
    {
        return $this->hasMany(subServices::class);
    }
    public function categories()
    {
        return $this->hasMany(categories::class);
    }
    public function service_plan()
    {
        return $this->hasMany(service_plan::class);
    }
}