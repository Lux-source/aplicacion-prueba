import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

<template>
  {{pageTitle "Vehículos - Lujan Motors"}}

  <div class="container page-enter">
    <div class="section__header">
      <h1 class="section__title">Nuestros Vehículos</h1>
      <p class="section__subtitle">Explora nuestra colección exclusiva</p>

      <div style="margin-top: 2rem;">
        <LinkTo @route="vehicles.new" class="btn btn-primary">
          + Añadir Vehículo
        </LinkTo>
      </div>
    </div>

    <div class="vehicles-grid">
      {{#each @model as |vehicle|}}
        <article class="vehicle-card animate-fade-in-up">
          <div class="vehicle-card__image">
            {{vehicle.image}}
          </div>
          <div class="vehicle-card__content">
            <h3 class="vehicle-card__name">{{vehicle.make}} {{vehicle.model}}</h3>
            <p class="vehicle-card__type">{{vehicle.type}} • {{vehicle.year}}</p>
            <p class="vehicle-card__description">{{vehicle.description}}</p>
            <p class="vehicle-card__price">
              {{vehicle.price}}€
            </p>
            <div class="vehicle-card__actions">
              <button class="btn btn-outline">Ver Detalles</button>
            </div>
          </div>
        </article>
      {{/each}}
    </div>
  </div>
</template>
