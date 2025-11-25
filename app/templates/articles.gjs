import { pageTitle } from 'ember-page-title';

<template>
  {{pageTitle "Articles"}}

  <h1>Articles</h1>

  <ul>
    {{#each @model as |article|}}
      <li>
        <h3>{{article.title}}</h3>
        <p>{{article.description}}</p>
      </li>
    {{/each}}
  </ul>

  {{outlet}}
</template>
