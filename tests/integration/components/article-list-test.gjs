import { module, test } from 'qunit';
import { setupRenderingTest } from 'aplicacion-prueba/tests/helpers';
import { render, fillIn } from '@ember/test-helpers';
import ArticleList from 'aplicacion-prueba/components/article-list';

/**
 * Tests de integración para el componente ArticleList
 * Paquete P2: Verificación del renderizado y funcionalidad del componente
 */
module('Integration | Component | article-list', function (hooks) {
  setupRenderingTest(hooks);

  const mockArticles = [
    { id: 1, userId: 1, title: 'First Article', body: 'Body one', excerpt: 'Body one' },
    { id: 2, userId: 2, title: 'Second Article', body: 'Body two', excerpt: 'Body two' },
    { id: 3, userId: 1, title: 'Third Article', body: 'Body three', excerpt: 'Body three' },
  ];

  test('it renders with articles', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} />
      </template>
    );

    assert.dom('.article-list').exists('list container exists');
    assert.dom('.article-list__items').exists('items container exists');
    assert.dom('.article-card').exists({ count: 3 }, 'renders all articles');
  });

  test('it displays correct stats', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} />
      </template>
    );

    assert.dom('.article-list__stats').hasText('Mostrando 3 de 3 artículos', 'stats are correct');
  });

  test('it displays custom title', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} @title="Custom Title" />
      </template>
    );

    assert.dom('.article-list__title').hasText('Custom Title', 'custom title is displayed');
  });

  test('it filters articles by search term', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} />
      </template>
    );

    await fillIn('.article-list__search-input', 'First');

    assert.dom('.article-card').exists({ count: 1 }, 'only matching article is shown');
    assert.dom('.article-list__stats').hasText('Mostrando 1 de 3 artículos', 'stats update');
  });

  test('it shows empty message when no articles match', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} />
      </template>
    );

    await fillIn('.article-list__search-input', 'nonexistent');

    assert.dom('.article-list__empty').exists('empty message is shown');
    assert.dom('.article-card').doesNotExist('no articles shown');
  });

  test('it shows empty message when articles array is empty', async function (assert) {
    const emptyArticles = [];

    await render(
      <template>
        <ArticleList @articles={{emptyArticles}} />
      </template>
    );

    assert.dom('.article-list__empty').exists('empty message is shown');
    assert.dom('.article-list__empty').hasText('No hay artículos disponibles', 'correct message');
  });

  test('search input has placeholder', async function (assert) {
    await render(
      <template>
        <ArticleList @articles={{mockArticles}} />
      </template>
    );

    assert.dom('.article-list__search-input').hasAttribute(
      'placeholder',
      'Buscar artículos...',
      'placeholder is correct'
    );
  });
});
