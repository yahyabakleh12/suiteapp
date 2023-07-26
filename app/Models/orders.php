<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    use HasFactory;
    protected $table = 'orders';
    protected $fillable = [
        "frequency_id",
        "date",
        "time_slote",
        "user_id",
        "category_id",
        "houres",
        "professional",
        "material",
        "locker_id",
        "phone",
        "gender",
        "total_price",
        "note",
        "status",
        "frequency_status",
    ];
    public function services()
    {
        return $this->belongsTo(services::class, 'service_id');
    }
    public function frequency()
    {
        return $this->belongsTo(frequency::class, 'frequency_id');
    }
    public function categories()
    {
        return $this->belongsTo(categories::class, 'category_id');
    }
    // public function order_detail()
    // {
    //     return $this->hasMany(order_detail::class);
    // }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
