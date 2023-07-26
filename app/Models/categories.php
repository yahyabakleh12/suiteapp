<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class categories extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'services_id',
        'picture_path',
        'discription',
        'multipale_staff',
        'staff_price',
        'multipale_houres',
        'hour_price',
        'is_meterial',
        'meterial_price',
        'time_slote',
        'is_gender'
        
    ];
    protected $table = 'categories';
    public function services()
    {
        return $this->belongsTo(services::class,'services_id');
    }
    // public function subServices()
    // {
    //     return $this->hasMany(subServices::class);
    // }
    // public function order_detail()
    // {
    //     return $this->hasMany(order_detail::class);
    // }
    public function orders()
    {
        return $this->hasMany(orders::class);
    }
    public function frequency()
    {
        return $this->hasMany(frequency::class,'category_id');
    }
}
