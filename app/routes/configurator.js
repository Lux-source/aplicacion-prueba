import Route from '@ember/routing/route';
import { service } from '@ember/service';

/**
 * Ruta del configurador de vehículos
 * Carga los datos necesarios para el configurador
 */
export default class ConfiguratorRoute extends Route {
  @service cars;

  model() {
    return {
      vehicles: this.cars.getAll(),
      colorOptions: this.cars.getColorOptions(),
      extras: this.cars.getExtras()
    };
  }
}
