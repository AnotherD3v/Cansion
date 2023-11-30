<?php

namespace App\Enums;

use Filament\Support\Contracts\HasColor;
use Filament\Support\Contracts\HasLabel;

enum OrderStatus: string implements HasColor, HasLabel
{
    case Nuevo = 'Solicitado';

    case Elaboracion = 'En proceso';

    case Enviado = 'Enviado';

    case Entregado = 'Entregado';

    case Cancelado = 'Cancelado';

    public function getLabel(): string
    {
        return match ($this) {
            self::Nuevo => 'Solicitado',
            self::Elaboracion => 'En proceso',
            self::Enviado => 'Enviado',
            self::Entregado => 'Entregado',
            self::Cancelado => 'Cancelado',
        };
    }

    public function getColor(): string | array | null
    {
        return match ($this) {
            self::Nuevo => 'gray',
            self::Elaboracion => 'warning',
            self::Enviado => 'success', 
            self::Entregado => 'success',
            self::Cancelado => 'danger',
        };
    }
}