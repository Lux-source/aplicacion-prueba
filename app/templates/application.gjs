import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

/**
 * Template principal de la aplicación
 * Paquete P2: Layout con navegación y estructura principal
 */
<template>
  {{pageTitle "Aplicación Ember - Paquete P2"}}

  <div class="app-container">
    <header class="app-header">
      <div class="app-header__brand">
        <h1 class="app-header__title">🚀 Ember P2 App</h1>
      </div>
      
      <nav class="app-header__nav">
        <ul class="app-nav">
          <li class="app-nav__item">
            <LinkTo @route="index" class="app-nav__link">
              Inicio
            </LinkTo>
          </li>
          <li class="app-nav__item">
            <LinkTo @route="articles" class="app-nav__link">
              Artículos
            </LinkTo>
          </li>
        </ul>
      </nav>
    </header>

    <main class="app-main">
      {{outlet}}
    </main>

    <footer class="app-footer">
      <p class="app-footer__text">
        Paquete P2 - Tecnologías Web con Ember.js
      </p>
      <p class="app-footer__credits">
        Datos proporcionados por 
        <a href="https://jsonplaceholder.typicode.com" target="_blank" rel="noopener noreferrer">
          JSONPlaceholder
        </a>
      </p>
    </footer>
  </div>
</template>
