import EmberRouter from '@embroider/router';
import config from 'aplicacion-prueba/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  // Rutas principales de Lujan Motors
  this.route('about');      // Conócenos
  this.route('contact');    // Contáctanos
  this.route('catalog');    // Catálogo de vehículos
  this.route('configurator'); // Configurador de vehículos

  // Ruta dinámica para perfiles de miembros del equipo
  this.route('profile', { path: '/profile/:member_id' });

  // Autenticación
  this.route('login');
  this.route('register');
});
