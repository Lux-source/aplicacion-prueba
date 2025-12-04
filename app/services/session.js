import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

// Implementacion P4
export default class SessionService extends Service {
    @tracked isAuthenticated = false;
    @tracked currentUser = null;

    login(user) {
        this.isAuthenticated = true;
        this.currentUser = user;
        // Persistencia de token (simulada)
        localStorage.setItem('authToken', 'mock-token-123');
    }

    logout() {
        this.isAuthenticated = false;
        this.currentUser = null;
        localStorage.removeItem('authToken');
    }
}
