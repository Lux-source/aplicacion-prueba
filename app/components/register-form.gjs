import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { LinkTo } from '@ember/routing';

export default class RegisterForm extends Component {
  @service session;
  @service router;

  @tracked username = '';
  @tracked email = '';
  @tracked password = '';
  @tracked confirmPassword = '';
  @tracked error = null;
  @tracked isLoading = false;

  @action
  updateUsername(event) {
    this.username = event.target.value;
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
      await this.session.register(this.username, this.email, this.password);
      this.router.transitionTo('index');
    } catch (e) {
      this.error = e.message || 'Ocurrió un error al registrarse';
    } finally {
      this.isLoading = false;
    }
  }

  <template>
    <div class="auth-form-container">
      <form class="auth-form" {{on "submit" this.register}}>
        <h2>Registro</h2>
        
        {{#if this.error}}
          <div class="alert alert-danger">{{this.error}}</div>
        {{/if}}

        <div class="form-group">
          <label for="username">Nombre de usuario</label>
          <input 
            id="username" 
            type="text" 
            value={{this.username}} 
            {{on "input" this.updateUsername}}
            required
            class="form-control"
          />
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input 
            id="email" 
            type="email" 
            value={{this.email}} 
            {{on "input" this.updateEmail}}
            required
            class="form-control"
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
          />
        </div>

        <button type="submit" class="btn btn-primary" disabled={{this.isLoading}}>
          {{#if this.isLoading}}
            Cargando...
          {{else}}
            Registrarse
          {{/if}}
        </button>

        <div class="auth-links">
          <p>¿Ya tienes cuenta? <LinkTo @route="login">Inicia sesión aquí</LinkTo></p>
        </div>
      </form>
    </div>
  </template>
}
