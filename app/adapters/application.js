import RESTAdapter from '@ember-data/adapter/rest';

export default class ApplicationAdapter extends RESTAdapter {
  host = 'https://jsonplaceholder.typicode.com';

  pathForType(type) {
    if (type === 'article') {
      return 'posts';
    }
    return super.pathForType(...arguments);
  }
}
