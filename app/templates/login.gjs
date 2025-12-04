import { pageTitle } from 'ember-page-title';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

<template>
  {{pageTitle "Login - Lujan Motors"}}
  
  <div class="container page-enter">
    <div class="auth-page">
      <h1 class="auth-title">Iniciar Sesión</h1>
      <p class="auth-subtitle">Bienvenido de nuevo a Lujan Motors</p>

      <form class="auth-form" {{on "submit" @controller.login}}>
        {{#if @controller.errorMessage}}
          <div class="alert alert-danger">
            {{@controller.errorMessage}}
          </div>
        {{/if}}

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

        <button type="submit" class="btn btn-primary btn-block btn-lg">
          Entrar
        </button>

        <div class="auth-footer">
          ¿No tienes cuenta? <a href="/register">Regístrate aquí</a>
        </div>
      </form>
    </div>
  </div>
</template>
