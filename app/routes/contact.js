import Route from '@ember/routing/route';

/**
 * Ruta de la página de contacto
 */
export default class ContactRoute extends Route {
  model() {
    return {
      contactInfo: {
        address: 'Av. Principal 1234, Ciudad Automotriz',
        phone: '+34 912 345 678',
        email: 'info@lujanmotors.com',
        schedule: 'Lun - Vie: 9:00 - 20:00 | Sáb: 10:00 - 14:00'
      }
    };
  }
}
