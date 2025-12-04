import { pageTitle } from 'ember-page-title';
import VehicleCatalog from '../components/vehicle-catalog';

/**
 * Template de la página del catálogo - Lujan Motors
 * Catálogo interactivo de vehículos con filtros
 */
<template>
  {{pageTitle "Catálogo - Lujan Motors"}}

  <div class="page-enter">
    {{! Hero Section }}
    <section class="catalog-hero">
      <h1 class="catalog-hero__title">Nuestro Catálogo</h1>
      <p class="catalog-hero__subtitle">
        Explora nuestra amplia selección de vehículos premium
      </p>
    </section>

    {{! Catalog Section }}
    <section class="section section--light">
      <div class="container">
        <VehicleCatalog @vehicles={{@model.vehicles}} @types={{@model.types}} />
      </div>
    </section>

    {{! CTA Section }}
    <section class="section section--cream">
      <div class="container" style="text-align: center;">
        <h2 class="section__title">¿No Encuentras lo que Buscas?</h2>
        <p class="section__subtitle" style="margin-bottom: 2rem;">
          Cuéntanos qué necesitas y te ayudaremos a encontrar el vehículo perfecto.
        </p>
        <a href="/contact" class="btn btn-primary btn-lg">
          📞 Contáctanos
        </a>
      </div>
    </section>

    {{! Benefits Section }}
    <section class="section section--dark">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">Ventajas de Comprar en Lujan Motors</h2>
        </div>
        <div class="features-grid">
          <article class="feature-card">
            <div class="feature-card__icon">🔍</div>
            <h3 class="feature-card__title">Inspección 150 Puntos</h3>
            <p class="feature-card__description">
              Todos nuestros vehículos pasan por una exhaustiva revisión antes de la venta.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">📋</div>
            <h3 class="feature-card__title">Historial Verificado</h3>
            <p class="feature-card__description">
              Conoce el historial completo del vehículo antes de tu compra.
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">🔄</div>
            <h3 class="feature-card__title">Garantía de Devolución</h3>
            <p class="feature-card__description">
              7 días para devolver el vehículo si no quedas completamente satisfecho.
            </p>
          </article>
        </div>
      </div>
    </section>
  </div>
</template>
