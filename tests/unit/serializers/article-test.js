import { module, test } from 'qunit';
import { setupTest } from 'aplicacion-prueba/tests/helpers';

/**
 * Tests unitarios para el Serializer de Article
 * Paquete P2: Verificación de la transformación de datos
 */
module('Unit | Serializer | article', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const serializer = this.owner.lookup('serializer:article');
    assert.ok(serializer, 'serializer exists');
  });

  test('transformPost adds required fields', function (assert) {
    const serializer = this.owner.lookup('serializer:article');
    
    const post = {
      id: 1,
      userId: 1,
      title: 'Test Post',
      body: 'This is the body content',
    };
    
    const transformed = serializer.transformPost(post);
    
    assert.strictEqual(transformed.id, 1, 'id is preserved');
    assert.strictEqual(transformed.userId, 1, 'userId is preserved');
    assert.strictEqual(transformed.title, 'Test Post', 'title is preserved');
    assert.strictEqual(transformed.body, 'This is the body content', 'body is preserved');
    assert.ok(transformed.description, 'description is added');
    assert.ok(transformed.slug, 'slug is generated');
    assert.ok(transformed.createdAt, 'createdAt is added');
    assert.ok(transformed.updatedAt, 'updatedAt is added');
    assert.strictEqual(transformed.favorited, false, 'favorited defaults to false');
    assert.strictEqual(transformed.favoritesCount, 0, 'favoritesCount defaults to 0');
    assert.ok(Array.isArray(transformed.tagList), 'tagList is an array');
  });

  test('generateSlug creates valid slug', function (assert) {
    const serializer = this.owner.lookup('serializer:article');
    
    assert.strictEqual(
      serializer.generateSlug('Hello World'),
      'hello-world',
      'basic slug generation works'
    );
    
    assert.strictEqual(
      serializer.generateSlug('Test! With@ Special# Chars'),
      'test-with-special-chars',
      'special characters are removed'
    );
    
    assert.strictEqual(
      serializer.generateSlug(''),
      '',
      'empty string returns empty slug'
    );
  });

  test('extractTags extracts words from body', function (assert) {
    const serializer = this.owner.lookup('serializer:article');
    
    const tags = serializer.extractTags('hello world testing ember application');
    
    assert.ok(Array.isArray(tags), 'returns an array');
    assert.ok(tags.length > 0, 'extracts some tags');
    assert.ok(tags.every(t => t.length > 3), 'tags are longer than 3 chars');
  });

  test('extractTags returns empty array for empty body', function (assert) {
    const serializer = this.owner.lookup('serializer:article');
    
    assert.deepEqual(serializer.extractTags(''), [], 'empty body returns empty array');
    assert.deepEqual(serializer.extractTags(null), [], 'null returns empty array');
  });
});
