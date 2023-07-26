<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class appartment extends Model
{
    use HasFactory;
    use HasFactory;
    protected $table = 'appartment';
    protected $fillable = [
        'number',
        'building_id',
        'number_of_people',
        'own'
    ];
    public function building()
    {
        return $this->belongsTo(building::class,'building_id');
    }
    public function users()
    {
        return $this->hasMany(User::class);
    }

}
