<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class building_services extends Model
{
    use HasFactory;
    protected $table = 'building_services';
    protected $fillable = [
        'service_id',
        'building_id'
    ];
    public function building()
    {
        return $this->belongsTo(building::class,'building_id');
    }
    public function services()
    {
        return $this->belongsTo(services::class,'service_id');
    }
}
