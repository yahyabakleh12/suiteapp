<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subcategories_plan extends Model
{
    use HasFactory;
    protected $table = 'subcategories_plan';
    protected $fillable = [
        'plan_id',
        'subcategories_id',
        'price',
    ];
    public function subcategories()
    {
        return $this->belongsTo(subcategories::class,'subcategories_id');
    }
    public function plan()
    {
        return $this->belongsTo(plan::class,'plan_id');
    }
}
