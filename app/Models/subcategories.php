<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subcategories extends Model
{
    use HasFactory;
    protected $table = 'subcategories';
    protected $fillable = [
        'title',
        'services_id',
        'category_id',
        'picture_path',
    ];
    public function subcategories_plan()
    {
        return $this->hasMany(subcategories_plan::class);
    }
    public function services()
    {
        return $this->belongsTo(services::class,'services_id');
    }
}
