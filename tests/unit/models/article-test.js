import { setupTest } from 'aplicacion-prueba/tests/helpers';
import { module, test } from 'qunit';

/**
 * Tests unitarios para el modelo Article
 * Paquete P2: Verificación completa del modelo y sus propiedades
 */
module('Unit | Model | article', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const store = this.owner.lookup('service:store');
    const model = store.createRecord('article', {});
    assert.ok(model, 'model exists');
  });

  test('it has the correct attributes', function (assert) {
    const store = this.owner.lookup('service:store');
    const model = store.createRecord('article', {
      userId: 1,
      title: 'Test Article',
      body: 'This is the body of the test article',
      description: 'Short description',
    });

    assert.strictEqual(model.userId, 1, 'userId is correct');
    assert.strictEqual(model.title, 'Test Article', 'title is correct');
    assert.strictEqual(model.body, 'This is the body of the test article', 'body is correct');
    assert.strictEqual(model.description, 'Short description', 'description is correct');
  });

  test('excerpt property returns truncated body', function (assert) {
    const store = this.owner.lookup('service:store');
    const longBody = 'A'.repeat(150);
    const model = store.createRecord('article', {
      body: longBody,
    });

    assert.strictEqual(model.excerpt.length, 103, 'excerpt is truncated to 100 chars + "..."');
    assert.ok(model.excerpt.endsWith('...'), 'excerpt ends with ellipsis');
  });

  test('excerpt property returns full body if short', function (assert) {
    const store = this.owner.lookup('service:store');
    const shortBody = 'Short body';
    const model = store.createRecord('article', {
      body: shortBody,
    });

    assert.strictEqual(model.excerpt, shortBody, 'excerpt returns full body when short');
  });

  test('hasContent property works correctly', function (assert) {
    const store = this.owner.lookup('service:store');
    
    const emptyModel = store.createRecord('article', {});
    assert.false(emptyModel.hasContent, 'hasContent is false for empty model');

    const partialModel = store.createRecord('article', {
      title: 'Only title',
    });
    assert.false(partialModel.hasContent, 'hasContent is false when only title');

    const fullModel = store.createRecord('article', {
      title: 'Full Article',
      body: 'Has body content',
    });
    assert.true(fullModel.hasContent, 'hasContent is true when title and body exist');
  });

  test('default values are correct', function (assert) {
    const store = this.owner.lookup('service:store');
    const model = store.createRecord('article', {});

    assert.strictEqual(model.favorited, undefined, 'favorited is undefined by default');
    assert.strictEqual(model.favoritesCount, undefined, 'favoritesCount is undefined by default');
    assert.strictEqual(model.tagList, undefined, 'tagList is undefined by default');
  });
});
