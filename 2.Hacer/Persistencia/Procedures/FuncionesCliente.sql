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

--Tabla Usuario
-- Crear
CREATE OR REPLACE FUNCTION crear_usuario(id_tipo_genero UUID, id_tipo_documento UUID, id_estado_civil UUID, nombre VARCHAR, apellido VARCHAR, numero_documento VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Usuario" ("idTipoGenero", "idTipoDocumento", "idTipoEstadoCivil", "NombreUsuario", "ApellidoUsuario", "NumeroDocumento", "Activo") 
    VALUES (id_tipo_genero, id_tipo_documento, id_estado_civil, nombre, apellido, numero_documento, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_usuario(id UUID) RETURNS TABLE(idUsuario UUID, idTipoGenero UUID, idTipoDocumento UUID, idTipoEstadoCivil UUID, NombreUsuario VARCHAR, ApellidoUsuario VARCHAR, NumeroDocumento VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idUsuario", "idTipoGenero", "idTipoDocumento", "idTipoEstadoCivil", "NombreUsuario", "ApellidoUsuario", "NumeroDocumento", "Activo", "Actualiza"
    FROM "Usuario"
    WHERE "idUsuario" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_usuario(id UUID, id_tipo_genero UUID, id_tipo_documento UUID, id_estado_civil UUID, nombre VARCHAR, apellido VARCHAR, numero_documento VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Usuario"
    SET "idTipoGenero" = id_tipo_genero, "idTipoDocumento" = id_tipo_documento, "idTipoEstadoCivil" = id_estado_civil, "NombreUsuario" = nombre, "ApellidoUsuario" = apellido, "NumeroDocumento" = numero_documento, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idUsuario" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_usuario(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Usuario"
    WHERE "idUsuario" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Tipo Genero
-- Crear
CREATE OR REPLACE FUNCTION crear_tipo_genero(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "TipoGenero" ("NombreTipoGenero", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_tipo_genero(id UUID) RETURNS TABLE(idTipoGenero UUID, NombreTipoGenero VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoGenero", "NombreTipoGenero", "Activo", "Actualiza"
    FROM "TipoGenero"
    WHERE "idTipoGenero" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_tipo_genero(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "TipoGenero"
    SET "NombreTipoGenero" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoGenero" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_genero(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "TipoGenero"
    WHERE "idTipoGenero" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Tipo documento
-- Crear
CREATE OR REPLACE FUNCTION crear_tipo_documento(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "TipoDocumento" ("NombreTipoDocumento", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_tipo_documento(id UUID) RETURNS TABLE(idTipoDocumento UUID, NombreTipoDocumento VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoDocumento", "NombreTipoDocumento", "Activo", "Actualiza"
    FROM "TipoDocumento"
    WHERE "idTipoDocumento" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_tipo_documento(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "TipoDocumento"
    SET "NombreTipoDocumento" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoDocumento" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_documento(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "TipoDocumento"
    WHERE "idTipoDocumento" = id;
END;
$$ LANGUAGE plpgsql;

--Tipo Estado civil
-- Crear
CREATE OR REPLACE FUNCTION crear_tipo_estado_civil(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "TipoEstadoCivil" ("NombreTipoEstadoCivil", "Activo") 
    VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_tipo_estado_civil(id UUID) RETURNS TABLE(idTipoEstadoCivil UUID, NombreTipoEstadoCivil VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoEstadoCivil", "NombreTipoEstadoCivil", "Activo", "Actualiza"
    FROM "TipoEstadoCivil"
    WHERE "idTipoEstadoCivil" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_tipo_estado_civil(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "TipoEstadoCivil"
    SET "NombreTipoEstadoCivil" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoEstadoCivil" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_tipo_estado_civil(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "TipoEstadoCivil"
    WHERE "idTipoEstadoCivil" = id;
END;
$$ LANGUAGE plpgsql;



