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
    <div class="auth-form-container">
      <form class="auth-form" {{on "submit" this.login}}>
        <h2>Iniciar Sesión</h2>
        
        {{#if this.error}}
          <div class="alert alert-danger">{{this.error}}</div>
        {{/if}}

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

        <button type="submit" class="btn btn-primary" disabled={{this.isLoading}}>
          {{#if this.isLoading}}
            Cargando...
          {{else}}
            Entrar
          {{/if}}
        </button>

        <div class="auth-links">
          <p>¿No tienes cuenta? <LinkTo @route="register">Regístrate aquí</LinkTo></p>
        </div>
      </form>
    </div>
  </template>
}
