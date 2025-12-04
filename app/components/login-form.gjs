import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';

export default class LoginForm extends Component {
  @service session;
  @service router;

  @tracked email = '';
  @tracked password = '';
  @tracked error = null;
  @tracked isLoading = false;

  @action
  updateEmail(event) {
    this.email = event.target.value;
  }

  @action
  updatePassword(event) {
    this.password = event.target.value;
  }

  @action
  async login(event) {
    event.preventDefault();
    this.error = null;
    this.isLoading = true;

    try {
      const success = await this.session.login(this.email, this.password);
      if (success) {
        this.router.transitionTo('index');
      } else {
        this.error = 'Email o contraseña incorrectos';
      }
    } catch (e) {
      this.error = 'Ocurrió un error al intentar iniciar sesión';
      console.error(e);
    } finally {
      this.isLoading = false;
    }
  }

  <template>
    <div class="container page-enter">
      <div class="auth-page">
        <h1 class="auth-title">Iniciar Sesión</h1>
        <p class="auth-subtitle">Bienvenido de nuevo a Lujan Motors</p>

        <form class="auth-form" {{on "submit" this.login}}>
          {{#if this.error}}
            <div class="alert alert-danger">{{this.error}}</div>
          {{/if}}

          <div class="form-group">
            <label for="email">Correo Electrónico</label>
            <input
              id="email"
              type="email"
              value={{this.email}}
              {{on "input" this.updateEmail}}
              required
              class="form-control"
              placeholder="tu@email.com"
            />
          </div>

          <div class="form-group">
            <label for="password">Contraseña</label>
            <input
              id="password"
              type="password"
              value={{this.password}}
              {{on "input" this.updatePassword}}
              required
              class="form-control"
              placeholder="••••••••"
            />
          </div>

          <button type="submit" class="btn btn-primary btn-block btn-lg" disabled={{this.isLoading}}>
            {{#if this.isLoading}}
              Cargando...
            {{else}}
              Entrar
            {{/if}}
          </button>

          <div class="auth-footer">
            ¿No tienes cuenta? <LinkTo @route="register">Regístrate aquí</LinkTo>
          </div>
        </form>
      </div>
    </div>
  </template>
}
