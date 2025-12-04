import { pageTitle } from 'ember-page-title';
import ContactForm from '../components/contact-form';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';

/**
 * Template de la página de contacto - Lujan Motors
 * Formulario funcional y datos de contacto
 */
<template>
  {{pageTitle "Contáctanos - Lujan Motors"}}

  <div class="page-enter">
    {{! Hero Section }}
    <section class="contact-hero">
      <h1 class="contact-hero__title">Contáctanos</h1>
      <p class="contact-hero__subtitle">
        Estamos aquí para ayudarte. No dudes en ponerte en contacto con nosotros.
      </p>
    </section>

    {{! Contact Grid }}
    <section class="section section--light">
      <div class="container">
        <div class="contact-grid">
          {{! Contact Form }}
          <ContactForm />

          {{! Contact Info }}
          <div class="contact-info">
            <h3>Información de Contacto</h3>

            <div class="contact-info-item">
              <div class="contact-info-icon">📍</div>
              <div class="contact-info-text">
                <h4>Dirección</h4>
                <p>{{@model.contactInfo.address}}</p>
              </div>
            </div>

            <div class="contact-info-item">
              <div class="contact-info-icon">📞</div>
              <div class="contact-info-text">
                <h4>Teléfono</h4>
                <p>{{@model.contactInfo.phone}}</p>
              </div>
            </div>

            <div class="contact-info-item">
              <div class="contact-info-icon">✉️</div>
              <div class="contact-info-text">
                <h4>Email</h4>
                <p>{{@model.contactInfo.email}}</p>
              </div>
            </div>

            <div class="contact-info-item">
              <div class="contact-info-icon">🕐</div>
              <div class="contact-info-text">
                <h4>Horario</h4>
                <p>{{@model.contactInfo.schedule}}</p>
              </div>
            </div>

            {{! Map Placeholder }}
            <div class="map-placeholder">
              <span>🗺️</span>
              <p>Mapa de ubicación</p>
              <small>Av. Principal 1234, Ciudad Automotriz</small>
            </div>
          </div>
        </div>
      </div>
    </section>

    {{! Quick Contact Section }}
    <section class="section section--cream">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">¿Prefieres Llamarnos?</h2>
          <p class="section__subtitle">
            Nuestro equipo está disponible para atenderte personalmente.
          </p>
        </div>

        <div class="features-grid">
          <article class="feature-card">
            <div class="feature-card__icon">🚗</div>
            <h3 class="feature-card__title">Ventas</h3>
            <p class="feature-card__description">
              ¿Buscas un nuevo vehículo? Nuestros asesores te guiarán.
              <br /><strong>+34 912 345 001</strong>
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">🔧</div>
            <h3 class="feature-card__title">Taller</h3>
            <p class="feature-card__description">
              Reserva tu cita para mantenimiento o reparación.
              <br /><strong>+34 912 345 002</strong>
            </p>
          </article>

          <article class="feature-card">
            <div class="feature-card__icon">💳</div>
            <h3 class="feature-card__title">Financiación</h3>
            <p class="feature-card__description">
              Consulta opciones de pago y financiamiento.
              <br /><strong>+34 912 345 003</strong>
            </p>
          </article>
        </div>
      </div>
    </section>

    {{! Social Media }}
    <section class="section section--dark">
      <div class="container" style="text-align: center;">
        <h2 class="section__title" style="color: white;">Síguenos en Redes Sociales</h2>
        <p class="section__subtitle" style="color: #adb5bd; margin-bottom: 2rem;">
          Mantente al día con nuestras novedades y ofertas exclusivas.
        </p>
        <div style="display: flex; gap: 1rem; justify-content: center; flex-wrap: wrap;">
          <a href="#" class="btn btn-secondary">📘 Facebook</a>
          <a href="#" class="btn btn-secondary">📸 Instagram</a>
          <a href="#" class="btn btn-secondary">🐦 Twitter</a>
          <a href="#" class="btn btn-secondary">💼 LinkedIn</a>
          <a href="#" class="btn btn-secondary">📺 YouTube</a>
        </div>
      </div>
    </section>
  </div>
</template>
