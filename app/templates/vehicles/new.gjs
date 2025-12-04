import { pageTitle } from 'ember-page-title';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import { LinkTo } from '@ember/routing';

const eq = (a, b) => a === b;

<template>
  {{pageTitle "Nuevo Vehículo - Lujan Motors"}}

  <div class="container page-enter">
    <div class="auth-page" style="max-width: 800px;">
      <div class="section__header">
        <h1 class="section__title">Añadir Nuevo Vehículo</h1>
        <p class="section__subtitle">Registra un nuevo coche en el inventario</p>
      </div>

      <form class="auth-form" {{on "submit" @controller.saveVehicle}}>
        <div class="form-row">
          <div class="form-group">
            <label for="make">Marca</label>
            <input 
              type="text" 
              id="make" 
              class="form-control" 
              placeholder="Ej. BMW"
              value={{@controller.make}}
              {{on "input" (fn @controller.updateValue "make")}}
            />
          </div>
          <div class="form-group">
            <label for="model">Modelo</label>
            <input 
              type="text" 
              id="model" 
              class="form-control" 
              placeholder="Ej. X5"
              value={{@controller.model}}
              {{on "input" (fn @controller.updateValue "model")}}
            />
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="year">Año</label>
            <input 
              type="number" 
              id="year" 
              class="form-control" 
              value={{@controller.year}}
              {{on "input" (fn @controller.updateValue "year")}}
            />
          </div>
          <div class="form-group">
            <label for="price">Precio (€)</label>
            <input 
              type="number" 
              id="price" 
              class="form-control" 
              value={{@controller.price}}
              {{on "input" (fn @controller.updateValue "price")}}
            />
          </div>
        </div>

        <div class="form-group">
          <label for="type">Tipo</label>
          <select 
            id="type" 
            class="form-control"
            {{on "change" (fn @controller.updateValue "type")}}
          >
            <option value="Sedán" selected={{if (eq @controller.type "Sedán") "selected"}}>Sedán</option>
            <option value="SUV" selected={{if (eq @controller.type "SUV") "selected"}}>SUV</option>
            <option value="Deportivo" selected={{if (eq @controller.type "Deportivo") "selected"}}>Deportivo</option>
            <option value="Compacto" selected={{if (eq @controller.type "Compacto") "selected"}}>Compacto</option>
            <option value="Familiar" selected={{if (eq @controller.type "Familiar") "selected"}}>Familiar</option>
          </select>
        </div>

        <div class="form-group">
          <label for="description">Descripción</label>
          <textarea 
            id="description" 
            class="form-control" 
            rows="4"
            {{on "input" (fn @controller.updateValue "description")}}
          >{{@controller.description}}</textarea>
        </div>

        <div class="form-actions">
          <LinkTo @route="vehicles" class="btn btn-outline">
            Cancelar
          </LinkTo>
          <button type="submit" class="btn btn-primary">
            Guardar Vehículo
          </button>
        </div>
      </form>
    </div>
  </div>
</template>
