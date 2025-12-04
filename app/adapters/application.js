import RESTAdapter from '@ember-data/adapter/rest';

/**
 * Adapter principal para JSONPlaceholder API
 * Configura la conexión con la API REST externa
 */
export default class ApplicationAdapter extends RESTAdapter {
  host = 'https://jsonplaceholder.typicode.com';

  /**
   * Mapea los tipos de modelo a los endpoints de la API
   */
  pathForType(type) {
    const typeMap = {
      article: 'posts',
      post: 'posts',
      album: 'albums',
      todo: 'todos',
      photo: 'photos',
      comment: 'comments',
    };
    return typeMap[type] || super.pathForType(...arguments);
  }

  /**
   * Construye la URL para queries con filtros (ej: posts de un usuario)
   */
  urlForQuery(query, modelName) {
    if (query.userId) {
      const userId = query.userId;
      delete query.userId;
      return `${this.host}/users/${userId}/${this.pathForType(modelName)}`;
    }
    return super.urlForQuery(...arguments);
  }
}
