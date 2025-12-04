import Model, { attr } from '@ember-data/model';

/**
 * Modelo Album - Representa un álbum de fotos de JSONPlaceholder
 * Endpoint: /albums o /users/:id/albums
 */
export default class AlbumModel extends Model {
  @attr('number') userId;
  @attr('string') title;
}
