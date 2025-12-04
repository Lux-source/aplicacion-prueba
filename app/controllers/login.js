import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';

// Implementacion P4
export default class LoginController extends Controller {
    @service router;
    @service session;
    @service notifications;
    @tracked email = '';
    @tracked password = '';
    @tracked errorMessage = '';

    @action
    updateValue(field, event) {
        this[field] = event.target.value;
    }

    @action
    async login(event) {
        event.preventDefault();
        // Mock login logic
        if (this.email && this.password) {
            // Simulate successful login
            console.log('Logging in with:', this.email, this.password);
            this.session.login({ email: this.email });
            this.notifications.add('Inicio de sesión exitoso', 'success');
            this.router.transitionTo('index');
        } else {
            this.errorMessage = 'Please enter both email and password.';
        }
    }
}
