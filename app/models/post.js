import Model, { attr } from '@ember-data/model';

/**
 * Modelo Post - Representa una publicación de JSONPlaceholder
 * Endpoint: /posts o /users/:id/posts
 */
export default class PostModel extends Model {
  @attr('number') userId;
  @attr('string') title;
  @attr('string') body;
}
