<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Enums\OrderStatus;

class Orden extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function clientes()
    {
        return $this->belongsTo(Cliente::class, 'clientes_id');
    }
    protected $casts = [
        'estado' => OrderStatus::class,
    ];
}
