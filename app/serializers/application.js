import RESTSerializer from '@ember-data/serializer/rest';

/**
 * Serializer principal para JSONPlaceholder API
 * Transforma los datos de la API al formato de Ember Data
 */
export default class ApplicationSerializer extends RESTSerializer {
  /**
   * JSONPlaceholder devuelve arrays directamente, no envueltos en un objeto
   * Este método normaliza la respuesta al formato esperado por Ember Data
   */
  normalizeArrayResponse(store, primaryModelClass, payload, id, requestType) {
    const modelName = primaryModelClass.modelName;
    const pluralModelName = this.pluralize(modelName);
    
    // Envolver el array en un objeto con la clave del modelo
    const normalizedPayload = {
      [pluralModelName]: payload
    };
    
    return super.normalizeArrayResponse(store, primaryModelClass, normalizedPayload, id, requestType);
  }

  /**
   * Para respuestas de un solo registro
   */
  normalizeSingleResponse(store, primaryModelClass, payload, id, requestType) {
    const modelName = primaryModelClass.modelName;
    
    const normalizedPayload = {
      [modelName]: payload
    };
    
    return super.normalizeSingleResponse(store, primaryModelClass, normalizedPayload, id, requestType);
  }

  /**
   * Pluraliza el nombre del modelo
   */
  pluralize(modelName) {
    const plurals = {
      'post': 'posts',
      'album': 'albums',
      'todo': 'todos',
      'photo': 'photos',
      'comment': 'comments'
    };
    return plurals[modelName] || `${modelName}s`;
  }
}
