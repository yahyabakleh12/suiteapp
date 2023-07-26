<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class visitor_address extends Model
{
    use HasFactory;
    protected $table = 'visitor_address';

    protected $fillable = [
        'address',
        'fcm'
    ];
}
