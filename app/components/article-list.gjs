import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import ArticleCard from './article-card';

/**
 * Componente ArticleList - Lista de artículos con funcionalidad de filtrado
 * Paquete P2: Componente contenedor con estado y acciones
 */
export default class ArticleList extends Component {
  @tracked searchTerm = '';
  @tracked selectedArticle = null;

  /**
   * Filtra los artículos basándose en el término de búsqueda
   */
  get filteredArticles() {
    const articles = this.args.articles || [];
    const term = this.searchTerm.toLowerCase().trim();

    if (!term) {
      return articles;
    }

    return articles.filter(article => {
      const title = (article.title || '').toLowerCase();
      const body = (article.body || '').toLowerCase();
      return title.includes(term) || body.includes(term);
    });
  }

  /**
   * Cuenta total de artículos
   */
  get totalCount() {
    return this.args.articles?.length || 0;
  }

  /**
   * Cuenta de artículos filtrados
   */
  get filteredCount() {
    return this.filteredArticles.length;
  }

  /**
   * Indica si hay artículos para mostrar
   */
  get hasArticles() {
    return this.filteredCount > 0;
  }

  @action
  updateSearch(event) {
    this.searchTerm = event.target.value;
  }

  @action
  selectArticle(article) {
    this.selectedArticle = article;
    if (this.args.onArticleSelect) {
      this.args.onArticleSelect(article);
    }
  }

  @action
  clearSelection() {
    this.selectedArticle = null;
  }

  <template>
    <div class="article-list" ...attributes>
      <div class="article-list__header">
        <h2 class="article-list__title">
          {{#if @title}}
            {{@title}}
          {{else}}
            Lista de Artículos
          {{/if}}
        </h2>

        <div class="article-list__stats">
          Mostrando {{this.filteredCount}} de {{this.totalCount}} artículos
        </div>
      </div>

      <div class="article-list__search">
        <input
          type="text"
          class="article-list__search-input"
          placeholder="Buscar artículos..."
          value={{this.searchTerm}}
          {{on "input" this.updateSearch}}
        />
      </div>

      {{#if this.selectedArticle}}
        <div class="article-list__selected">
          <h3>Artículo Seleccionado</h3>
          <ArticleCard @article={{this.selectedArticle}} @showExcerpt={{false}} />
          <button
            type="button"
            class="article-list__clear-btn"
            {{on "click" this.clearSelection}}
          >
            Cerrar
          </button>
        </div>
      {{/if}}

      {{#if this.hasArticles}}
        <ul class="article-list__items">
          {{#each this.filteredArticles as |article|}}
            <li class="article-list__item">
              <ArticleCard
                @article={{article}}
                @showExcerpt={{true}}
                @onSelect={{this.selectArticle}}
              />
            </li>
          {{/each}}
        </ul>
      {{else}}
        <div class="article-list__empty">
          {{#if this.searchTerm}}
            <p>No se encontraron artículos que coincidan con "{{this.searchTerm}}"</p>
          {{else}}
            <p>No hay artículos disponibles</p>
          {{/if}}
        </div>
      {{/if}}
    </div>
  </template>
}
