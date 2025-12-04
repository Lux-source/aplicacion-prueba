import { pageTitle } from 'ember-page-title';
import VehicleConfigurator from '../components/vehicle-configurator';
import { LinkTo } from '@ember/routing';

/**
 * Template de la página del configurador - Lujan Motors
 * Configurador interactivo de vehículos
 */
<template>
  {{pageTitle "Configurador - Lujan Motors"}}

  <div class="page-enter">
    {{! Hero Section }}
    <section class="catalog-hero">
      <h1 class="catalog-hero__title">Configurador de Vehículos</h1>
      <p class="catalog-hero__subtitle">
        Diseña el coche de tus sueños. Personalízalo a tu gusto.
      </p>
    </section>

    {{! Configurator Section }}
    <section class="section section--light">
      <div class="container">
        <VehicleConfigurator
          @vehicles={{@model.vehicles}}
          @colorOptions={{@model.colorOptions}}
          @extras={{@model.extras}}
        />
      </div>
    </section>

    {{! Info Section }}
    <section class="section section--cream">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">¿Cómo Funciona?</h2>
          <p class="section__subtitle">
            Configura tu vehículo en tres sencillos pasos
          </p>
        </div>

        <div class="features-grid">
          <article class="feature-card">
            <div class="feature-card__icon">1️⃣</div>
            <h3 class="feature-card__title">Elige tu Modelo</h3>
            <p class="feature-card__description">
              Selecciona entre nuestra gama de vehículos: deportivos, SUVs y sedanes premium.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">2️⃣</div>
            <h3 class="feature-card__title">Personaliza el Color</h3>
            <p class="feature-card__description">
              Elige el color que mejor refleje tu personalidad entre nuestra paleta exclusiva.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">3️⃣</div>
            <h3 class="feature-card__title">Añade Extras</h3>
            <p class="feature-card__description">
              Mejora tu experiencia con nuestros equipamientos premium opcionales.
            </p>
          </article>
        </div>
      </div>
    </section>

    {{! CTA Section }}
    <section class="section section--dark">
      <div class="container" style="text-align: center;">
        <h2 class="section__title">¿Necesitas Ayuda para Decidir?</h2>
        <p class="section__subtitle" style="margin-bottom: 2rem;">
          Nuestros asesores están disponibles para orientarte en tu elección.
        </p>
        <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
          <LinkTo @route="contact" class="btn btn-primary btn-lg">
            📞 Hablar con un Asesor
          </LinkTo>
          <LinkTo @route="catalog" class="btn btn-secondary btn-lg">
            🚗 Ver Catálogo Completo
          </LinkTo>
        </div>
      </div>
    </section>
  </div>
</template>
