import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
import { inject as service } from '@ember/service';
const eq = (a, b) => a === b;

/**
 * Componente de catálogo de vehículos con CRUD
 * Muestra vehículos con filtros por tipo y permite añadir/editar/eliminar
 */
export default class VehicleCatalog extends Component {
  @service cars;
  @service session;

  @tracked selectedType = 'todos';
  @tracked showModal = false;
  @tracked editingVehicle = null;
  @tracked formData = {
    name: '',
    type: 'Deportivo',
    description: '',
    price: 0,
    image: '',
    specs: { potencia: '', velocidadMax: '', aceleracion: '' }
  };
  get vehicles() {
    return this.cars.vehicles || [];
  }

  get types() {
    return this.cars.types || ['Deportivo', 'SUV', 'Sedán'];
  }

  get filteredVehicles() {
    if (this.selectedType === 'todos') {
      return this.vehicles;
    }
    return this.vehicles.filter(v => v.type === this.selectedType);
  }

  get isEditing() {
    return this.editingVehicle !== null;
  }

  formatPrice = (price) => {
    return new Intl.NumberFormat('es-ES').format(price);
  }

  @action
  filterByType(type) {
    this.selectedType = type;
  }

  @action
  openAddModal() {
    this.editingVehicle = null;
    this.formData = {
      name: '',
      type: 'Deportivo',
      description: '',
      price: 0,
      image: '',
      specs: { potencia: '', velocidadMax: '', aceleracion: '' }
    };
    this.showModal = true;
  }

  @action
  openEditModal(vehicle) {
    this.editingVehicle = vehicle;
    this.formData = {
      name: vehicle.name,
      type: vehicle.type,
      description: vehicle.description,
      price: vehicle.price,
      image: vehicle.image || '',
      specs: { ...vehicle.specs }
    };
    this.showModal = true;
  }

  @action
  closeModal() {
    this.showModal = false;
    this.editingVehicle = null;
  }

  @action
  stopPropagation(event) {
    event.stopPropagation();
  }

  @action
  updateFormField(field, event) {
    if (field.includes('.')) {
      const [parent, child] = field.split('.');
      this.formData = {
        ...this.formData,
        [parent]: {
          ...this.formData[parent],
          [child]: event.target.value
        }
      };
    } else {
      this.formData = {
        ...this.formData,
        [field]: field === 'price' ? Number(event.target.value) : event.target.value
      };
    }
  }

  @action
  saveVehicle(event) {
    event.preventDefault();

    if (this.isEditing) {
      this.cars.updateVehicle(this.editingVehicle.id, this.formData);
    } else {
      this.cars.addVehicle(this.formData);
    }

    this.closeModal();
  }

  @action
  deleteVehicle(vehicle) {
    if (confirm(`¿Estás seguro de eliminar "${vehicle.name}"?`)) {
      this.cars.deleteVehicle(vehicle.id);
    }
  }

