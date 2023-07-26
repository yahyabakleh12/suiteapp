<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class frequency extends Model
{
    use HasFactory;
    protected $table = 'frequency';
    protected $fillable = [
        'title',
        'description',
        'number_of_dates',
        'category_id',
        'price'
    ];
    public function orders()
    {
        return $this->hasMany(orders::class);
    }
    public function categories()
    {
        return $this->belongsTo(categories::class,'category_id');
    }
}
