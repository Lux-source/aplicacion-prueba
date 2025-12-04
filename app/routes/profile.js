import Route from '@ember/routing/route';
import { service } from '@ember/service';

/**
 * Ruta del perfil de miembro del equipo
 * Combina datos locales del equipo con datos de JSONPlaceholder usando Ember Data
 */
export default class ProfileRoute extends Route {
  @service team;
  @service store;  // Inyectamos el store de Ember Data

  async model(params) {
    const memberId = parseInt(params.member_id, 10);
    const member = this.team.getById(memberId);

    if (!member) {
      throw new Error('Miembro no encontrado');
    }
    const [posts, albums, todos] = await Promise.all([
      this.store.query('post', { userId: memberId }),
      this.store.query('album', { userId: memberId }),
      this.store.query('todo', { userId: memberId })
    ]);

    return {
      member,
      posts: posts.slice(0, 3),      // Solo mostrar 3 posts
      albums: albums.slice(0, 4),    // Solo mostrar 4 álbumes
      todos: todos.slice(0, 5)       // Solo mostrar 5 tareas
    };
  }
}
