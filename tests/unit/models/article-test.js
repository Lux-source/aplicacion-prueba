import { setupTest } from 'aplicacion-prueba/tests/helpers';
import { module, test } from 'qunit';

module('Unit | Model | article', function (hooks) {
  setupTest(hooks);

  // Replace this with your real tests.
  test('it exists', function (assert) {
    const store = this.owner.lookup('service:store');
    const model = store.createRecord('article', {});
    assert.ok(model, 'model exists');
  });
});
