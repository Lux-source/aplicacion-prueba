import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';

export default class SessionService extends Service {
    @service store;
    @service router;

    @tracked isAuthenticated = false;
    @tracked currentUser = null;

    async login(email, password) {
        // Mock authentication logic
        // In a real app, this would make an API call

        // Find user with matching email
        const users = await this.store.findAll('user');
        const user = users.find(u => u.email === email);

        if (user && user.password === password) {
            this.isAuthenticated = true;
            this.currentUser = user;
            localStorage.setItem('isAuthenticated', 'true');
            localStorage.setItem('currentUserId', user.id);
            localStorage.setItem('authToken', 'mock-token-123'); // For compatibility with upstream if needed
            return true;
        } else {
            return false;
        }
    }

    async register(name, email, password) {
        // Check if user already exists
        const users = await this.store.findAll('user');
        const existingUser = users.find(u => u.email === email);

        if (existingUser) {
            throw new Error('El usuario ya existe');
        }

        // Create new user
        const newUser = this.store.createRecord('user', {
            name, // Changed from username to name to match upstream model
            email,
            password
        });

        await newUser.save();

        // Auto login after register
        this.isAuthenticated = true;
        this.currentUser = newUser;
        localStorage.setItem('isAuthenticated', 'true');
        localStorage.setItem('currentUserId', newUser.id);
        localStorage.setItem('authToken', 'mock-token-123');

        return true;
    }

    logout() {
        this.isAuthenticated = false;
        this.currentUser = null;
        localStorage.removeItem('isAuthenticated');
        localStorage.removeItem('currentUserId');
        localStorage.removeItem('authToken');
        this.router.transitionTo('index');
    }

    async restore() {
        const isAuth = localStorage.getItem('isAuthenticated');
        const userId = localStorage.getItem('currentUserId');

        if (isAuth && userId) {
            try {
                const user = await this.store.findRecord('user', userId);
                this.isAuthenticated = true;
                this.currentUser = user;
            } catch {
                this.logout();
            }
        }
    }
}
