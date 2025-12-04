import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';

// Implementacion P4
export default class RegisterController extends Controller {
    @service router;
    @tracked name = '';
    @tracked email = '';
    @tracked password = '';
    @tracked confirmPassword = '';
    @tracked errorMessage = '';

    @action
    updateValue(field, event) {
        this[field] = event.target.value;
    }

    @action
    async register(event) {
        event.preventDefault();
        // Mock registration logic
        if (this.password !== this.confirmPassword) {
            this.errorMessage = 'Passwords do not match.';
            return;
        }

        if (this.name && this.email && this.password) {
            // Simulate successful registration
            console.log('Registering user:', this.name, this.email);
            this.router.transitionTo('login');
        } else {
            this.errorMessage = 'Please fill in all fields.';
        }
    }
}
