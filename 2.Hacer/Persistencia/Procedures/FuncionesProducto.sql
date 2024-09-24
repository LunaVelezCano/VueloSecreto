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

--Tabla Destino
-- Crear
CREATE OR REPLACE FUNCTION crear_destino(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Destino" ("NombreDestino", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_destino(id UUID) RETURNS TABLE(idDestino UUID, NombreDestino VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idDestino", "NombreDestino", "Activo", "Actualiza"
    FROM "Destino"
    WHERE "idDestino" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_destino(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Destino"
    SET "NombreDestino" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDestino" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_destino(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Destino"
    WHERE "idDestino" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Tipo Clase

-- Crear
CREATE OR REPLACE FUNCTION crear_tipo_clase(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "TipoClase" ("NombreTipoClase", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_tipo_clase(id UUID) RETURNS TABLE(idTipoClase UUID, NombreTipoClase VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoClase", "NombreTipoClase", "Activo", "Actualiza"
    FROM "TipoClase"
    WHERE "idTipoClase" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_tipo_clase(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "TipoClase"
    SET "NombreTipoClase" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoClase" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_clase(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "TipoClase"
    WHERE "idTipoClase" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Tipo Viaje
-- Crear
CREATE OR REPLACE FUNCTION crear_tipo_viaje(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "TipoViaje" ("NombreTipoViaje", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_tipo_viaje(id UUID) RETURNS TABLE(idTipoViaje UUID, NombreTipoViaje VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoViaje", "NombreTipoViaje", "Activo", "Actualiza"
    FROM "TipoViaje"
    WHERE "idTipoViaje" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_tipo_viaje(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "TipoViaje"
    SET "NombreTipoViaje" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoViaje" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_viaje(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "TipoViaje"
    WHERE "idTipoViaje" = id;
END;
$$ LANGUAGE plpgsql;




