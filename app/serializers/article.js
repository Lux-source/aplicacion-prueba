import JSONSerializer from '@ember-data/serializer/json';

/**
 * Serializer para el modelo Article
 * Paquete P2: Adaptación de la respuesta de JSONPlaceholder al formato de Ember Data
 * 
 * JSONPlaceholder devuelve posts con la estructura:
 * { id, userId, title, body }
 * 
 * Nosotros lo mapeamos a nuestro modelo Article
 */
export default class ArticleSerializer extends JSONSerializer {
  /**
   * Clave primaria del modelo
   */
  primaryKey = 'id';

  /**
   * Normaliza la respuesta de la API
   * Añade campos adicionales y adapta la estructura
   */
  normalizeResponse(store, primaryModelClass, payload, id, requestType) {
    let normalizedPayload;

    if (Array.isArray(payload)) {
      // Respuesta de findAll - array de posts
      normalizedPayload = payload.map(post => this.transformPost(post));
    } else if (payload) {
      // Respuesta de findRecord - un solo post
      normalizedPayload = this.transformPost(payload);
    }

    return super.normalizeResponse(store, primaryModelClass, normalizedPayload, id, requestType);
  }

  /**
   * Transforma un post de JSONPlaceholder al formato de Article
   */
  transformPost(post) {
    return {
      id: post.id,
      userId: post.userId,
      title: post.title,
      body: post.body,
      // Campo derivado para compatibilidad
      description: post.body ? post.body.substring(0, 150) + '...' : '',
      // Campos adicionales con valores por defecto
      slug: this.generateSlug(post.title),
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString(),
      favorited: false,
      favoritesCount: 0,
      tagList: this.extractTags(post.body),
    };
  }

  /**
   * Genera un slug a partir del título
   */
  generateSlug(title) {
    if (!title) return '';
    return title
      .toLowerCase()
      .replace(/[^a-z0-9\s-]/g, '')
      .replace(/\s+/g, '-')
      .substring(0, 50);
  }

  /**
   * Extrae "tags" simulados del cuerpo del post
   * (Para demostración, extrae las primeras 3 palabras únicas)
   */
  extractTags(body) {
    if (!body) return [];
    const words = body.split(/\s+/).slice(0, 5);
    return [...new Set(words.map(w => w.toLowerCase().replace(/[^a-z]/g, '')))].filter(w => w.length > 3);
  }
}
