# API REST de Vehículos

API REST hecha con **Django REST Framework** y **MySQL** para el recurso **Vehículo**. Sin autenticación.

**Autor:** Kevin Alejandro González Meza — Desarrollo Web, Universidad Mariano Gálvez de Guatemala.

## Modelo `Vehiculo` (tabla `vehiculos`)

| Campo | Tipo | Regla |
|---|---|---|
| `id` | BigAutoField | Llave primaria |
| `marca` | CharField(50) | Obligatorio |
| `modelo` | CharField(50) | Obligatorio |
| `anio` | PositiveSmallIntegerField | Obligatorio, entre 1886 y el próximo año |
| `color` | CharField(30) | Obligatorio |
| `created_at` | DateTimeField | Fecha de creación (automática) |
| `updated_at` | DateTimeField | Fecha de actualización (automática) |

## Endpoints

| Método | Ruta | Acción | Código |
|---|---|---|---|
| GET | `/api/vehiculos` | Listar | 200 |
| GET | `/api/vehiculos/{id}` | Consultar por id | 200 / 404 |
| POST | `/api/vehiculos` | Crear | 201 / 400 |
| PUT | `/api/vehiculos/{id}` | Actualizar | 200 / 400 |
| DELETE | `/api/vehiculos/{id}` | Eliminar | 204 |

Ejemplo de cuerpo para POST/PUT:

```json
{ "marca": "Toyota", "modelo": "Corolla", "anio": 2022, "color": "Blanco" }
```

## Cómo ejecutarlo (Windows)

1. Tener **Python 3.10+** y **MySQL** en ejecución.
2. En MySQL, ejecutar `crear_bd.sql` (crea la base `vehiculos_db` y el usuario `api_user`).
3. Doble clic en `iniciar_api.bat`: crea el entorno virtual, instala dependencias, aplica migraciones y levanta el servidor.
4. La API queda en `http://127.0.0.1:8000/api/vehiculos`.

Variables de entorno disponibles: `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_HOST`, `DB_PORT`, `DJANGO_SECRET_KEY`.

> Las credenciales de `crear_bd.sql` e `iniciar_api.bat` son solo para desarrollo local.

## Consumo desde React

```jsx
import { useEffect, useState } from 'react';
export default function ListaVehiculos() {
  const [vehiculos, setVehiculos] = useState([]);
  useEffect(() => {
    fetch('http://127.0.0.1:8000/api/vehiculos')
      .then((res) => res.json())
      .then((data) => setVehiculos(data))
      .catch((err) => console.error(err));
  }, []);
  return (
    <ul>
      {vehiculos.map((v) => <li key={v.id}>{v.marca} {v.modelo} {v.anio} {v.color}</li>)}
    </ul>
  );
}
```

CORS está habilitado con `django-cors-headers` para permitir peticiones desde React.
