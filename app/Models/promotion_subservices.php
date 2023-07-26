<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class promotion_subservices extends Model
{
    use HasFactory;

    protected $fillable = [
        'promotions_id',
        'subservice_id',
        'price'
    ];

    protected $table = 'promotion_subservices';
    public function promotions()
    {
        return $this->belongsTo(promotions::class,'promotions_id');
    }
    public function subServices()
    {
        return $this->belongsTo(subServices::class,'subservice_id');
    }
}
