import { module, test } from 'qunit';
import { setupTest } from 'aplicacion-prueba/tests/helpers';

module('Unit | Route | articles', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:articles');
    assert.ok(route);
  });
});
