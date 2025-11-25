import Model, { attr } from '@ember-data/model';

export default class ArticleModel extends Model {
  @attr('string') slug;
  @attr('string') title;
  @attr('string') description;
  @attr('string') body;
  @attr('date') createdAt;
  @attr('date') updatedAt;
  @attr('boolean') favorited;
  @attr('number') favoritesCount;
  @attr tagList;
}
