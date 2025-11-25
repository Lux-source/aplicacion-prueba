import JSONSerializer from '@ember-data/serializer/json';

export default class ArticleSerializer extends JSONSerializer {
  normalizeResponse(_store, _primaryModelClass, payload, _id, _requestType) {
    if (Array.isArray(payload)) {
      payload.forEach((post) => {
        post.description = post.body;
      });
    } else if (payload) {
      payload.description = payload.body;
    }
    return super.normalizeResponse(...arguments);
  }
}
