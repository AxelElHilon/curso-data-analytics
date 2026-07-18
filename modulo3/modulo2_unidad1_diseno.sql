
--TABLA DE CLIENTES

CREATE TABLE clientes (
id_cliente INT,-- INT: identificador numérico entero
nombre VARCHAR(100),-- VARCHAR(100): texto acotado, no necesita más
perfil_bio TEXT, -- TEXT: bloque de texto largo sin límite definido
fecha_registro DATE	-- DATE: solo fecha, permite análisis temporal después
); 
--TABLA DE PRODUCTOS

CREATE TABLE productos (
id_producto INT, -- INT: identificador numérico entero
descripcion VARCHAR(255),-- VARCHAR(255): texto acotado, suficiente para una descripción
precio		DECIMAL(10,2), --DECIMAL(10,2): precio con decimales, permite presición financiera.
esta_activo BIT  -- BIT: solo admite 1/0, evita inconsistencias tipo "Si"/"SI"/"S"
);
