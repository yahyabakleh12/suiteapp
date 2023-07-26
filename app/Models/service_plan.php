<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class service_plan extends Model
{
    use HasFactory;
    protected $table = 'service_plan';
    protected $fillable = [
        'services_id',
        'plan_id'
    ];
    public function services()
    {
        return $this->belongsTo(services::class, 'services_id');
    }
    public function plan()
    {
        return $this->belongsTo(plan::class, 'plan_id');
    }
}
