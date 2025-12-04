import EmberRouter from '@embroider/router';
import config from 'aplicacion-prueba/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('about');      // Conócenos
  this.route('contact');    // Contáctanos
  this.route('catalog');    // Catálogo de vehículos
  this.route('configurator'); // Configurador de vehículos
  this.route('vehicles', function () {
    this.route('new');
  });
  this.route('profile', { path: '/profile/:member_id' });
  this.route('login');
  this.route('register');
  this.route('not-found', { path: '/*path' });
});
