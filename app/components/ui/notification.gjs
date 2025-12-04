import Component from '@glimmer/component';
import { inject as service } from '@ember/service';

// Implementacion P4
export default class NotificationContainer extends Component {
  @service notifications;

  <template>
    <div class="notification-container">
      {{#each this.notifications.messages as |msg|}}
        <div class="notification notification--{{msg.type}} animate-fade-in-up">
          {{msg.message}}
        </div>
      {{/each}}
    </div>
  </template>
}
