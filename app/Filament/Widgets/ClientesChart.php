<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;
use App\Models\Cliente;

class ClientesChart extends ChartWidget
{
    protected static ?string $heading = 'Clientes';
    protected static string $color = 'gray';

    protected static ?int $sort = 3;

    protected function getData(): array
    {
        $data = Trend::model(Cliente::class)
        ->between(
            start: now()->startOfMonth(),
            end: now()->endOfMonth(),
        )
        ->perDAY()
        ->count();
 
    return [
        'datasets' => [
            [
                'label' => 'Clientes',
                'data' => $data->map(fn (TrendValue $value) => $value->aggregate),
            ],
        ],
        'labels' => $data->map(fn (TrendValue $value) => $value->date),
    ];
    }

    protected function getType(): string
    {
        return 'bar';
    }
}
