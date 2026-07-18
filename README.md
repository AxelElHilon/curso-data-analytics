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

\`\`\`
.
├── modulo3/
│   ├── modulo2_unidad1_diseno.sql   # DDL: creación de tablas y tipos de datos
│   └── bodegatech.sql               # DDL + DML: inventario de BodegaTech (CREATE, INSERT, UPDATE)
└── README.md
\`\`\`

*(Se irán agregando carpetas por módulo a medida que avanza la cursada.)*

---

## Contenido por módulo

| Módulo | Tema | Estado |
|--------|------|--------|
| 1 | Datos vs. Información · Ciclo de vida del análisis | Completado |
| 2 | Modelos de datos · OLTP/OLAP · Normalización (3NF) | Completado |
| 3 | Introducción a SQL · DDL · DML · DCL | En curso |
| 4 | Consultas básicas: SELECT y alias | — |
| 5 | Cláusula JOIN | — |
| 6 | Introducción a Power BI | — |
| 7 | Diseño de dashboards y jerarquía visual | — |
| 8 | Relaciones 1:N en el modelo de Power BI | — |
| 9 | IA como co-piloto del analista | — |
| 10 | Variables cualitativas y cuantitativas | — |

---

## Contenido del Módulo 3

| Archivo | Descripción |
|---------|-------------|
| \`modulo3/modulo2_unidad1_diseno.sql\` | Diseño de esquema: tablas \`clientes\` y \`productos\` con tipos de datos y comentarios. |
| \`modulo3/bodegatech.sql\` | Ciclo completo DDL + DML sobre la tabla \`inventario\`: creación, carga de 10 productos, actualización de stock por ventas y baja de producto descontinuado. |

---

## Entorno

- **Motor:** SQL Server 2025 Express
- **Entorno de desarrollo:** SQL Server Management Studio (SSMS)
- **Visualización:** Power BI Desktop *(a partir del módulo 6)*

---

## Cómo ejecutar los scripts

1. Abrir SSMS y conectarse a la instancia local (\`localhost\SQLEXPRESS\`,
   autenticación de Windows).
2. Crear la base de datos del curso, si no existe:

   \`\`\`sql
   CREATE DATABASE curso_analytics;
   \`\`\`

3. Seleccionar \`curso_analytics\` en el desplegable de bases de datos
   (o incluir \`USE curso_analytics;\` al inicio del script).
4. Abrir el script correspondiente y ejecutarlo (F5).
