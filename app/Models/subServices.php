<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subServices extends Model
{
    use HasFactory;
    protected $table = 'sub_services';
    protected $fillable = [
        'name',
        'price',
        'service_id',
        'category_id',
        "promotion_from",
        "promotion_to",
        "discount",
        "number_of_dates"
    ];
    public function services()
    {
        return $this->belongsTo(services::class,'service_id');
    }
    public function categories()
    {
        return $this->belongsTo(categories::class,'category_id');
    }
    public function order_detail()
    {
        return $this->hasMany(order_detail::class);
    }
    public function time_slote_subservices()
    {
        return $this->hasMany(time_slote_subservices::class);
    }
    public function promotion_subservices()
    {
        return $this->hasMany(promotion_subservices::class);
    }
}
