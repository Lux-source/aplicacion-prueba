import Controller from '@ember/controller';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';
import { inject as service } from '@ember/service';
import { fn } from '@ember/helper';

export default class VehiclesNewController extends Controller {
    @service router;
    @service store;

    @tracked make = '';
    @tracked model = '';
    @tracked year = new Date().getFullYear();
    @tracked price = 0;
    @tracked type = 'Sedán';
    @tracked description = '';
    @tracked image = '🚗';

    @action
    updateValue(field, event) {
        this[field] = event.target.value;
    }

    @action
    async saveVehicle(event) {
        event.preventDefault();

        // In a real app, create record and save
        // const vehicle = this.store.createRecord('vehicle', { ... });
        // await vehicle.save();

        console.log('Saving vehicle:', {
            make: this.make,
            model: this.model,
            year: this.year,
            price: this.price,
            type: this.type,
            description: this.description
        });

        this.router.transitionTo('vehicles');
    }
}
