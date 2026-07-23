-- ══════════════════════════════════════════════════════════
-- RetailPro — Consultas SQL de Negocio
-- Pre-entrega Módulo 4: Extrayendo métricas clave con SQL
-- Base de datos: Ventas_Tech_DB
-- Autor: Axel El Hilon
-- Fecha: 2026-07-23
-- ══════════════════════════════════════════════════════════
USE Ventas_Tech_DB;

-- Consulta 1 — "Resumen ejecutivo mensual" Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. 
-- Calculá el total como cantidad * precio_unitario.
-- Usá alias descriptivos en español y agrupá por mes con EXTRACT(MONTH FROM fecha_venta). 
SELECT	SUM(cantidad * precio_unitario) AS total_facturado,
		COUNT(*) AS cantidad_de_pedidos,
		AVG(cantidad * precio_unitario) AS ticket_promedio,
		MONTH(fecha_venta) AS mes -- (uso MONTH() en vez de EXTRACT porque es SQL Server)

FROM ventas

GROUP BY MONTH(fecha_venta)
;

-- Consulta 2 — "Ranking de productos" Top 5 de id_producto por total facturado, 
-- mostrando las unidades vendidas (SUM(cantidad)) y el total generado. 
-- Usá GROUP BY id_producto, ORDER BY y limitá el resultado a 5.

SELECT TOP 5	id_producto,
				SUM(cantidad) AS unidades_vendidas,
				SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC
;

-- Consulta 3 — "Clientes recurrentes" id_cliente que hayan realizado más de un pedido,
-- mostrando la cantidad de pedidos y el total gastado.
-- Usá GROUP BY id_cliente y HAVING COUNT(*) > 1.

SELECT	id_cliente,
		COUNT(*) AS cantidad_pedidos,
		SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1
ORDER BY total_gastado DESC
;

-- Consulta 4 — "Meses por encima/por debajo del promedio" Total facturado por mes,
-- con una columna adicional que etiquete con CASE WHEN si ese mes quedó 
-- 'Por encima' o 'Por debajo' del promedio mensual general.

SELECT	MONTH(fecha_venta)				AS mes,
		SUM(cantidad * precio_unitario) AS total_facturado,
		CASE 
			WHEN SUM(cantidad * precio_unitario) > 
				(SELECT AVG(total_mes)
				FROM (
					SELECT SUM(cantidad * precio_unitario) AS total_mes
					FROM ventas
				    GROUP BY MONTH(fecha_venta)
				) AS totales_mensuales) 
			THEN 'Por encima'
			ELSE 'Por debajo'
		END								AS comparacion_promedio

FROM ventas
GROUP BY MONTH(fecha_venta)
;


-- 1er Hallazgo: La Laptop Pro 15 y el Monitor 4K 27" son los productos que más
-- facturación generaron, representando el 77% del total de la tienda.
-- 2do Hallazgo: Los clientes 1 y 5 son los más recurrentes, y concentran el 73,5%
-- de la facturación total.
-- 3er Hallazgo: Con un solo mes de datos, la comparación contra el promedio mensual
-- no es significativa; recién con varios meses tendrá valor la etiqueta 'Por encima/Por debajo'.
