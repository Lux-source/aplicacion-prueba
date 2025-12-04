import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';

export default class RegisterForm extends Component {
  @service session;
  @service router;

  @tracked name = '';
  @tracked email = '';
  @tracked password = '';
  @tracked confirmPassword = '';
  @tracked error = null;
  @tracked isLoading = false;

  @action
  updateName(event) {
    this.name = event.target.value;
  }

  @action
  updateEmail(event) {
    this.email = event.target.value;
  }

  @action
  updatePassword(event) {
    this.password = event.target.value;
  }

  @action
  updateConfirmPassword(event) {
    this.confirmPassword = event.target.value;
  }

  @action
  async register(event) {
    event.preventDefault();
    this.error = null;

    if (this.password !== this.confirmPassword) {
      this.error = 'Las contraseñas no coinciden';
      return;
    }

    this.isLoading = true;

    try {
      await this.session.register(this.name, this.email, this.password);
      this.router.transitionTo('index');
    } catch (e) {
      this.error = e.message || 'Ocurrió un error al registrarse';
    } finally {
      this.isLoading = false;
    }
  }

  <template>
    <div class="container page-enter">
      <div class="auth-page">
        <h1 class="auth-title">Crear Cuenta</h1>
        <p class="auth-subtitle">Únete a la comunidad de Lujan Motors</p>

        <form class="auth-form" {{on "submit" this.register}}>
          {{#if this.error}}
            <div class="alert alert-danger">{{this.error}}</div>
          {{/if}}

          <div class="form-group">
            <label for="name">Nombre Completo</label>
            <input
              id="name"
              type="text"
              value={{this.name}}
              {{on "input" this.updateName}}
              required
              class="form-control"
              placeholder="Juan Pérez"
            />
          </div>

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

          <div class="form-group">
            <label for="confirmPassword">Confirmar Contraseña</label>
            <input
              id="confirmPassword"
              type="password"
              value={{this.confirmPassword}}
              {{on "input" this.updateConfirmPassword}}
              required
              class="form-control"
              placeholder="••••••••"
            />
          </div>

          <button type="submit" class="btn btn-primary btn-block btn-lg" disabled={{this.isLoading}}>
            {{#if this.isLoading}}
              Cargando...
            {{else}}
              Registrarse
            {{/if}}
          </button>

          <div class="auth-footer">
            ¿Ya tienes cuenta? <LinkTo @route="login">Inicia sesión</LinkTo>
          </div>
        </form>
      </div>
    </div>
  </template>
}
