<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\Cliente;
use App\Models\User;

class ClientePolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user)
    {
        //
        if($user->hasPermissionto('Ver cliente')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Cliente $cliente)
    {
        //
        if($user->hasPermissionto('Vista cliente')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user)
    {
        //
        if($user->hasPermissionto('Crear cliente')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Cliente $cliente)
    {
        //
        if($user->hasPermissionto('Editar cliente')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Cliente $cliente)
    {
        //
        if($user->hasPermissionto('Eliminar cliente')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Cliente $cliente)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Cliente $cliente)
    {
        //
    }
}
