import { module, test } from 'qunit';
import { setupTest } from 'aplicacion-prueba/tests/helpers';

/**
 * Tests unitarios para la ruta Articles
 * Paquete P2: Verificación de la ruta y su modelo
 */
module('Unit | Route | articles', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:articles');
    assert.ok(route, 'route exists');
  });

  test('it has a model hook', function (assert) {
    let route = this.owner.lookup('route:articles');
    assert.ok(typeof route.model === 'function', 'route has model method');
  });

  test('it uses the store service', function (assert) {
    let route = this.owner.lookup('route:articles');
    assert.ok(route.store, 'route has access to store service');
  });
});
