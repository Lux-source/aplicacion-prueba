import { module, test } from 'qunit';
import { setupTest } from 'aplicacion-prueba/tests/helpers';

/**
 * Tests unitarios para el Controller de Articles
 * Paquete P2: Verificación de la lógica del controller
 */
module('Unit | Controller | articles', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    assert.ok(controller, 'controller exists');
  });

  test('it has default sort values', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    
    assert.strictEqual(controller.sortField, 'id', 'default sortField is id');
    assert.strictEqual(controller.sortDirection, 'asc', 'default sortDirection is asc');
  });

  test('sortOptions returns correct options', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    
    assert.strictEqual(controller.sortOptions.length, 3, 'has 3 sort options');
    assert.deepEqual(
      controller.sortOptions.map(o => o.value),
      ['id', 'title', 'userId'],
      'sort options have correct values'
    );
  });

  test('toggleSortDirection changes direction', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    
    assert.strictEqual(controller.sortDirection, 'asc', 'starts as asc');
    
    controller.toggleSortDirection();
    assert.strictEqual(controller.sortDirection, 'desc', 'changes to desc');
    
    controller.toggleSortDirection();
    assert.strictEqual(controller.sortDirection, 'asc', 'changes back to asc');
  });

  test('resetFilters resets all values', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    
    // Change values
    controller.sortField = 'title';
    controller.sortDirection = 'desc';
    controller.selectedArticle = { id: 1 };
    
    // Reset
    controller.resetFilters();
    
    assert.strictEqual(controller.sortField, 'id', 'sortField reset to id');
    assert.strictEqual(controller.sortDirection, 'asc', 'sortDirection reset to asc');
    assert.strictEqual(controller.selectedArticle, null, 'selectedArticle reset to null');
  });

  test('viewArticle sets selectedArticle', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    const article = { id: 1, title: 'Test' };
    
    controller.viewArticle(article);
    
    assert.deepEqual(controller.selectedArticle, article, 'selectedArticle is set');
  });

  test('closeDetails clears selectedArticle', function (assert) {
    let controller = this.owner.lookup('controller:articles');
    controller.selectedArticle = { id: 1 };
    
    controller.closeDetails();
    
    assert.strictEqual(controller.selectedArticle, null, 'selectedArticle is cleared');
  });
});
