<?php

namespace App\Filament\Widgets;

use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use App\Models\Producto;

class LatestProductos extends BaseWidget
{

    protected static ?int $sort = 4;
    protected int | string | array $columnSpan = 'full';
    protected static ?string $heading = 'Últimos productos';

    public function table(Table $table): Table
    {
        return $table
            ->query(Producto::query())
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('categorias.descripcion'),
                Tables\Columns\TextColumn::make('descripcion'),
                Tables\Columns\TextColumn::make('stock'),
                Tables\Columns\TextColumn::make('precio')
            ]);
    }
}
