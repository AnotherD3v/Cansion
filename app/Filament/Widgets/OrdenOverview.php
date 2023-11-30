<?php

namespace App\Filament\Widgets;

use App\models\Orden;
use App\models\Cliente;
use App\models\Producto;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Widgets\ChartWidget;

class OrdenOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make('Ordenes', Orden::query()->count())
            ->description('Todas las ordenes registradas')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('success'),
        Stat::make('Clientes', Cliente::query()->count())
        ->description('Todas los clientes registrados')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('warning'),
        Stat::make('Productos', Producto::query()->count())
        ->description('Todos los productos registrados')
            ->descriptionIcon('heroicon-m-arrow-trending-up')
            ->color('gray'),
        ];
    }
    

}
