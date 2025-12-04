import { pageTitle } from 'ember-page-title';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

<template>
  {{pageTitle "Registro - Lujan Motors"}}
  
  <div class="container page-enter">
    <div class="auth-page">
      <h1 class="auth-title">Crear Cuenta</h1>
      <p class="auth-subtitle">Únete a la comunidad de Lujan Motors</p>

      <form class="auth-form" {{on "submit" @controller.register}}>
        {{#if @controller.errorMessage}}
          <div class="alert alert-danger">
            {{@controller.errorMessage}}
          </div>
        {{/if}}

        <div class="form-group">
          <label for="name">Nombre Completo</label>
          <input 
            type="text" 
            id="name" 
            class="form-control" 
            placeholder="Juan Pérez"
            value={{@controller.name}}
            {{on "input" (fn @controller.updateValue "name")}}
          />
        </div>

        <div class="form-group">
          <label for="email">Correo Electrónico</label>
          <input 
            type="email" 
            id="email" 
            class="form-control" 
            placeholder="tu@email.com"
            value={{@controller.email}}
            {{on "input" (fn @controller.updateValue "email")}}
          />
        </div>

        <div class="form-group">
          <label for="password">Contraseña</label>
          <input 
            type="password" 
            id="password" 
            class="form-control" 
            placeholder="••••••••"
            value={{@controller.password}}
            {{on "input" (fn @controller.updateValue "password")}}
          />
        </div>

        <div class="form-group">
          <label for="confirmPassword">Confirmar Contraseña</label>
          <input 
            type="password" 
            id="confirmPassword" 
            class="form-control" 
            placeholder="••••••••"
            value={{@controller.confirmPassword}}
            {{on "input" (fn @controller.updateValue "confirmPassword")}}
          />
        </div>

        <button type="submit" class="btn btn-primary btn-block btn-lg">
          Registrarse
        </button>

        <div class="auth-footer">
          ¿Ya tienes cuenta? <a href="/login">Inicia sesión</a>
        </div>
      </form>
    </div>
  </div>
</template>
