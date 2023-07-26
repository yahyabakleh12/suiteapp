<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class area extends Model
{
    use HasFactory;
    protected $table = 'areas';
    protected $fillable = [
        'name'
    ];
    public function building()
    {
        return $this->hasMany(building::class);
    }
    public function users()
    {
        return $this->hasMany(User::class);
    }
}
