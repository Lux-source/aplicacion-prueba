import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

/**
 * Componente ArticleCard - Muestra una tarjeta individual de artículo
 * Paquete P2: Componente reutilizable con Glimmer/GJS
 */

<template>
  <article class="article-card" ...attributes>
    <header class="article-card__header">
      <h3 class="article-card__title">{{@article.title}}</h3>
      {{#if @article.userId}}
        <span class="article-card__author">Usuario #{{@article.userId}}</span>
      {{/if}}
    </header>

    <div class="article-card__content">
      <p class="article-card__body">
        {{#if @showExcerpt}}
          {{@article.excerpt}}
        {{else}}
          {{@article.body}}
        {{/if}}
      </p>
    </div>

    <footer class="article-card__footer">
      <span class="article-card__id">ID: {{@article.id}}</span>
      {{#if @onSelect}}
        <button
          type="button"
          class="article-card__button"
          {{on "click" (fn @onSelect @article)}}
        >
          Ver más
        </button>
      {{/if}}
    </footer>
  </article>
</template>
