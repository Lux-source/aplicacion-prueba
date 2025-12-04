import Model, { attr } from '@ember-data/model';

export default class VehicleModel extends Model {
    @attr('string') make;
    @attr('string') model;
    @attr('number') year;
    @attr('number') price;
    @attr('string') type;
    @attr('string') image;
    @attr('string') description;
}
