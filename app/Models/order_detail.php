<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class order_detail extends Model
{
    use HasFactory;
    protected $table = 'order_details';
    protected $fillable = [

        "orders_id",
        "subservice_id",
        "staff_id",
        "is_locker",
        "locker_id",
        "phone",
        "status",
        "service_type",
        "car_id",
        "appartment_number",
        'categories_id',
        'price'
    ];
    public function orders()
    {
        return $this->belongsTo(orders::class, 'orders_id');
    }
    public function subServices()
    {
        return $this->belongsTo(subServices::class, 'subservice_id');
    }
    public function categories()
    {
        return $this->belongsTo(categories::class, 'categories_id');
    }
    public function staff()
    {
        return $this->belongsTo(staff::class, 'staff_id');
    }
    public function cars()
    {
        return $this->belongsTo(cars::class, 'car_id');
    }
    public function locker()
    {
        return $this->belongsTo(locker::class, 'locker_id');
    }
    public function order_date_time()
    {
        return $this->hasMany(order_date_time::class);
    }
}
