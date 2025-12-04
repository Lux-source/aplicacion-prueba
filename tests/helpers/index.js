import {
  setupApplicationTest as upstreamSetupApplicationTest,
  setupRenderingTest as upstreamSetupRenderingTest,
  setupTest as upstreamSetupTest,
} from 'ember-qunit';

function setupApplicationTest(hooks, options) {
  upstreamSetupApplicationTest(hooks, options);

}

function setupRenderingTest(hooks, options) {
  upstreamSetupRenderingTest(hooks, options);

}

function setupTest(hooks, options) {
  upstreamSetupTest(hooks, options);

}

export { setupApplicationTest, setupRenderingTest, setupTest };
