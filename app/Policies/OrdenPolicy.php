<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\Orden;
use App\Models\User;

class OrdenPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user)
    {
        //
        if($user->hasPermissionto('Ver orden')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Orden $orden)
    {
        //
        if($user->hasPermissionto('Vista orden')){
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
        if($user->hasPermissionto('Crear orden')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Orden $orden)
    {
        //
        if($user->hasPermissionto('Editar orden')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Orden $orden)
    {
        //
        if($user->hasPermissionto('Eliminar orden')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Orden $orden)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Orden $orden)
    {
        //
    }
}
