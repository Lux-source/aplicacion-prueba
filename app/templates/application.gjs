import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import { action } from '@ember/object';
import { pageTitle } from 'ember-page-title';
import { LinkTo } from '@ember/routing';
import { on } from '@ember/modifier';
import NotificationContainer from 'aplicacion-prueba/components/ui/notification';

export default class Application extends Component {
  @service session;
  @service router;

  @action
  logout() {
    this.session.logout();
  }

  <template>
    {{pageTitle "Lujan Motors - Concesionario Premium"}}

    <div class="app-container">
      <NotificationContainer />
      <header class="app-header">
        <div class="app-header__brand">
          <div class="app-header__logo">LM</div>
          <h1 class="app-header__title">Lujan <span>Motors</span></h1>
        </div>
        
        <nav class="app-header__nav">
          <ul class="app-nav">
            <li class="app-nav__item">
              <LinkTo @route="index" class="app-nav__link">
                🏠 Inicio
              </LinkTo>
            </li>
            <li class="app-nav__item">
              <LinkTo @route="catalog" class="app-nav__link">
                🚗 Catálogo
              </LinkTo>
            </li>
            <li class="app-nav__item">
              <LinkTo @route="configurator" class="app-nav__link">
                ⚙️ Configurador
              </LinkTo>
            </li>
            <li class="app-nav__item">
              <LinkTo @route="about" class="app-nav__link">
                👥 Conócenos
              </LinkTo>
            </li>
            <li class="app-nav__item">
              <LinkTo @route="contact" class="app-nav__link">
                📞 Contacto
              </LinkTo>
            </li>
            <li class="app-nav__item">
              <LinkTo @route="vehicles" class="app-nav__link">
                🚙 Gestión Vehículos
              </LinkTo>
            </li>
            
            {{#if this.session.isAuthenticated}}
              <li class="app-nav__item">
                <button type="button" class="app-nav__link btn-link" {{on "click" this.logout}}>
                  🚪 Salir ({{this.session.currentUser.name}})
                </button>
              </li>
            {{else}}
              <li class="app-nav__item">
                <LinkTo @route="login" class="app-nav__link">
                  🔑 Entrar
                </LinkTo>
              </li>
              <li class="app-nav__item">
                <LinkTo @route="register" class="app-nav__link">
                  📝 Registro
                </LinkTo>
              </li>
            {{/if}}
          </ul>
        </nav>

        <button class="mobile-menu-btn" type="button" aria-label="Menú">
          ☰
        </button>
      </header>

      <main class="app-main">
        {{outlet}}
      </main>

      <footer class="app-footer">
        <div class="footer-content">
          <div class="footer-section">
            <h4>Lujan Motors</h4>
            <p>
              Tu concesionario de confianza desde 2004. 
              Más de 20 años ofreciendo vehículos de calidad 
              y un servicio excepcional.
            </p>
          </div>

          <div class="footer-section">
            <h4>Enlaces Rápidos</h4>
            <ul>
              <li><LinkTo @route="index">Inicio</LinkTo></li>
              <li><LinkTo @route="catalog">Catálogo</LinkTo></li>
              <li><LinkTo @route="configurator">Configurador</LinkTo></li>
              <li><LinkTo @route="about">Conócenos</LinkTo></li>
              <li><LinkTo @route="contact">Contacto</LinkTo></li>
            </ul>
          </div>

          <div class="footer-section">
            <h4>Servicios</h4>
            <ul>
              <li><LinkTo @route="catalog">Venta de Vehículos</LinkTo></li>
              <li><LinkTo @route="contact">Servicio Técnico</LinkTo></li>
              <li><LinkTo @route="contact">Financiación</LinkTo></li>
              <li><LinkTo @route="contact">Garantía Extendida</LinkTo></li>
              <li><LinkTo @route="contact">Tasación de Vehículos</LinkTo></li>
            </ul>
          </div>

          <div class="footer-section">
            <h4>Contacto</h4>
            <p>📍 Av. Principal 1234</p>
            <p>📞 +34 912 345 678</p>
            <p>✉️ info@lujanmotors.com</p>
            <p>🕐 Lun-Vie: 9:00-20:00</p>
          </div>
        </div>

        <div class="footer-bottom">
          <p>© 2024 Lujan Motors. Todos los derechos reservados.</p>
          <p>Desarrollado con ❤️ usando Ember.js</p>
        </div>
      </footer>
    </div>
  </template>
}
