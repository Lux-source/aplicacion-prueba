import Model, { attr } from '@ember-data/model';

/**
 * Modelo Todo - Representa una tarea de JSONPlaceholder
 * Endpoint: /todos o /users/:id/todos
 */
export default class TodoModel extends Model {
  @attr('number') userId;
  @attr('string') title;
  @attr('boolean') completed;
}
