import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';

/**
 * Componente de formulario de contacto
 * Formulario con validación para contactar con Lujan Motors
 */
export default class ContactForm extends Component {
  @tracked name = '';
  @tracked email = '';
  @tracked phone = '';
  @tracked subject = '';
  @tracked message = '';
  @tracked submitted = false;
  @tracked errors = {};

  get isValid() {
    return this.name && this.email && this.message && this.validateEmail(this.email);
  }

  validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
  }

  @action
  updateName(event) {
    this.name = event.target.value;
  }

  @action
  updateEmail(event) {
    this.email = event.target.value;
  }

  @action
  updatePhone(event) {
    this.phone = event.target.value;
  }

  @action
  updateSubject(event) {
    this.subject = event.target.value;
  }

  @action
  updateMessage(event) {
    this.message = event.target.value;
  }

  @action
  handleSubmit(event) {
    event.preventDefault();

    this.errors = {};

    if (!this.name) {
      this.errors = { ...this.errors, name: 'El nombre es obligatorio' };
    }

    if (!this.email) {
      this.errors = { ...this.errors, email: 'El email es obligatorio' };
    } else if (!this.validateEmail(this.email)) {
      this.errors = { ...this.errors, email: 'El email no es válido' };
    }

    if (!this.message) {
      this.errors = { ...this.errors, message: 'El mensaje es obligatorio' };
    }

    if (Object.keys(this.errors).length === 0) {
      this.submitted = true;
      this.name = '';
      this.email = '';
      this.phone = '';
      this.subject = '';
      this.message = '';
    }
  }

  <template>
    <div class="contact-form-wrapper">
      {{#if this.submitted}}
        <div class="alert alert--success">
          <h3>✅ ¡Mensaje Enviado!</h3>
          <p>Gracias por contactarnos. Te responderemos en menos de 24 horas.</p>
        </div>
      {{else}}
        <form class="contact-form" {{on "submit" this.handleSubmit}}>
          <h3>Envíanos un Mensaje</h3>

          <div class="form-group">
            <label for="name">Nombre *</label>
            <input
              type="text"
              id="name"
              class="form-control {{if this.errors.name 'is-invalid'}}"
              value={{this.name}}
              {{on "input" this.updateName}}
              placeholder="Tu nombre completo"
            />
            {{#if this.errors.name}}
              <span class="error-message">{{this.errors.name}}</span>
            {{/if}}
          </div>

          <div class="form-group">
            <label for="email">Email *</label>
            <input
              type="email"
              id="email"
              class="form-control {{if this.errors.email 'is-invalid'}}"
              value={{this.email}}
              {{on "input" this.updateEmail}}
              placeholder="tu@email.com"
            />
            {{#if this.errors.email}}
              <span class="error-message">{{this.errors.email}}</span>
            {{/if}}
          </div>

          <div class="form-group">
            <label for="phone">Teléfono</label>
            <input
              type="tel"
              id="phone"
              class="form-control"
              value={{this.phone}}
              {{on "input" this.updatePhone}}
              placeholder="+34 600 000 000"
            />
          </div>

          <div class="form-group">
            <label for="subject">Asunto</label>
            <select
              id="subject"
              class="form-control"
              {{on "change" this.updateSubject}}
            >
              <option value="">Selecciona un asunto</option>
              <option value="ventas">Información de ventas</option>
              <option value="servicio">Servicio técnico</option>
              <option value="financiacion">Financiación</option>
              <option value="otro">Otro</option>
            </select>
          </div>

          <div class="form-group">
            <label for="message">Mensaje *</label>
            <textarea
              id="message"
              class="form-control {{if this.errors.message 'is-invalid'}}"
              rows="5"
              {{on "input" this.updateMessage}}
              placeholder="¿En qué podemos ayudarte?"
            >{{this.message}}</textarea>
            {{#if this.errors.message}}
              <span class="error-message">{{this.errors.message}}</span>
            {{/if}}
          </div>

          <button type="submit" class="btn btn-primary btn-lg" style="width: 100%;">
            📨 Enviar Mensaje
          </button>
        </form>
      {{/if}}
    </div>
  </template>
}
