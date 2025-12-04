import Route from '@ember/routing/route';
import { service } from '@ember/service';

/**
 * Ruta del catálogo de vehículos
 * Carga todos los vehículos y tipos disponibles
 */
export default class CatalogRoute extends Route {
  @service cars;

  model() {
    return {
      vehicles: this.cars.getAll(),
      types: this.cars.getTypes()
    };
  }
}
