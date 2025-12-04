import Route from '@ember/routing/route';
import { service } from '@ember/service';

/**
 * Ruta del perfil de miembro del equipo
 * Combina datos locales del equipo con datos de JSONPlaceholder
 */
export default class ProfileRoute extends Route {
  @service team;

  async model(params) {
    const memberId = parseInt(params.member_id, 10);
    
    // Obtener datos del miembro del equipo (datos locales)
    const member = this.team.getById(memberId);
    
    if (!member) {
      throw new Error('Miembro no encontrado');
    }

    // Cargar datos de JSONPlaceholder usando el ID del miembro
    const [posts, albums, todos] = await Promise.all([
      this.fetchFromAPI(`users/${memberId}/posts`),
      this.fetchFromAPI(`users/${memberId}/albums`),
      this.fetchFromAPI(`users/${memberId}/todos?_limit=5`)
    ]);

    return {
      member,
      posts: posts.slice(0, 3),
      albums: albums.slice(0, 4),
      todos
    };
  }

  async fetchFromAPI(endpoint) {
    try {
      const response = await fetch(`https://jsonplaceholder.typicode.com/${endpoint}`);
      if (!response.ok) {
        throw new Error('Error en la API');
      }
      return await response.json();
    } catch (error) {
      console.error('Error fetching from JSONPlaceholder:', error);
      return [];
    }
  }
}
