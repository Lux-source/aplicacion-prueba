import { pageTitle } from 'ember-page-title';
import ArticleList from 'aplicacion-prueba/components/article-list';

/**
 * Template de la ruta Articles
 * Paquete P2: Utiliza el componente ArticleList para mostrar los artículos
 */
<template>
  {{pageTitle "Artículos - Aplicación Ember P2"}}

  <main class="articles-page">
    <header class="articles-page__header">
      <h1 class="articles-page__title">📚 Artículos</h1>
      <p class="articles-page__subtitle">
        Listado de artículos obtenidos desde JSONPlaceholder API
      </p>
    </header>

    <section class="articles-page__content">
      <ArticleList 
        @articles={{@model}} 
        @title="Artículos Disponibles"
      />
    </section>
  </main>

  {{outlet}}
</template>
