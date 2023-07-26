<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class notificationMangment extends Model
{
    use HasFactory;
    protected $table='notificationMangment';
    protected $fillable=[
        'notify'
    ];
}
