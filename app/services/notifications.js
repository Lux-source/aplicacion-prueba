import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';
import { later } from '@ember/runloop';

// Implementacion P4
export default class NotificationsService extends Service {
    @tracked messages = [];

    add(message, type = 'info') {
        const notification = { message, type, id: Date.now() };
        this.messages = [...this.messages, notification];

        // Auto remove after 3 seconds
        later(() => {
            this.remove(notification);
        }, 3000);
    }

    remove(notification) {
        this.messages = this.messages.filter(m => m.id !== notification.id);
    }
}
