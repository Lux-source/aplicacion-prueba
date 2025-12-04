import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

/**
 * Template de la página de inicio - Lujan Motors
 * Hero section impactante con destacados de servicios
 */
<template>
  {{pageTitle "Inicio - Lujan Motors"}}

  <div class="page-enter">
    {{! Hero Section }}
    <section class="hero">
      <div class="hero-content">
        <span class="hero__badge">🏆 Concesionario Premium</span>
        <h1 class="hero__title">
          Bienvenido a
          <span>Lujan Motors</span>
        </h1>
        <p class="hero__subtitle">
          Tu destino definitivo para vehículos de alta gama.
          Descubre la excelencia automotriz con más de 20 años de experiencia.
        </p>
        <div class="hero__cta">
          <LinkTo @route="catalog" class="btn btn-primary btn-lg">
            🚗 Ver Catálogo
          </LinkTo>
          <LinkTo @route="configurator" class="btn btn-secondary btn-lg">
            ⚙️ Configurador
          </LinkTo>
        </div>
      </div>
    </section>

    {{! Services Section }}
    <section class="section section--light">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">Nuestros Servicios</h2>
          <p class="section__subtitle">
            Ofrecemos una experiencia completa en el mundo automotriz,
            desde la venta hasta el mantenimiento de tu vehículo.
          </p>
        </div>

        <div class="features-grid">
          <article class="feature-card animate-fade-in-up stagger-1">
            <div class="feature-card__icon">🚗</div>
            <h3 class="feature-card__title">Venta de Vehículos</h3>
            <p class="feature-card__description">
              Amplio catálogo de vehículos nuevos y seminuevos de las mejores marcas.
              Encuentra el coche perfecto para ti.
            </p>
          </article>

          <article class="feature-card animate-fade-in-up stagger-2">
            <div class="feature-card__icon">🔧</div>
            <h3 class="feature-card__title">Servicio Técnico</h3>
            <p class="feature-card__description">
              Taller oficial con técnicos certificados. Mantenimiento preventivo,
              reparaciones y revisiones con garantía.
            </p>
          </article>

          <article class="feature-card animate-fade-in-up stagger-3">
            <div class="feature-card__icon">💰</div>
            <h3 class="feature-card__title">Financiación</h3>
            <p class="feature-card__description">
              Planes de financiamiento flexibles adaptados a tus necesidades.
              Tasas competitivas y aprobación rápida.
            </p>
          </article>

          <article class="feature-card animate-fade-in-up stagger-4">
            <div class="feature-card__icon">🛡️</div>
            <h3 class="feature-card__title">Garantía Extendida</h3>
            <p class="feature-card__description">
              Protege tu inversión con nuestros planes de garantía extendida.
              Tranquilidad total durante años.
            </p>
          </article>
        </div>
      </div>
    </section>

    {{! Featured Vehicles Section }}
    <section class="section section--cream">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">Vehículos Destacados</h2>
          <p class="section__subtitle">
            Descubre nuestra selección de vehículos premium disponibles ahora.
          </p>
        </div>

        <div class="vehicles-grid">
          <article class="vehicle-card animate-fade-in-up stagger-1">
            <div class="vehicle-card__image">
              <span class="vehicle-card__badge">Nuevo</span>
              🏎️
            </div>
            <div class="vehicle-card__content">
              <h3 class="vehicle-card__name">LM Sport GT</h3>
              <p class="vehicle-card__type">Deportivo</p>
              <div class="vehicle-card__specs">
                <span class="vehicle-card__spec">520 CV</span>
                <span class="vehicle-card__spec">V8 Turbo</span>
                <span class="vehicle-card__spec">3.2s 0-100</span>
              </div>
              <p class="vehicle-card__price">
                75.000€ <span>desde</span>
              </p>
              <div class="vehicle-card__actions">
                <LinkTo @route="catalog" class="btn btn-primary">
                  Ver Detalles
                </LinkTo>
              </div>
            </div>
          </article>

          <article class="vehicle-card animate-fade-in-up stagger-2">
            <div class="vehicle-card__image">
              <span class="vehicle-card__badge">Popular</span>
              🚙
            </div>
            <div class="vehicle-card__content">
              <h3 class="vehicle-card__name">LM Explorer</h3>
              <p class="vehicle-card__type">SUV</p>
              <div class="vehicle-card__specs">
                <span class="vehicle-card__spec">350 CV</span>
                <span class="vehicle-card__spec">V6</span>
                <span class="vehicle-card__spec">4x4</span>
              </div>
              <p class="vehicle-card__price">
                55.000€ <span>desde</span>
              </p>
              <div class="vehicle-card__actions">
                <LinkTo @route="catalog" class="btn btn-primary">
                  Ver Detalles
                </LinkTo>
              </div>
            </div>
          </article>

          <article class="vehicle-card animate-fade-in-up stagger-3">
            <div class="vehicle-card__image">
              <span class="vehicle-card__badge">Oferta</span>
              🚗
            </div>
            <div class="vehicle-card__content">
              <h3 class="vehicle-card__name">LM Executive</h3>
              <p class="vehicle-card__type">Sedán</p>
              <div class="vehicle-card__specs">
                <span class="vehicle-card__spec">280 CV</span>
                <span class="vehicle-card__spec">2.0L Turbo</span>
                <span class="vehicle-card__spec">Premium</span>
              </div>
              <p class="vehicle-card__price">
                48.000€ <span>desde</span>
              </p>
              <div class="vehicle-card__actions">
                <LinkTo @route="catalog" class="btn btn-primary">
                  Ver Detalles
                </LinkTo>
              </div>
            </div>
          </article>
        </div>

        <div style="text-align: center; margin-top: 3rem;">
          <LinkTo @route="catalog" class="btn btn-outline btn-lg">
            Ver Todos los Vehículos →
          </LinkTo>
        </div>
      </div>
    </section>

    {{! Stats Section }}
    <section class="section section--dark">
      <div class="container">
        <div class="stats-grid">
          <div class="stat-card">
            <div class="stat-card__number">20+</div>
            <div class="stat-card__label">Años de Experiencia</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__number">5.000+</div>
            <div class="stat-card__label">Clientes Satisfechos</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__number">150+</div>
            <div class="stat-card__label">Vehículos en Stock</div>
          </div>
          <div class="stat-card">
            <div class="stat-card__number">4.9★</div>
            <div class="stat-card__label">Valoración Media</div>
          </div>
        </div>
      </div>
    </section>

    {{! Testimonials Section }}
    <section class="section section--light">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">Lo Que Dicen Nuestros Clientes</h2>
          <p class="section__subtitle">
            La satisfacción de nuestros clientes es nuestra mayor recompensa.
          </p>
        </div>

        <div class="testimonials-grid">
          <article class="testimonial-card">
            <p class="testimonial-card__text">
              Excelente experiencia de compra. El equipo de Lujan Motors me ayudó a encontrar
              el coche perfecto para mi familia. ¡Totalmente recomendados!
            </p>
            <div class="testimonial-card__author">
              <div class="testimonial-card__avatar">👨</div>
              <div>
                <div class="testimonial-card__name">Carlos Martínez</div>
                <div class="testimonial-card__role">Cliente desde 2020</div>
              </div>
            </div>
          </article>

          <article class="testimonial-card">
            <p class="testimonial-card__text">
              El servicio técnico es impecable. Siempre me avisan de cualquier problema
              antes de que sea grave. Profesionalidad y honestidad.
            </p>
            <div class="testimonial-card__author">
              <div class="testimonial-card__avatar">👩</div>
              <div>
                <div class="testimonial-card__name">María González</div>
                <div class="testimonial-card__role">Cliente desde 2018</div>
              </div>
            </div>
          </article>

          <article class="testimonial-card">
            <p class="testimonial-card__text">
              Las condiciones de financiación fueron las mejores que encontré.
              El proceso fue rápido y transparente. Volveré seguro.
            </p>
            <div class="testimonial-card__author">
              <div class="testimonial-card__avatar">👨</div>
              <div>
                <div class="testimonial-card__name">David López</div>
                <div class="testimonial-card__role">Cliente desde 2022</div>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    {{! CTA Section }}
    <section class="section section--cream">
      <div class="container" style="text-align: center;">
        <h2 class="section__title">¿Listo para Encontrar tu Próximo Coche?</h2>
        <p class="section__subtitle" style="margin-bottom: 2rem;">
          Visítanos o contáctanos para una experiencia personalizada.
        </p>
        <div class="hero__cta" style="opacity: 1;">
          <LinkTo @route="contact" class="btn btn-primary btn-lg">
            📞 Contáctanos
          </LinkTo>
          <LinkTo @route="about" class="btn btn-outline btn-lg">
            👥 Conócenos
          </LinkTo>
        </div>
      </div>
    </section>
  </div>
</template>
