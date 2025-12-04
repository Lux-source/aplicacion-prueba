import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

/**
 * Template de la página de inicio
 * Paquete P2: Página principal de la aplicación
 */
<template>
  {{pageTitle "Inicio - Aplicación Ember P2"}}

  <div class="welcome-page">
    <section class="welcome-hero">
      <h1 class="welcome-hero__title">🚀 Bienvenido a Ember P2</h1>
      <p class="welcome-hero__subtitle">
        Aplicación de demostración para el curso de Tecnologías Web
      </p>
    </section>

    <section class="welcome-features">
      <h2 class="welcome-features__title">Características del Paquete P2</h2>
      
      <div class="feature-grid">
        <article class="feature-card">
          <span class="feature-card__icon">📦</span>
          <h3 class="feature-card__title">Modelo de Datos</h3>
          <p class="feature-card__description">
            Modelo Article con Ember Data, incluyendo atributos y propiedades computadas.
          </p>
        </article>

        <article class="feature-card">
          <span class="feature-card__icon">🧩</span>
          <h3 class="feature-card__title">Componentes Glimmer</h3>
          <p class="feature-card__description">
            Componentes modernos con GJS: ArticleCard y ArticleList con funcionalidad de búsqueda.
          </p>
        </article>

        <article class="feature-card">
          <span class="feature-card__icon">🔗</span>
          <h3 class="feature-card__title">Adapter REST</h3>
          <p class="feature-card__description">
            Conexión con JSONPlaceholder API usando adaptadores y serializadores personalizados.
          </p>
        </article>

        <article class="feature-card">
          <span class="feature-card__icon">🧪</span>
          <h3 class="feature-card__title">Tests Completos</h3>
          <p class="feature-card__description">
            Tests unitarios y de integración para modelos, componentes y rutas.
          </p>
        </article>
      </div>
    </section>

    <section class="welcome-cta">
      <LinkTo @route="articles" class="cta-button">
        Ver Artículos →
      </LinkTo>
    </section>
  </div>
</template>
