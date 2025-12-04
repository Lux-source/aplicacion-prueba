import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';

/**
 * Template del perfil de miembro del equipo
 * Muestra información del empleado + datos de JSONPlaceholder
 */
<template>
  {{pageTitle @model.member.name " - Lujan Motors"}}

  <div class="page-enter">
    {{! Breadcrumb }}
    <div class="container" style="padding-top: 2rem;">
      <LinkTo @route="about" class="btn btn-outline" style="margin-bottom: 1rem;">
        ← Volver al Equipo
      </LinkTo>
    </div>

    {{! Profile Header }}
    <section class="profile-hero">
      <div class="container">
        <div class="profile-header">
          <div class="profile-header__avatar">
            {{@model.member.avatar}}
          </div>
          <div class="profile-header__info">
            <h1 class="profile-header__name">{{@model.member.name}}</h1>
            <p class="profile-header__role">{{@model.member.role}}</p>
            <p class="profile-header__bio">{{@model.member.bio}}</p>
            <div class="profile-header__contact">
              <a href="mailto:{{@model.member.email}}" class="btn btn-primary">
                ✉️ Contactar
              </a>
              <a href={{@model.member.linkedin}} class="btn btn-outline">
                💼 LinkedIn
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    {{! Posts Section - From JSONPlaceholder }}
    <section class="section section--light">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">📝 Publicaciones Recientes</h2>
          <p class="section__subtitle">
            Artículos y reflexiones de {{@model.member.name}}
            <span class="badge">Datos de JSONPlaceholder API</span>
          </p>
        </div>

        <div class="posts-grid">
          {{#each @model.posts as |post|}}
            <article class="post-card animate-fade-in">
              <h3 class="post-card__title">{{post.title}}</h3>
              <p class="post-card__body">{{post.body}}</p>
              <div class="post-card__footer">
                <span class="post-card__id">Post #{{post.id}}</span>
              </div>
            </article>
          {{else}}
            <p class="empty-message">No hay publicaciones disponibles.</p>
          {{/each}}
        </div>
      </div>
    </section>

    {{! Albums Section - From JSONPlaceholder }}
    <section class="section section--cream">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">📸 Álbumes de Fotos</h2>
          <p class="section__subtitle">
            Galería de {{@model.member.name}}
            <span class="badge">Datos de JSONPlaceholder API</span>
          </p>
        </div>

        <div class="albums-grid">
          {{#each @model.albums as |album|}}
            <div class="album-card animate-fade-in">
              <div class="album-card__icon">🖼️</div>
              <h4 class="album-card__title">{{album.title}}</h4>
              <span class="album-card__id">Álbum #{{album.id}}</span>
            </div>
          {{else}}
            <p class="empty-message">No hay álbumes disponibles.</p>
          {{/each}}
        </div>
      </div>
    </section>

    {{! Todos Section - From JSONPlaceholder }}
    <section class="section section--light">
      <div class="container">
        <div class="section__header">
          <h2 class="section__title">✅ Tareas Pendientes</h2>
          <p class="section__subtitle">
            Lista de tareas de {{@model.member.name}}
            <span class="badge">Datos de JSONPlaceholder API</span>
          </p>
        </div>

        <div class="todos-list">
          {{#each @model.todos as |todo|}}
            <div class="todo-item {{if todo.completed 'todo-item--completed'}}">
              <span class="todo-item__check">
                {{if todo.completed "✅" "⬜"}}
              </span>
              <span class="todo-item__title">{{todo.title}}</span>
            </div>
          {{else}}
            <p class="empty-message">No hay tareas disponibles.</p>
          {{/each}}
        </div>
      </div>
    </section>

    {{! CTA Section }}
    <section class="section section--primary">
      <div class="container" style="text-align: center;">
        <h2 style="color: white; margin-bottom: 1rem;">¿Quieres contactar con {{@model.member.name}}?</h2>
        <p style="color: rgba(255,255,255,0.9); margin-bottom: 2rem;">
          Envía un mensaje y te responderá lo antes posible
        </p>
        <LinkTo @route="contact" class="btn btn-lg" style="background: white; color: var(--color-primary);">
          📞 Ir a Contacto
        </LinkTo>
      </div>
    </section>
  </div>
</template>
