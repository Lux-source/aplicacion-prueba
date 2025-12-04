import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
export default class VehiclesNewRoute extends Route {
    @service session;
    @service router;

    beforeModel() {
        console.log('Entering vehicles.new route');
        if (!this.session.isAuthenticated) {
            this.router.transitionTo('login');
        }
    }
}
