-- Ventas_Tech_DB — Script de creación y carga inicial
-- Proyecto: TechStore (base de datos del proyecto integrador)
-- Módulo 3 — Checkpoint: Script SQL de Ingeniería de Datos
-- Autor: Axel
-- Fecha: 2026-07-18
-- Motor: SQL Server


DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

-- ══════════════════════════════════════════════════════════
-- SECCIÓN DDL — Definición del esquema
-- ══════════════════════════════════════════════════════════

--Diseño de las tablas "Categorias" "Clientes" "Productos" "Ventas"
-- Tabla categorias (dimensión, sin dependencias) 
CREATE TABLE categorias (
    id_categoria     INT PRIMARY KEY,          -- PK: identificador único de la categoría
    nombre_categoria VARCHAR(50) NOT NULL,     -- NOT NULL: toda categoría debe tener nombre
    descripcion      VARCHAR(200)              -- sin coma: es la última columna
);
-- Tabla clientes (dimensión, sin dependencias)
CREATE TABLE clientes (                        -- Categoria clientes
    id_cliente      INT PRIMARY KEY, -- PK: identificador único
    nombre          VARCHAR(100) NOT NULL, -- NOT NULL: el cliente debe tener nombre
    email           VARCHAR(100) UNIQUE, -- UNIQUE: no se repiten emails entre clientes
    ciudad          VARCHAR(50),
    fecha_registro  DATE NOT NULL -- DATE: habilita análisis temporal
); 
-- Tabla productos (dimensión con FK a categorias)
CREATE TABLE productos (                       -- Categoria productos
    id_producto     INT PRIMARY KEY,-- PK: identificador único del producto
    nombre_producto VARCHAR(100) NOT NULL, -- NOT NULL: el producto debe tener nombre
    id_categoria    INT, -- FK hacia categorias (definida abajo)
    precio          DECIMAL(10,2) NOT NULL, -- DECIMAL: precisión exacta para dinero, nunca FLOAT
    stock           INT DEFAULT 0, -- DEFAULT 0: si no se indica, arranca sin stock
    activo          BIT DEFAULT 1, -- BIT en vez de TINYINT(1): TINYINT no admite (n) en SQL Server
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);
-- Tabla ventas (tabla de hechos, con FK a clientes y productos)
CREATE TABLE ventas (                           -- Categoria ventas
    id_venta        INT PRIMARY KEY, -- PK: identificador único de la venta
    id_cliente      INT, -- FK hacia clientes
    id_producto     INT,-- FK hacia productos
    cantidad        INT NOT NULL,-- NOT NULL: toda venta tiene una cantidad
    precio_unitario DECIMAL(10,2) NOT NULL, -- DECIMAL: dinero
    fecha_venta     DATE NOT NULL,-- DATE: habilita análisis por fecha
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),   -- Claves foraenas apuntando a tabla clientes
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto) -- Claves foraenas apuntando a tabla productos
);

USE Ventas_Tech_DB;
SELECT DB_NAME();

SELECT name FROM sys.tables;

SELECT * FROM categorias;
-- ══════════════════════════════════════════════════════════
-- SECCIÓN DML — Carga inicial de datos
-- ══════════════════════════════════════════════════════════
--Insertando datos en cada tabla
-- (orden de carga: primero las tablas sin dependencias)
-- Categorías
INSERT INTO categorias 
VALUES (1, 'Computación', 'Laptops, PCs y monitores'),
    (2, 'Accesorios', 'Periféricos y complementos'),
    (3, 'Audio', 'Auriculares y parlantes'),
    (4, 'Almacenamiento', 'Discos y memorias');

SELECT * FROM clientes;
-- Clientes
INSERT INTO clientes 
VALUES (1, 'María López', 'maria@mail.com', 'Buenos Aires', '2024-01-05'),
    (2, 'Carlos Ruiz', 'carlos@mail.com', 'Córdoba', '2024-01-10'),
    (3, 'Ana Gómez', 'ana@mail.com' , 'Rosario', '2024-02-01'),
    (4, 'Pedro Sanz', 'pedro@mail.com', 'Mendoza', '2024-02-15'),
    (5, 'Laura Torres', 'laura@mail.com', 'Tucumán', '2024-03-01');

SELECT * FROM productos;
-- Productos (id_categoria debe existir en categorias)
INSERT INTO productos
VALUES  (1, 'Laptop Pro 15',       1, 1200.00, 15, 1),
        (2, 'Mouse Inalámbrico',   2,   28.00, 80, 1),
        (3, 'Monitor 4K 27"',      1,  450.00, 12, 1),
        (4, 'Auriculares BT Pro',  3,  120.00, 35, 1),
        (5, 'SSD Externo 1TB',     4,  130.00, 18, 1),
        (6, 'Teclado Mecánico',    2,   95.00, 40, 1);

SELECT * FROM ventas
-- Ventas (id_cliente e id_producto deben existir)
INSERT INTO ventas
VALUES  (1,  1, 1, 2, 1200.00, '2024-03-05'),
        (2,  2, 2, 5,   28.00, '2024-03-06'),
        (3,  3, 3, 1,  450.00, '2024-03-07'),
        (4,  1, 4, 2,  120.00, '2024-03-08'),
        (5,  4, 5, 3,  130.00, '2024-03-10'),
        (6,  2, 6, 4,   95.00, '2024-03-11'),
        (7,  5, 1, 1, 1200.00, '2024-03-12'),
        (8,  3, 2, 8,   28.00, '2024-03-13'),
        (9,  4, 4, 1,  120.00, '2024-03-14'),
        (10, 5, 3, 2,  450.00, '2024-03-15');

-- ══════════════════════════════════════════════════════════
-- SECCIÓN DE VALIDACIÓN
-- ══════════════════════════════════════════════════════════

SELECT * FROM categorias;
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM ventas;
