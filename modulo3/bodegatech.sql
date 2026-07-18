
-- BodegaTech — Script de Inventario
-- Autor: Axel El Hilon
-- Fecha: 2026-07-18


-- ── SECCIÓN DDL ──────────────────────────

-- Elimina la tabla si ya existe, para poder re-ejecutar el script sin errores
DROP TABLE IF EXISTS inventario;

-- Creación de la estructura de la tabla
CREATE TABLE inventario (
    id_producto     INT PRIMARY KEY,   -- ID único de cada producto, número entero, sin duplicados
    nombre_producto VARCHAR(100),      -- VARCHAR(100): texto acotado, suficiente para el nombre
    categoria       VARCHAR(50),       -- VARCHAR(50): texto corto para la categoría
    precio_unitario DECIMAL(10,2),     -- DECIMAL(10,2): precisión exacta, estándar para dinero
    stock_actual    INT,               -- INT: unidades disponibles, número entero
    stock_minimo    INT,               -- INT: umbral mínimo de reposición
    fecha_ingreso   DATE,              -- DATE: fecha de ingreso, habilita análisis temporal
    activo          BIT                -- BIT en lugar del TINYINT(1) sugerido: TINYINT no admite (n) en SQL Server; BIT solo acepta 1/0
);

-- ── SECCIÓN DML ──────────────────────────

-- Carga inicial de los 10 productos del inventario
INSERT INTO inventario (id_producto, nombre_producto, categoria, precio_unitario, stock_actual, stock_minimo, fecha_ingreso, activo)
VALUES (1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1),
       (2, 'Mouse Inalámbrico', 'Accesorios', 28.00, 80, 10, '2024-01-10', 1),
       (3, 'Monitor 4K 27"', 'Computación', 450.00, 12, 2, '2024-01-15', 1),
       (4, 'Teclado Mecánico', 'Accesorios', 95.00, 40, 5, '2024-01-15', 1),
       (5, 'Laptop Basic 14', 'Computación', 650.00, 20, 3, '2024-02-01', 1),
       (6, 'Auriculares BT Pro', 'Audio', 120.00, 35, 5, '2024-02-01', 1),
       (7, 'Hub USB-C 7 puertos', 'Accesorios', 45.00, 60, 10, '2024-02-10', 1),
       (8, 'Webcam HD 1080p', 'Accesorios', 85.00, 25, 5, '2024-02-10', 1),
       (9, 'SSD Externo 1TB', 'Almacenamiento', 130.00, 18, 3, '2024-03-01', 1),
       (10, 'Parlante Bluetooth', 'Audio', 60.00, 45, 8, '2024-03-01', 1);

-- UPDATE ventas del día (se resta al stock las unidades vendidas)
-- Venta: 3 unidades de Laptop Pro 15  (15 -> 12)
UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

-- Venta: 12 unidades de Mouse Inalámbrico  (80 -> 68)
UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

-- Venta: 5 unidades de Auriculares BT Pro  (35 -> 30)
UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- UPDATE producto descontinuado
-- La Webcam HD 1080p (id 8) fue descontinuada por el proveedor
UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- ── VALIDACIÓN ───────────────────────────

-- Ver la tabla completa para confirmar la carga y los cambios
SELECT * FROM inventario;
