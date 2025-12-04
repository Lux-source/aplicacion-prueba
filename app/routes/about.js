import Route from '@ember/routing/route';
import { service } from '@ember/service';

/**
 * Ruta de la página "Conócenos"
 * Carga los datos del equipo de Lujan Motors
 */
export default class AboutRoute extends Route {
  @service team;

  model() {
    return {
      teamMembers: this.team.getAll()
    };
  }
}
