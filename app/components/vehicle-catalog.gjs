import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

// Helper para comparación de igualdad
const eq = (a, b) => a === b;

/**
 * Componente de catálogo de vehículos
 * Muestra vehículos con filtros por tipo
 */
export default class VehicleCatalog extends Component {
  @tracked selectedType = 'todos';

  get vehicles() {
    return this.args.vehicles || [];
  }

  get types() {
    return this.args.types || ['Deportivo', 'SUV', 'Sedán'];
  }

  get filteredVehicles() {
    if (this.selectedType === 'todos') {
      return this.vehicles;
    }
    return this.vehicles.filter(v => v.type === this.selectedType);
  }

  formatPrice = (price) => {
    return new Intl.NumberFormat('es-ES').format(price);
  }

  @action
  filterByType(type) {
    this.selectedType = type;
  }

  <template>
    <div class="catalog">
      {{! Filters }}
      <div class="catalog__filters">
        <h3>Filtrar por tipo:</h3>
        <div class="filters-grid">
          <button 
            type="button"
            class="filter-btn {{if (eq this.selectedType 'todos') 'active'}}"
            {{on "click" (fn this.filterByType "todos")}}
          >
            🚘 Todos
          </button>
          {{#each this.types as |type|}}
            <button 
              type="button"
              class="filter-btn {{if (eq this.selectedType type) 'active'}}"
              {{on "click" (fn this.filterByType type)}}
            >
              {{#if (eq type "Deportivo")}}🏎️{{/if}}
              {{#if (eq type "SUV")}}🚙{{/if}}
              {{#if (eq type "Sedán")}}🚗{{/if}}
              {{type}}
            </button>
          {{/each}}
        </div>
      </div>

      {{! Vehicle Grid }}
      <div class="catalog__grid">
        {{#each this.filteredVehicles as |vehicle|}}
          <article class="vehicle-card">
            <div class="vehicle-card__image">
              {{vehicle.emoji}}
            </div>
            <div class="vehicle-card__content">
              <span class="vehicle-card__type">{{vehicle.type}}</span>
              <h3 class="vehicle-card__name">{{vehicle.name}}</h3>
              <p class="vehicle-card__description">{{vehicle.description}}</p>
              
              <div class="vehicle-card__specs">
                <div class="spec">
                  <span class="spec-icon">⚡</span>
                  <span>{{vehicle.specs.potencia}}</span>
                </div>
                <div class="spec">
                  <span class="spec-icon">🏁</span>
                  <span>{{vehicle.specs.velocidadMax}}</span>
                </div>
                <div class="spec">
                  <span class="spec-icon">⏱️</span>
                  <span>{{vehicle.specs.aceleracion}}</span>
                </div>
              </div>

              <div class="vehicle-card__footer">
                <div class="vehicle-card__price">
                  Desde {{this.formatPrice vehicle.price}}€
                </div>
                <a href="/configurator" class="btn btn-primary">
                  Configurar
                </a>
              </div>
            </div>
          </article>
        {{/each}}
      </div>

      {{#if (eq this.filteredVehicles.length 0)}}
        <div class="alert alert--info" style="text-align: center; margin-top: 2rem;">
          <p>No hay vehículos disponibles con los filtros seleccionados.</p>
        </div>
      {{/if}}
    </div>
  </template>
}
