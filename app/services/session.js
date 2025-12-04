import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';

// Credenciales de administrador
const ADMIN_EMAIL = 'administrador@correo.com';
const ADMIN_PASSWORD = 'Administrador';

export default class SessionService extends Service {
    @service store;
    @service router;

    @tracked isAuthenticated = false;
    @tracked currentUser = null;
    @tracked isAdmin = false;

    async login(email, password) {
        // Check admin credentials first
        if (email === ADMIN_EMAIL && password === ADMIN_PASSWORD) {
            this.isAuthenticated = true;
            this.isAdmin = true;
            this.currentUser = { email: ADMIN_EMAIL, name: 'Administrador' };
            localStorage.setItem('isAuthenticated', 'true');
            localStorage.setItem('isAdmin', 'true');
            localStorage.setItem('adminEmail', ADMIN_EMAIL);
            return true;
        }

        // Mock authentication logic for regular users
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
        this.isAdmin = false;
        localStorage.removeItem('isAuthenticated');
        localStorage.removeItem('currentUserId');
        localStorage.removeItem('authToken');
        localStorage.removeItem('isAdmin');
        localStorage.removeItem('adminEmail');
        this.router.transitionTo('index');
    }

    async restore() {
        const isAuth = localStorage.getItem('isAuthenticated');
        const isAdminStored = localStorage.getItem('isAdmin');
        const adminEmail = localStorage.getItem('adminEmail');
        const userId = localStorage.getItem('currentUserId');

        // Restore admin session
        if (isAuth && isAdminStored && adminEmail === ADMIN_EMAIL) {
            this.isAuthenticated = true;
            this.isAdmin = true;
            this.currentUser = { email: ADMIN_EMAIL, name: 'Administrador' };
            return;
        }

        // Restore regular user session
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
