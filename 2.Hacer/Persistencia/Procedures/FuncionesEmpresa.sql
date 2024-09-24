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

	-- Tabla Agencia
CREATE OR REPLACE FUNCTION crear_agencia(nit VARCHAR, razon_social VARCHAR, direccion VARCHAR, telefono VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Agencia" ("NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia", "Activo") 
    VALUES (nit, razon_social, direccion, telefono, activo);
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION leer_agencia(id UUID) RETURNS TABLE(idAgencia UUID, NIT VARCHAR, RazonSocial VARCHAR, DireccionAgencia VARCHAR, TelefonoAgencia VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idAgencia", "NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia", "Activo", "Actualiza"
    FROM "Agencia"
    WHERE "idAgencia" = id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION actualizar_agencia(id UUID, nit VARCHAR, razon_social VARCHAR, direccion VARCHAR, telefono VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Agencia"
    SET "NIT" = nit, "RazonSocial" = razon_social, "DireccionAgencia" = direccion, "TelefonoAgencia" = telefono, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idAgencia" = id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION eliminar_agencia(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Agencia"
    WHERE "idAgencia" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla sede
-- Crear
CREATE OR REPLACE FUNCTION crear_sede(id_agencia UUID, id_ciudad UUID, nombre VARCHAR, telefono VARCHAR, direccion VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Sede" ("idAgencia", "idCiudad", "NombreSede", "TelefonoSede", "DireccionSede", "Activo") 
    VALUES (id_agencia, id_ciudad, nombre, telefono, direccion, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_sede(id UUID) RETURNS TABLE(idSede UUID, idAgencia UUID, idCiudad UUID, NombreSede VARCHAR, TelefonoSede VARCHAR, DireccionSede VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idSede", "idAgencia", "idCiudad", "NombreSede", "TelefonoSede", "DireccionSede", "Activo", "Actualiza"
    FROM "Sede"
    WHERE "idSede" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_sede(id UUID, id_agencia UUID, id_ciudad UUID, nombre VARCHAR, telefono VARCHAR, direccion VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Sede"
    SET "idAgencia" = id_agencia, "idCiudad" = id_ciudad, "NombreSede" = nombre, "TelefonoSede" = telefono, "DireccionSede" = direccion, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idSede" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_sede(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Sede"
    WHERE "idSede" = id;
END;
$$ LANGUAGE plpgsql;

--Tabla Empleado
-- Crear
CREATE OR REPLACE FUNCTION crear_empleado(id_sede UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    INSERT INTO "Empleado" ("idSede", "NombreEmpleado", "Activo") 
    VALUES (id_sede, nombre, activo);
END;
$$ LANGUAGE plpgsql;

-- Leer
CREATE OR REPLACE FUNCTION leer_empleado(id UUID) RETURNS TABLE(idEmpleado UUID, idSede UUID, NombreEmpleado VARCHAR, Activo BIT, Actualiza TIMESTAMP) AS $$
BEGIN
    RETURN QUERY
    SELECT "idEmpleado", "idSede", "NombreEmpleado", "Activo", "Actualiza"
    FROM "Empleado"
    WHERE "idEmpleado" = id;
END;
$$ LANGUAGE plpgsql;

-- Actualizar
CREATE OR REPLACE FUNCTION actualizar_empleado(id UUID, id_sede UUID, nombre VARCHAR, activo BIT) RETURNS VOID AS $$
BEGIN
    UPDATE "Empleado"
    SET "idSede" = id_sede, "NombreEmpleado" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idEmpleado" = id;
END;
$$ LANGUAGE plpgsql;

-- Eliminar
CREATE OR REPLACE FUNCTION eliminar_empleado(id UUID) RETURNS VOID AS $$
BEGIN
    DELETE FROM "Empleado"
    WHERE "idEmpleado" = id;
END;
$$ LANGUAGE plpgsql;