  <template>
    <>
    <div class="catalog">
      {{! Header con botón añadir }}
      <div class="catalog__header">
        <h2>Catálogo de Vehículos</h2>
        {{#if this.session.isAdmin}}
          <button
            type="button"
            class="btn btn-primary"
            {{on "click" this.openAddModal}}
          >
            ➕ Añadir Vehículo
          </button>
        {{/if}}
      </div>

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
              {{#if vehicle.image}}
                <img src={{vehicle.image}} alt={{vehicle.name}} style="width: 100%; height: 100%; object-fit: cover;" />
              {{else}}
                {{vehicle.emoji}}
              {{/if}}
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
                {{#if this.session.isAdmin}}
                  <div class="vehicle-card__actions">
                    <button
                      type="button"
                      class="btn btn-sm btn-outline"
                      {{on "click" (fn this.openEditModal vehicle)}}
                    >
                      ✏️ Editar
                    </button>
                    <button
                      type="button"
                      class="btn btn-sm btn-danger"
                      {{on "click" (fn this.deleteVehicle vehicle)}}
                    >
                      🗑️
                    </button>
                  </div>
                {{/if}}
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

      {{! Modal para Añadir/Editar }}
      {{#if this.showModal}}
        <div style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.6); display: flex; align-items: flex-start; justify-content: center; padding-top: 50px; z-index: 99999; overflow-y: auto;">
          <div style="background: white; border-radius: 12px; max-width: 500px; width: 90%; margin-bottom: 50px; box-shadow: 0 20px 40px rgba(0,0,0,0.3);" {{on "click" this.stopPropagation}}>
            <div style="display: flex; justify-content: space-between; align-items: center; padding: 1.5rem; border-bottom: 1px solid #eee;">
              <h3 style="margin: 0; font-size: 1.25rem;">{{if this.isEditing "Editar" "Añadir"}} Vehículo</h3>
              <button type="button" style="background: none; border: none; font-size: 1.5rem; cursor: pointer;" {{on "click" this.closeModal}}>✕</button>
            </div>

            <form style="padding: 1.5rem;" {{on "submit" this.saveVehicle}}>
              <div class="form-group">
                <label for="v-name">Nombre</label>
                <input
                  id="v-name"
                  type="text"
                  class="form-control"
                  value={{this.formData.name}}
                  {{on "input" (fn this.updateFormField "name")}}
                  required
                />
              </div>

              <div class="form-group">
                <label for="v-type">Tipo</label>
                <select
                  id="v-type"
                  class="form-control"
                  {{on "change" (fn this.updateFormField "type")}}
                >
                  <option value="Deportivo" selected={{eq this.formData.type "Deportivo"}}>Deportivo</option>
                  <option value="SUV" selected={{eq this.formData.type "SUV"}}>SUV</option>
                  <option value="Sedán" selected={{eq this.formData.type "Sedán"}}>Sedán</option>
                </select>
              </div>

              <div class="form-group">
                <label for="v-description">Descripción</label>
                <textarea
                  id="v-description"
                  class="form-control"
                  rows="3"
                  {{on "input" (fn this.updateFormField "description")}}
                >{{this.formData.description}}</textarea>
              </div>

              <div class="form-group">
                <label for="v-price">Precio (€)</label>
                <input
                  id="v-price"
                  type="number"
                  class="form-control"
                  value={{this.formData.price}}
                  {{on "input" (fn this.updateFormField "price")}}
                  required
                />
              </div>

              <div class="form-group">
                <label for="v-image">URL de Imagen</label>
                <input
                  id="v-image"
                  type="url"
                  class="form-control"
                  placeholder="https://ejemplo.com/imagen.jpg"
                  value={{this.formData.image}}
                  {{on "input" (fn this.updateFormField "image")}}
                />
                {{#if this.formData.image}}
                  <img src={{this.formData.image}} alt="Preview" style="margin-top: 0.5rem; max-width: 100%; max-height: 150px; border-radius: 8px; object-fit: cover;" />
                {{/if}}
              </div>

              <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                <div class="form-group">
                  <label for="v-potencia">Potencia</label>
                  <input
                    id="v-potencia"
                    type="text"
                    class="form-control"
                    placeholder="ej: 350 CV"
                    value={{this.formData.specs.potencia}}
                    {{on "input" (fn this.updateFormField "specs.potencia")}}
                  />
                </div>
                <div class="form-group">
                  <label for="v-velocidad">Vel. Máx</label>
                  <input
                    id="v-velocidad"
                    type="text"
                    class="form-control"
                    placeholder="ej: 250 km/h"
                    value={{this.formData.specs.velocidadMax}}
                    {{on "input" (fn this.updateFormField "specs.velocidadMax")}}
                  />
                </div>
              </div>

              <div style="display: flex; gap: 1rem; justify-content: flex-end; padding-top: 1.5rem; margin-top: 1rem; border-top: 1px solid #eee;">
                <button type="button" class="btn btn-outline" {{on "click" this.closeModal}}>
                  Cancelar
                </button>
                <button type="submit" class="btn btn-primary">
                  {{if this.isEditing "Guardar Cambios" "Añadir Vehículo"}}
                </button>
              </div>
            </form>
          </div>
        </div>
      {{/if}}
    </>
  </template>
}
