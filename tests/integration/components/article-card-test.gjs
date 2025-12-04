import { module, test } from 'qunit';
import { setupRenderingTest } from 'aplicacion-prueba/tests/helpers';
import { render } from '@ember/test-helpers';
import ArticleCard from 'aplicacion-prueba/components/article-card';

/**
 * Tests de integración para el componente ArticleCard
 * Paquete P2: Verificación del renderizado del componente
 */
module('Integration | Component | article-card', function (hooks) {
  setupRenderingTest(hooks);

  test('it renders article information', async function (assert) {
    const article = {
      id: 1,
      userId: 1,
      title: 'Test Article Title',
      body: 'This is the body of the test article',
      excerpt: 'This is the body of the test article',
    };

    await render(
      <template>
        <ArticleCard @article={{article}} />
      </template>
    );

    assert.dom('.article-card').exists('card container exists');
    assert.dom('.article-card__title').hasText('Test Article Title', 'title is displayed');
    assert.dom('.article-card__author').hasText('Usuario #1', 'author is displayed');
    assert.dom('.article-card__id').hasText('ID: 1', 'id is displayed');
  });

  test('it shows excerpt when @showExcerpt is true', async function (assert) {
    const article = {
      id: 1,
      title: 'Test',
      body: 'Full body content here',
      excerpt: 'Excerpt content...',
    };

    await render(
      <template>
        <ArticleCard @article={{article}} @showExcerpt={{true}} />
      </template>
    );

    assert.dom('.article-card__body').hasText('Excerpt content...', 'excerpt is shown');
  });

  test('it shows full body when @showExcerpt is false', async function (assert) {
    const article = {
      id: 1,
      title: 'Test',
      body: 'Full body content here',
      excerpt: 'Excerpt content...',
    };

    await render(
      <template>
        <ArticleCard @article={{article}} @showExcerpt={{false}} />
      </template>
    );

    assert.dom('.article-card__body').hasText('Full body content here', 'full body is shown');
  });

  test('it does not show button when @onSelect is not provided', async function (assert) {
    const article = { id: 1, title: 'Test', body: 'Body' };

    await render(
      <template>
        <ArticleCard @article={{article}} />
      </template>
    );

    assert.dom('.article-card__button').doesNotExist('button is not shown');
  });
});
