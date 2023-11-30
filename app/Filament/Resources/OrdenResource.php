<?php

namespace App\Filament\Resources;

use App\Enums\OrderStatus;
use App\Filament\Resources\OrdenResource\Pages;
use App\Filament\Resources\OrdenResource\RelationManagers;
use App\Models\Orden;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\Textarea;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Notifications\Notification;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\MarkdownEditor;

class OrdenResource extends Resource
{
    protected static ?string $model = Orden::class;

    protected static ?string $navigationIcon = 'heroicon-o-shopping-bag';

    protected static ?string $navigationGroup = 'Ventas';

    protected static ?string $navigationLabel = 'Ordenes';

    protected static ?string $modelLabel = 'Orden de compra';

    protected static ?string $slug = 'ordenes';

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
       // return static::$model::where('status', 'new')->count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                Forms\Components\TextInput::make('Orden')
                ->required()
                ->maxLength(191),
                Forms\Components\Select::make('clientes_id')
                    ->relationship('clientes','nombre')
                    ->required()
                    ->searchable()
                    ->preload(),
                    Forms\Components\Select::make('estado')
                    ->options(OrderStatus::class)
                    ->required()
                    ->native(false),
                Forms\Components\TextInput::make('pais')
                    ->required()
                    ->maxLength(191),
                Forms\Components\TextInput::make('ciudad')
                    ->required()
                    ->maxLength(191),
                Forms\Components\TextInput::make('direccion')
                    ->required()
                    ->maxLength(191),
                Forms\Components\TextInput::make('ZIP')->label('ZIP / Código postal')
                    ->required()
                    ->columnSpanFull()
                    ->maxLength(191),
                    Forms\Components\MarkdownEditor::make('Productos')
                    ->label('Orden de compra')
                    ->columnSpanFull()
                    ->required(),                   
                ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('Orden')
                ->searchable(),
                Tables\Columns\TextColumn::make('clientes.nombre')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('estado')
                    ->badge()
                    ->searchable(),
                Tables\Columns\TextColumn::make('pais')
                    ->searchable(),
                Tables\Columns\TextColumn::make('ciudad')
                    ->searchable(),
                Tables\Columns\TextColumn::make('direccion')
                    ->searchable(),
                Tables\Columns\TextColumn::make('ZIP')->label('ZIP / Código postal')
                    ->searchable(),
                Tables\Columns\TextColumn::make('Productos')->label('Orden de compra')
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()
                ->successNotification(

                    Notification::make()
                    ->success()
                    ->title('Orden eliminada.')
                    ->body('Orden eliminada exitosamente')
                )
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }
    
    public static function getRelations(): array
    {
        return [
            //
        ];
    }
    
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrdens::route('/'),
            'create' => Pages\CreateOrden::route('/create'),
            'edit' => Pages\EditOrden::route('/{record}/edit'),
        ];
    }

}