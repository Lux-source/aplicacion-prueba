import Model, { attr } from '@ember-data/model';

export default class UserModel extends Model {
    @attr('string') name;
    @attr('string') email;
    @attr('string') password; // Note: In a real app, never store passwords in the model like this if it's being synced to a backend without hashing/security.
}
