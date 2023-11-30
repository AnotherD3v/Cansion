<?php

namespace App\Filament\Widgets;

use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;
use App\Models\Orden;

class AdminChart extends ChartWidget
{
    protected static ?string $heading = 'Ordenes de compra';

    protected static string $color = 'warning';

    protected static ?int $sort = 2;

    protected function getData(): array
    {
        $data = Trend::model(Orden::class)
        ->between(
            start: now()->startOfMonth(),
            end: now()->endOfMonth(),
        )
        ->perDAY()
        ->count();
 
    return [
        'datasets' => [
            [
                'label' => 'Orden de compra',
                'data' => $data->map(fn (TrendValue $value) => $value->aggregate),
            ],
        ],
        'labels' => $data->map(fn (TrendValue $value) => $value->date),
    ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
