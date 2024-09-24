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

-- Tabla: Pais
CREATE OR REPLACE FUNCTION crear_pais(nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Pais" ("Nombre", "Activo") VALUES (nombre, activo);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION leer_pais(id UUID) RETURNS TABLE(idPais UUID, Nombre VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idPais", "Nombre", "Activo", "Actualiza"
    FROM "Pais"
    WHERE "idPais" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizar_pais(id UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Pais"
    SET "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idPais" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminar_pais(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Pais"
    WHERE "idPais" = id;
END;
$$ LANGUAGE plpgsql;


-- Tabla: Departamento
CREATE OR REPLACE FUNCTION crear_departamento(id_pais UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Departamento" ("idPais", "Nombre", "Activo") VALUES (id_pais, nombre, activo);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION leer_departamento(id UUID) RETURNS TABLE(idDepartamento UUID, idPais UUID, Nombre VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idDepartamento", "idPais", "Nombre", "Activo", "Actualiza"
    FROM "Departamento"
    WHERE "idDepartamento" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizar_departamento(id UUID, id_pais UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Departamento"
    SET "idPais" = id_pais, "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDepartamento" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminar_departamento(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Departamento"
    WHERE "idDepartamento" = id;
END;
$$ LANGUAGE plpgsql;


-- Tabla: Ciudad
CREATE OR REPLACE FUNCTION crear_ciudad(id_departamento UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Ciudad" ("idDepartamento", "Nombre", "Activo") VALUES (id_departamento, nombre, activo);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION leer_ciudad(id UUID) RETURNS TABLE(idCiudad UUID, idDepartamento UUID, Nombre VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idCiudad", "idDepartamento", "Nombre", "Activo", "Actualiza"
    FROM "Ciudad"
    WHERE "idCiudad" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizar_ciudad(id UUID, id_departamento UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Ciudad"
    SET "idDepartamento" = id_departamento, "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idCiudad" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION eliminar_ciudad(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Ciudad"
    WHERE "idCiudad" = id;
END;
$$ LANGUAGE plpgsql;

