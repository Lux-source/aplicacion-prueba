import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

/**
 * Controller para la ruta Articles
 * Paquete P2: Maneja el estado y lógica de la vista de artículos
 */
export default class ArticlesController extends Controller {
  // Estado del ordenamiento
  @tracked sortField = 'id';
  @tracked sortDirection = 'asc';
  
  // Artículo seleccionado para ver detalles
  @tracked selectedArticle = null;

  /**
   * Opciones de ordenamiento disponibles
   */
  get sortOptions() {
    return [
      { value: 'id', label: 'ID' },
      { value: 'title', label: 'Título' },
      { value: 'userId', label: 'Usuario' },
    ];
  }

  /**
   * Artículos ordenados según el campo y dirección seleccionados
   */
  get sortedArticles() {
    const articles = this.model?.slice() || [];
    
    return articles.sort((a, b) => {
      let valueA = a[this.sortField];
      let valueB = b[this.sortField];
      
      // Manejar strings
      if (typeof valueA === 'string') {
        valueA = valueA.toLowerCase();
        valueB = valueB?.toLowerCase() || '';
      }
      
      let comparison = 0;
      if (valueA > valueB) comparison = 1;
      if (valueA < valueB) comparison = -1;
      
      return this.sortDirection === 'desc' ? -comparison : comparison;
    });
  }

  /**
   * Cambia el campo de ordenamiento
   */
  @action
  changeSortField(event) {
    this.sortField = event.target.value;
  }

  /**
   * Alterna la dirección de ordenamiento
   */
  @action
  toggleSortDirection() {
    this.sortDirection = this.sortDirection === 'asc' ? 'desc' : 'asc';
  }

  /**
   * Selecciona un artículo para ver sus detalles
   */
  @action
  viewArticle(article) {
    this.selectedArticle = article;
  }

  /**
   * Cierra la vista de detalles
   */
  @action
  closeDetails() {
    this.selectedArticle = null;
  }

  /**
   * Reinicia los filtros y ordenamiento
   */
  @action
  resetFilters() {
    this.sortField = 'id';
    this.sortDirection = 'asc';
    this.selectedArticle = null;
  }
}
