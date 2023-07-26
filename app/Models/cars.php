<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class cars extends Model
{
    use HasFactory;
    protected $table = 'cars';
    protected $fillable = [
        'emirate',
        'plate_code',
        'type',
        'plate_number',
        'user_id'
    ];
    public function order_detail()
    {
        return $this->hasMany(order_detail::class);
    }
}
