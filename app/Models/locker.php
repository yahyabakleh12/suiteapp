<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class locker extends Model
{
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'number',
        'building_id',
        'user_id',
        'pin',
        'qr_code',
        'start_date',
        'end_date',
        'status'
    ];

    protected $table = 'locker';
    public function order_detail()
    {
        return $this->hasMany(order_detail::class);
    }
}