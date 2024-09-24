-- Database: VueloSecreto

-- DROP DATABASE IF EXISTS "VueloSecreto";

CREATE DATABASE "VueloSecreto"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

--Tabla Factura
-- Crear
CREATE OR REPLACE FUNCTION crear_factura(id_cliente UUID, fecha TIMESTAMP, total DECIMAL, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Factura" ("idCliente", "FechaFactura", "TotalFactura", "Activo") 
    VALUES (id_cliente, fecha, total, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_factura(id UUID) RETURNS TABLE(idFactura UUID, idCliente UUID, FechaFactura TIMESTAMP, TotalFactura DECIMAL, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idFactura", "idCliente", "FechaFactura", "TotalFactura", "Activo", "Actualiza"
    FROM "Factura"
    WHERE "idFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_factura(id UUID, id_cliente UUID, fecha TIMESTAMP, total DECIMAL, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Factura"
    SET "idCliente" = id_cliente, "FechaFactura" = fecha, "TotalFactura" = total, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_factura(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Factura"
    WHERE "idFactura" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Detalle Factura
-- Crear
CREATE OR REPLACE FUNCTION crear_detalle_factura(id_factura UUID, descripcion TEXT, cantidad INT, precio_unitario DECIMAL, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "DetalleFactura" ("idFactura", "Descripcion", "Cantidad", "PrecioUnitario", "Activo") 
    VALUES (id_factura, descripcion, cantidad, precio_unitario, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_detalle_factura(id UUID) RETURNS TABLE(idDetalleFactura UUID, idFactura UUID, Descripcion TEXT, Cantidad INT, PrecioUnitario DECIMAL, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idDetalleFactura", "idFactura", "Descripcion", "Cantidad", "PrecioUnitario", "Activo", "Actualiza"
    FROM "DetalleFactura"
    WHERE "idDetalleFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_detalle_factura(id UUID, id_factura UUID, descripcion TEXT, cantidad INT, precio_unitario DECIMAL, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "DetalleFactura"
    SET "idFactura" = id_factura, "Descripcion" = descripcion, "Cantidad" = cantidad, "PrecioUnitario" = precio_unitario, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDetalleFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_detalle_factura(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "DetalleFactura"
    WHERE "idDetalleFactura" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Estado Factura
-- Crear
CREATE OR REPLACE FUNCTION crear_estado_factura(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "EstadoFactura" ("NombreEstadoFactura", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_estado_factura(id UUID) RETURNS TABLE(idEstadoFactura UUID, NombreEstadoFactura VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idEstadoFactura", "NombreEstadoFactura", "Activo", "Actualiza"
    FROM "EstadoFactura"
    WHERE "idEstadoFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_estado_factura(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "EstadoFactura"
    SET "NombreEstadoFactura" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idEstadoFactura" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_estado_factura(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "EstadoFactura"
    WHERE "idEstadoFactura" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Moneda
-- Crear
CREATE OR REPLACE FUNCTION crear_moneda(nombre VARCHAR, simbolo VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Moneda" ("NombreMoneda", "SimboloMoneda", "Activo") 
    VALUES (nombre, simbolo, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_moneda(id UUID) RETURNS TABLE(idMoneda UUID, NombreMoneda VARCHAR, SimboloMoneda VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idMoneda", "NombreMoneda", "SimboloMoneda", "Activo", "Actualiza"
    FROM "Moneda"
    WHERE "idMoneda" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_moneda(id UUID, nombre VARCHAR, simbolo VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Moneda"
    SET "NombreMoneda" = nombre, "SimboloMoneda" = simbolo, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idMoneda" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_moneda(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Moneda"
    WHERE "idMoneda" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Pasabordo
-- Crear
CREATE OR REPLACE FUNCTION crear_pasabordo(id_factura UUID, numero_vuelo VARCHAR, fecha_vuelo DATE, hora_vuelo TIME, puerta_embarque VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Pasabordo" ("IdFactura", "NumeroVuelo", "FechaVuelo", "HoraVuelo", "PuertaEmbarque", "Activo") 
    VALUES (id_factura, numero_vuelo, fecha_vuelo, hora_vuelo, puerta_embarque, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_pasabordo(id UUID) RETURNS TABLE(idPasabordo UUID, IdFactura UUID, NumeroVuelo VARCHAR, FechaVuelo DATE, HoraVuelo TIME, PuertaEmbarque VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "IdPasabordo", "IdFactura", "NumeroVuelo", "FechaVuelo", "HoraVuelo", "PuertaEmbarque", "Activo", "Actualiza"
    FROM "Pasabordo"
    WHERE "IdPasabordo" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_pasabordo(id UUID, id_factura UUID, numero_vuelo VARCHAR, fecha_vuelo DATE, hora_vuelo TIME, puerta_embarque VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Pasabordo"
    SET "IdFactura" = id_factura, "NumeroVuelo" = numero_vuelo, "FechaVuelo" = fecha_vuelo, "HoraVuelo" = hora_vuelo, "PuertaEmbarque" = puerta_embarque, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPasabordo" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_pasabordo(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Pasabordo"
    WHERE "IdPasabordo" = id;
END;
$$ LANGUAGE plpgsql;
