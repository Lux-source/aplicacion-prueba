import Model, { attr } from '@ember-data/model';

/**
 * Modelo Article - Representa un artículo/post de la API
 * Utiliza JSONPlaceholder como backend (https://jsonplaceholder.typicode.com/posts)
 * 
 * Paquete P2: Implementación completa del modelo con todos los atributos necesarios
 */
export default class ArticleModel extends Model {
  // Atributos principales del post de JSONPlaceholder
  @attr('number') userId;
  @attr('string') title;
  @attr('string') body;
  
  // Atributo derivado/mapeado desde body para compatibilidad
  @attr('string') description;
  
  // Atributos adicionales para funcionalidad extendida
  @attr('string') slug;
  @attr('date') createdAt;
  @attr('date') updatedAt;
  @attr('boolean') favorited;
  @attr('number') favoritesCount;
  @attr tagList;

  /**
   * Propiedad computada para obtener un extracto del cuerpo
   */
  get excerpt() {
    if (this.body && this.body.length > 100) {
      return this.body.substring(0, 100) + '...';
    }
    return this.body || '';
  }

  /**
   * Propiedad para verificar si el artículo tiene contenido
   */
  get hasContent() {
    return Boolean(this.title && this.body);
  }
}
