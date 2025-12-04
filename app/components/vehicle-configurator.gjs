import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';
const eq = (a, b) => a === b;

/**
 * Componente configurador de vehículos
 * Permite personalizar color y extras de un vehículo
 */
export default class VehicleConfigurator extends Component {
  @tracked selectedVehicle = null;
  @tracked selectedColor = 'Negro';
  @tracked selectedExtras = [];

  get vehicles() {
    return this.args.vehicles || [];
  }

  get colorOptions() {
    return this.args.colorOptions || [];
  }

  get extras() {
    return this.args.extras || [];
  }

  get totalPrice() {
    if (!this.selectedVehicle) return 0;

    let total = this.selectedVehicle.price;

    const colorOption = this.colorOptions.find(c => c.name === this.selectedColor);
    if (colorOption) {
      total += colorOption.price;
    }

    this.selectedExtras.forEach(extraId => {
      const extra = this.extras.find(e => e.id === extraId);
      if (extra) {
        total += extra.price;
      }
    });

    return total;
  }

  get selectedVehicleId() {
    return this.selectedVehicle?.id;
  }

  formatPrice = (price) => {
    return new Intl.NumberFormat('es-ES').format(price);
  }

  isExtraSelected = (extraId) => {
    return this.selectedExtras.includes(extraId);
  }

  @action
  selectVehicle(vehicle) {
    this.selectedVehicle = vehicle;
    this.selectedExtras = [];
  }

  @action
  selectColor(colorName) {
    this.selectedColor = colorName;
  }

  @action
  toggleExtra(extraId) {
    if (this.selectedExtras.includes(extraId)) {
      this.selectedExtras = this.selectedExtras.filter(id => id !== extraId);
    } else {
      this.selectedExtras = [...this.selectedExtras, extraId];
    }
  }

  <template>
    <div class="configurator">
      <div class="configurator__header">
        <h2 class="configurator__title">Configura tu Vehículo</h2>
        <p class="configurator__subtitle">Personaliza cada detalle a tu gusto</p>
      </div>

      {{! Vehicle Selection }}
      <div class="configurator__option-group">
        <h4>1. Elige tu modelo</h4>
        <div class="filters-grid" style="margin-top: 1rem;">
          {{#each this.vehicles as |vehicle|}}
            <button
              type="button"
              class="filter-btn {{if (eq this.selectedVehicleId vehicle.id) 'active'}}"
              {{on "click" (fn this.selectVehicle vehicle)}}
            >
              {{vehicle.emoji}} {{vehicle.name}}
            </button>
          {{/each}}
        </div>
      </div>

      {{#if this.selectedVehicle}}
        {{! Vehicle Display }}
        <div class="configurator__display">
          {{this.selectedVehicle.emoji}}
        </div>

        <div class="configurator__options">
          {{! Color Selection }}
          <div class="configurator__option-group">
            <h4>2. Elige el color</h4>
            <div class="color-options" style="margin-top: 1rem;">
              {{#each this.colorOptions as |color|}}
                <button
                  type="button"
                  class="color-option {{color.class}} {{if (eq this.selectedColor color.name) 'selected'}}"
                  title={{color.name}}
                  {{on "click" (fn this.selectColor color.name)}}
                >
                </button>
              {{/each}}
            </div>
            <p style="margin-top: 0.5rem; font-size: 0.9rem; color: var(--color-gray-600);">
              Color seleccionado: <strong>{{this.selectedColor}}</strong>
            </p>
          </div>

          {{! Extras Selection }}
          <div class="configurator__option-group">
            <h4>3. Añade extras</h4>
            <div style="margin-top: 1rem;">
              {{#each this.extras as |extra|}}
                <label style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0.5rem; cursor: pointer;">
                  <input
                    type="checkbox"
                    checked={{this.isExtraSelected extra.id}}
                    {{on "change" (fn this.toggleExtra extra.id)}}
                  />
                  <span>{{extra.name}}</span>
                  <span style="color: var(--color-primary); font-weight: 600;">+{{extra.price}}€</span>
                </label>
              {{/each}}
            </div>
          </div>
        </div>

        {{! Summary }}
        <div class="configurator__summary">
          <div class="configurator__total">
            <h4>Precio Total Estimado</h4>
            <div class="configurator__price">{{this.formatPrice this.totalPrice}}€</div>
          </div>
          <button type="button" class="btn btn-primary btn-lg">
            📞 Solicitar Presupuesto
          </button>
        </div>
      {{else}}
        <div class="alert alert--info" style="text-align: center; margin-top: 2rem;">
          <p>👆 Selecciona un modelo para comenzar la configuración</p>
        </div>
      {{/if}}
    </div>
  </template>
}
