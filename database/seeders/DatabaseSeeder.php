<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        $usuario =  User::factory()->create([
             'name' => 'Mario Figueroa',
             'email' => 'mfigueroa@gmail.com',
         ]);

        User::factory()->create([
            'name' => 'Test',
            'email' => 'test@gmail.com',
        ]);

        $rol = Role::create(['name' => 'Admin']);
        $usuario->assignRole($rol);
    }
}
