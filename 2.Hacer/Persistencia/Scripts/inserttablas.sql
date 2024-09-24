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

-- Insertar 5 registros en la tabla Pais sin especificar IdPais y Activo
INSERT INTO "Pais" ("NombrePais")
VALUES
    ('Colombia'),
    ('Perú'),
    ('México'),
    ('Argentina'),
    ('Chile');
	
select * from "Pais"

-- Insertar 5 registros en la tabla Departamento sin especificar IdDepartamento, y Activo
-- Asegúrate de reemplazar 'id_pais_x' con IDs válidos de la tabla Pais
INSERT INTO "Departamento" ("IdPais", "NombreDepartamento")
VALUES
    ('53819c86-a353-42ad-866f-576b2cb289f3', 'Cundinamarca'),
    ('3d309feb-2f9d-4055-b804-7587f93b4f13', 'Lima'),
    ('3573a8d5-a964-45b8-8293-59b30d37899e', 'Jalisco'),
    ('ef9de01a-164e-43c4-82fa-891db5f2597c', 'Buenos Aires'),
    ('c4f91e9c-f09c-4573-b72d-8f706260275f', 'Santiago');
	
select * from "Departamento"

-- Insertar 5 registros en la tabla Ciudad sin especificar IdCiudad y Activo
-- Asegúrate de reemplazar 'id_departamento_x' con IDs válidos de la tabla Departamento
INSERT INTO "Ciudad" ("IdDepartamento", "Nombre")
VALUES
    ('a91a44e2-fcdb-4187-84f9-1d2a047ebec6', 'Bogotá'),
    ('91519e24-b5cd-42be-b233-dc0565947412', 'Arequipa'),
    ('227c969a-885e-494c-86f3-288a39ae91e2', 'Guadalajara'),
    ('a5870f7c-8349-4d76-a6b5-b2f6a8417d88', 'La Plata'),
    ('b3d891a3-fc31-42e1-a8c3-942d501013f5', 'Valparaíso');

select * from "Ciudad"

-- Insertar 5 registros en la tabla Agencia sin especificar IdAgencia y Activo
INSERT INTO "Agencia" ("NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia")
VALUES
    ('123456789', 'VueloSecreto sede 1', 'Calle 1 #1', '123456789'),
    ('234567890', 'VueloSecreto sede 2', 'Calle 2 #2', '234567890'),
    ('345678901', 'VueloSecreto sede 3', 'Calle 3 #3', '345678901'),
    ('456789012', 'VueloSecreto sede 4', 'Calle 4 #4', '456789012'),
    ('567890123', 'VueloSecreto sede 5', 'Calle 5 #5', '567890123');
