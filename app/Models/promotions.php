<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class promotions extends Model
{
    use HasFactory;
    protected $table = 'promotion';
    protected $fillable = [
        'title',
        'discount',
        'picture_url',
        'picture_path',
        'total_price'
    ];
    public function promotion_subservices()
    {
        return $this->hasMany(promotion_subservices::class);
    }
}
