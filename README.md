# Curso de Data Analytics

Repositorio de prácticas y proyecto integrador del curso de Data Analytics.
Recorre el ciclo completo del analista: desde la definición del problema de negocio
hasta el dashboard ejecutivo, pasando por el modelado de datos, SQL y Power BI.

---

## Proyecto integrador: RetailPro

Caso de negocio que se construye a lo largo de todo el curso. **RetailPro** es una
empresa distribuidora de tecnología con datos de ventas, clientes y productos que
nunca fueron analizados de forma sistemática.

**Pregunta de negocio que guía el proyecto:**

> ¿Qué región y categoría de producto explican la caída de ventas de RetailPro
> en el último trimestre?

---

## Estructura del repositorio

```
.
├── modulo3/
│   └── diseno_esquema.sql     # DDL: creación de tablas y tipos de datos
└── README.md
```

*(Se irán agregando carpetas por módulo a medida que avanza la cursada.)*

---

## Contenido por módulo

| Módulo | Tema | Estado |
|--------|------|--------|
| 1 | Datos vs. Información · Ciclo de vida del análisis | Completado |
| 2 | Modelos de datos · OLTP/OLAP · Normalización (3NF) | Completado |
| 3 | Introducción a SQL · DDL y tipos de datos | En curso |
| 4 | Consultas básicas: SELECT y alias | — |
| 5 | Cláusula JOIN | — |
| 6 | Introducción a Power BI | — |
| 7 | Diseño de dashboards y jerarquía visual | — |
| 8 | Relaciones 1:N en el modelo de Power BI | — |
| 9 | IA como co-piloto del analista | — |
| 10 | Variables cualitativas y cuantitativas | — |

---

## Modelo de datos

El esquema de RetailPro está normalizado hasta **3NF**, siguiendo un patrón de
modelo estrella: `ventas` es la tabla de hechos y `clientes`, `productos` y
`territorios` son las dimensiones.

| Tabla | Rol | Clave primaria | Claves foráneas |
|-------|-----|----------------|-----------------|
| `ventas` | Hechos | `id_venta` | `id_cliente`, `id_producto` |
| `clientes` | Dimensión | `id_cliente` | `id_territorio` |
| `productos` | Dimensión | `id_producto` | — |
| `territorios` | Dimensión | `id_territorio` | — |

**Criterios de diseño aplicados:**

- `DECIMAL(10,2)` para valores monetarios — precisión exacta, nunca `FLOAT`.
- `DATE` para datos cronológicos — habilita el análisis temporal en Power BI.
- `VARCHAR(n)` acotado según el uso real del campo, evitando reservar espacio de más.
- `BIT` para valores binarios (verdadero/falso), evitando inconsistencias de texto.

---

## Entorno

- **Motor:** SQL Server 2025 Express
- **Entorno de desarrollo:** SQL Server Management Studio (SSMS)
- **Visualización:** Power BI Desktop *(a partir del módulo 6)*

---

## Cómo ejecutar los scripts

1. Abrir SSMS y conectarse a la instancia local (`localhost\SQLEXPRESS`,
   autenticación de Windows).
2. Crear la base de datos del curso, si no existe:

   ```sql
   CREATE DATABASE curso_analytics;
   ```

3. Seleccionar `curso_analytics` en el desplegable de bases de datos.
4. Abrir el script correspondiente y ejecutarlo (F5).
