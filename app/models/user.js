import Model, { attr } from '@ember-data/model';

export default class UserModel extends Model {
    @attr('string') username;
    @attr('string') email;
    @attr('string') password; // In a real app, never store passwords in plain text on the client!
}
