<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class locker_user extends Model
{
    use HasFactory;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'locker_id',
        'user_id',
        'pin',
        'qr_code',
        'start_date',
        'end_date',
    ];

    protected $table = 'locker_user';
}