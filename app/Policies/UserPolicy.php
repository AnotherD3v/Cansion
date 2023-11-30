<?php

namespace App\Policies;

use Illuminate\Auth\Access\Response;
use App\Models\User;

class UserPolicy
{
    /**
     * Determine whether the user can view any models.
     * @param \App\Models\User $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        if($user->hasPermissionto('Ver usuario')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can view the model.
     * @param \App\Models\User $user
     * @param \App\models\user $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, User $model)
    {
        //
        if($user->hasPermissionto('Vista usuario')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can create models.
     * 
     * @param \App\Models\User $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        //
        if($user->hasPermissionto('Crear usuario')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can update the model.
     * @param \App\Models\User $user
     * @param \App\Models\User $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user)
    {
        //
        if($user->hasPermissionto('Editar usuario')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can delete the model.
     * @param \App\Models\User $user
     * @param \App\Models\User $model
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user)
    {
        //
        if($user->hasPermissionto('Eliminar usuario')){
            return true;
        }
        return false;
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, User $model)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, User $model)
    {
        //
    }
}
