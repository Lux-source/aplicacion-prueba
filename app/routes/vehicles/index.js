import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';

export default class VehiclesIndexRoute extends Route {
    @service store;

    async model() {
        // In a real app, this would fetch from the API
        // return this.store.findAll('vehicle');

        // For now, return mock data if store is empty or just mock objects
        return [
            {
                id: '1',
                make: 'Lujan',
                model: 'Sport GT',
                year: 2024,
                price: 75000,
                type: 'Deportivo',
                image: '🏎️',
                description: 'El deportivo definitivo.'
            },
            {
                id: '2',
                make: 'Lujan',
                model: 'Explorer',
                year: 2023,
                price: 55000,
                type: 'SUV',
                image: '🚙',
                description: 'Para cualquier terreno.'
            },
            {
                id: '3',
                make: 'Lujan',
                model: 'Executive',
                year: 2024,
                price: 48000,
                type: 'Sedán',
                image: '🚗',
                description: 'Elegancia y confort.'
            }
        ];
    }
}
