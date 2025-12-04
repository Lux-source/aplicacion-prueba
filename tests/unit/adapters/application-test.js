import { setupTest } from 'aplicacion-prueba/tests/helpers';
import { module, test } from 'qunit';

/**
 * Tests unitarios para el ApplicationAdapter
 * Paquete P2: Verificación del adapter REST para JSONPlaceholder
 */
module('Unit | Adapter | application', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const adapter = this.owner.lookup('adapter:application');
    assert.ok(adapter, 'adapter exists');
  });

  test('it has correct host', function (assert) {
    const adapter = this.owner.lookup('adapter:application');
    assert.strictEqual(
      adapter.host,
      'https://jsonplaceholder.typicode.com',
      'host is JSONPlaceholder API'
    );
  });

  test('pathForType returns "posts" for article type', function (assert) {
    const adapter = this.owner.lookup('adapter:application');
    const path = adapter.pathForType('article');
    assert.strictEqual(path, 'posts', 'article type maps to posts endpoint');
  });

  test('pathForType returns pluralized type for other types', function (assert) {
    const adapter = this.owner.lookup('adapter:application');
    const path = adapter.pathForType('user');
    assert.strictEqual(path, 'users', 'other types are pluralized normally');
  });
});
