import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

/**
 * Template de página de error 404
 * Se muestra cuando el usuario navega a una URL inexistente
 */
<template>
  {{pageTitle "Página no encontrada - Lujan Motors"}}

  <div class="error-page">
    <div class="error-page__content">
      {{! Ilustración del error }}
      <div class="error-page__illustration">
        <span class="error-page__emoji">🚗💨</span>
        <div class="error-page__code">404</div>
      </div>

      {{! Mensaje de error }}
      <h1 class="error-page__title">¡Ups! Página no encontrada</h1>
      <p class="error-page__message">
        Parece que este vehículo se ha perdido en el camino. 
        La página que buscas no existe o ha sido movida.
      </p>

      {{! Sugerencias }}
      <div class="error-page__suggestions">
        <p>Quizás te interese visitar:</p>
        <div class="error-page__links">
          <LinkTo @route="index" class="btn btn-primary">
            🏠 Ir al Inicio
          </LinkTo>
          <LinkTo @route="catalog" class="btn btn-outline">
            🚘 Ver Catálogo
          </LinkTo>
          <LinkTo @route="contact" class="btn btn-outline">
            📞 Contactar
          </LinkTo>
        </div>
      </div>

      {{! Información adicional }}
      <div class="error-page__help">
        <p>
          Si crees que esto es un error, 
          <LinkTo @route="contact">contáctanos</LinkTo> 
          y te ayudaremos.
        </p>
      </div>
    </div>

    {{! Decoración de fondo }}
    <div class="error-page__decoration">
      <span>🛣️</span>
    </div>
  </div>
</template>
