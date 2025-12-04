# Aplicación Ember - Paquete P2

## 📋 Descripción del Proyecto

Esta es una aplicación de demostración desarrollada con **Ember.js** para el **Paquete P2** del curso de Tecnologías Web. La aplicación consume la API de JSONPlaceholder para mostrar una lista de artículos con funcionalidades de búsqueda, filtrado y visualización.

## 🎯 Características Implementadas (Paquete P2)

### Modelo de Datos
- **Article Model**: Modelo completo con atributos `userId`, `title`, `body`, `description`, `slug`, `createdAt`, `updatedAt`, `favorited`, `favoritesCount`, y `tagList`.
- Propiedades computadas: `excerpt` para extractos y `hasContent` para validación.

### Componentes Glimmer (GJS)
- **ArticleCard**: Componente para mostrar una tarjeta individual de artículo.
- **ArticleList**: Componente contenedor con funcionalidad de búsqueda y filtrado en tiempo real.

### Rutas y Navegación
- **Ruta Articles**: Carga los artículos desde la API usando Ember Data.
- **Router configurado**: Con rutas para `index` y `articles`.

### Controladores
- **ArticlesController**: Maneja el ordenamiento y selección de artículos.

### Adapter y Serializer
- **ApplicationAdapter**: Configurado para conectar con JSONPlaceholder API.
- **ArticleSerializer**: Transforma los datos de la API al formato del modelo.

### Estilos
- **CSS moderno**: Variables CSS, diseño responsive, animaciones y BEM methodology.

### Tests
- Tests unitarios para modelo, adapter, serializer, route y controller.
- Tests de integración para componentes ArticleCard y ArticleList.

## 🛠️ Tecnologías Utilizadas

- **Ember.js 6.x** - Framework JavaScript
- **Ember Data** - Gestión de datos
- **Glimmer Components** - Componentes modernos con GJS
- **Vite** - Bundler y servidor de desarrollo
- **QUnit** - Framework de testing

## 📁 Estructura del Proyecto

```
app/
├── adapters/
│   └── application.js      # Adapter REST para JSONPlaceholder
├── components/
│   ├── article-card.gjs    # Componente tarjeta de artículo
│   └── article-list.gjs    # Componente lista con búsqueda
├── controllers/
│   └── articles.js         # Controller de artículos
├── models/
│   └── article.js          # Modelo de artículo
├── routes/
│   └── articles.js         # Ruta de artículos
├── serializers/
│   └── article.js          # Serializer para API
├── styles/
│   └── app.css             # Estilos de la aplicación
├── templates/
│   ├── application.gjs     # Template principal
│   └── articles.gjs        # Template de artículos
└── transforms/
    ├── boolean.js
    ├── date.js
    ├── number.js
    └── string.js
```

## 🚀 Instalación y Ejecución

### Prerrequisitos

- [Node.js](https://nodejs.org/) (v18+)
- [Yarn](https://yarnpkg.com/) o npm
- [Git](https://git-scm.com/)

### Instalación

```bash
# Clonar el repositorio
git clone <repository-url>
cd aplicacion-prueba

# Instalar dependencias
yarn install
```

### Ejecución en Desarrollo

```bash
# Iniciar servidor de desarrollo
yarn start

# La aplicación estará disponible en:
# http://localhost:4200
```

**Nota para Windows**: Si encuentras errores de symlinks, activa el **Modo Desarrollador** en Windows:
- Configuración → Privacidad y seguridad → Para desarrolladores → Activar Modo de desarrollador

### Ejecutar Tests

```bash
# Ejecutar todos los tests
yarn test

# Ejecutar tests en modo watch
yarn test --server
```

### Linting

```bash
# Verificar código
yarn lint

# Corregir errores automáticamente
yarn lint:fix
```

### Build para Producción

```bash
# Build de producción
yarn build

# Build de desarrollo
yarn vite build --mode development
```

## 📡 API Utilizada

La aplicación consume la API de **JSONPlaceholder**:
- **Base URL**: https://jsonplaceholder.typicode.com
- **Endpoint**: `/posts` (mapeado a `articles`)

### Ejemplo de respuesta de la API:
```json
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur..."
}
```

## 🔧 Configuración

### Cambiar la API
Edita `app/adapters/application.js`:
```javascript
export default class ApplicationAdapter extends RESTAdapter {
  host = 'https://tu-api.com';
}
```

## 📚 Documentación Adicional

- [Ember.js Guides](https://guides.emberjs.com/)
- [Ember Data](https://guides.emberjs.com/release/models/)
- [Glimmer Components](https://guides.emberjs.com/release/components/)
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)

## 👨‍💻 Autor

Desarrollado para el curso de **Tecnologías Web** - Paquete P2

## 📄 Licencia

Este proyecto es de uso educativo.
