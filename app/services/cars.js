import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

/**
 * Servicio de catálogo de vehículos de Lujan Motors
 * Proporciona datos mockeados de vehículos para el catálogo y configurador
 */
export default class CarsService extends Service {
  @tracked vehicles = [
    {
      id: 1,
      name: 'LM Sport GT',
      type: 'Deportivo',
      description: 'Potencia y elegancia en un diseño aerodinámico. El deportivo definitivo para los amantes de la velocidad.',
      price: 75000,
      specs: {
        motor: 'V8 4.0L Turbo',
        potencia: '520 CV',
        velocidadMax: '320 km/h',
        aceleracion: '3.2s 0-100',
        consumo: '12.5 L/100km',
        transmision: '8 velocidades automática'
      },
      colors: ['Rojo', 'Negro', 'Blanco', 'Plata'],
      emoji: '🏎️',
      featured: true,
      year: 2024
    },
    {
      id: 2,
      name: 'LM Explorer',
      type: 'SUV',
      description: 'Conquista cualquier terreno con estilo. Perfecta combinación de confort, seguridad y capacidad todoterreno.',
      price: 55000,
      specs: {
        motor: 'V6 3.5L',
        potencia: '350 CV',
        velocidadMax: '220 km/h',
        aceleracion: '6.1s 0-100',
        consumo: '9.8 L/100km',
        transmision: '6 velocidades automática'
      },
      colors: ['Negro', 'Blanco', 'Gris', 'Azul'],
      emoji: '🚙',
      featured: true,
      year: 2024
    },
    {
      id: 3,
      name: 'LM Executive',
      type: 'Sedán',
      description: 'Elegancia ejecutiva para quienes exigen lo mejor. Confort premium y tecnología de vanguardia.',
      price: 48000,
      specs: {
        motor: '4 cilindros 2.0L Turbo',
        potencia: '280 CV',
        velocidadMax: '250 km/h',
        aceleracion: '5.8s 0-100',
        consumo: '7.2 L/100km',
        transmision: '8 velocidades automática'
      },
      colors: ['Negro', 'Blanco', 'Plata', 'Azul Marino'],
      emoji: '🚗',
      featured: false,
      year: 2024
    },
    {
      id: 4,
      name: 'LM Roadster',
      type: 'Deportivo',
      description: 'Descapotable de alto rendimiento. Siente el viento mientras disfrutas de una experiencia de conducción única.',
      price: 82000,
      specs: {
        motor: 'V6 3.0L BiTurbo',
        potencia: '450 CV',
        velocidadMax: '290 km/h',
        aceleracion: '3.9s 0-100',
        consumo: '11.2 L/100km',
        transmision: '7 velocidades DCT'
      },
      colors: ['Rojo', 'Amarillo', 'Azul', 'Negro'],
      emoji: '🛻',
      featured: true,
      year: 2024
    },
    {
      id: 5,
      name: 'LM Family',
      type: 'SUV',
      description: 'El compañero perfecto para la familia. Amplio, seguro y equipado con las últimas tecnologías.',
      price: 42000,
      specs: {
        motor: '4 cilindros 2.5L Hybrid',
        potencia: '220 CV',
        velocidadMax: '200 km/h',
        aceleracion: '8.2s 0-100',
        consumo: '5.8 L/100km',
        transmision: 'CVT'
      },
      colors: ['Blanco', 'Gris', 'Azul', 'Verde'],
      emoji: '🚐',
      featured: false,
      year: 2024
    },
    {
      id: 6,
      name: 'LM Elegance',
      type: 'Sedán',
      description: 'Lujo accesible con prestaciones excepcionales. El sedán que redefine el segmento premium.',
      price: 38000,
      specs: {
        motor: '4 cilindros 1.8L Turbo',
        potencia: '200 CV',
        velocidadMax: '230 km/h',
        aceleracion: '7.5s 0-100',
        consumo: '6.5 L/100km',
        transmision: '6 velocidades automática'
      },
      colors: ['Negro', 'Blanco', 'Gris Oscuro', 'Champán'],
      emoji: '🚘',
      featured: false,
      year: 2024
    }
  ];

  @tracked vehicleTypes = ['Todos', 'Deportivo', 'SUV', 'Sedán'];

  @tracked colorOptions = [
    { name: 'Rojo', class: 'color-option--red', price: 0 },
    { name: 'Azul', class: 'color-option--blue', price: 500 },
    { name: 'Negro', class: 'color-option--black', price: 0 },
    { name: 'Blanco', class: 'color-option--white', price: 0 },
    { name: 'Plata', class: 'color-option--silver', price: 750 },
    { name: 'Dorado', class: 'color-option--gold', price: 1200 }
  ];

  @tracked extras = [
    { id: 1, name: 'Techo Panorámico', price: 2500 },
    { id: 2, name: 'Asientos de Cuero', price: 3000 },
    { id: 3, name: 'Sistema de Sonido Premium', price: 1800 },
    { id: 4, name: 'Navegación Avanzada', price: 1200 },
    { id: 5, name: 'Cámara 360°', price: 900 },
    { id: 6, name: 'Llantas de Aleación', price: 1500 }
  ];

  getAll() {
    return this.vehicles;
  }

  getById(id) {
    return this.vehicles.find(v => v.id === id);
  }

  getByType(type) {
    if (type === 'Todos') {
      return this.vehicles;
    }
    return this.vehicles.filter(v => v.type === type);
  }

  getFeatured() {
    return this.vehicles.filter(v => v.featured);
  }

  getTypes() {
    return this.vehicleTypes;
  }

  getColorOptions() {
    return this.colorOptions;
  }

  getExtras() {
    return this.extras;
  }

  // ========== CRUD Methods ==========
  
  /**
   * CREATE - Añadir nuevo vehículo
   */
  addVehicle(vehicleData) {
    const newId = Math.max(...this.vehicles.map(v => v.id)) + 1;
    const newVehicle = {
      id: newId,
      ...vehicleData,
      year: vehicleData.year || 2024,
      featured: vehicleData.featured || false,
      emoji: this.getEmojiForType(vehicleData.type)
    };
    this.vehicles = [...this.vehicles, newVehicle];
    return newVehicle;
  }

  /**
   * UPDATE - Actualizar vehículo existente
   */
  updateVehicle(id, vehicleData) {
    const index = this.vehicles.findIndex(v => v.id === id);
    if (index !== -1) {
      const updatedVehicle = {
        ...this.vehicles[index],
        ...vehicleData,
        emoji: this.getEmojiForType(vehicleData.type || this.vehicles[index].type)
      };
      this.vehicles = [
        ...this.vehicles.slice(0, index),
        updatedVehicle,
        ...this.vehicles.slice(index + 1)
      ];
      return updatedVehicle;
    }
    return null;
  }

  /**
   * DELETE - Eliminar vehículo
   */
  deleteVehicle(id) {
    const index = this.vehicles.findIndex(v => v.id === id);
    if (index !== -1) {
      this.vehicles = [
        ...this.vehicles.slice(0, index),
        ...this.vehicles.slice(index + 1)
      ];
      return true;
    }
    return false;
  }

  /**
   * Helper - Obtener emoji según tipo
   */
  getEmojiForType(type) {
    const emojis = {
      'Deportivo': '🏎️',
      'SUV': '🚙',
      'Sedán': '🚗'
    };
    return emojis[type] || '🚘';
  }
}
