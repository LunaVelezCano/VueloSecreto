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

-- autogeneracion de los id
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Para la tabla Pais
ALTER TABLE "Pais"
ALTER COLUMN "IdPais" SET DEFAULT uuid_generate_v4();

-- Para la tabla Departamento
ALTER TABLE "Departamento"
ALTER COLUMN "IdDepartamento" SET DEFAULT uuid_generate_v4();

-- Para la tabla Ciudad
ALTER TABLE "Ciudad"
ALTER COLUMN "IdCiudad" SET DEFAULT uuid_generate_v4();

-- Para la tabla Agencia
ALTER TABLE "Agencia"
ALTER COLUMN "IdAgencia" SET DEFAULT uuid_generate_v4();

-- Para la tabla Sede
ALTER TABLE "Sede"
ALTER COLUMN "IdSede" SET DEFAULT uuid_generate_v4();

-- Para la tabla Empleado
ALTER TABLE "Empleado"
ALTER COLUMN "IdEmpleado" SET DEFAULT uuid_generate_v4();

-- Para la tabla Usuario
ALTER TABLE "Usuario"
ALTER COLUMN "IdUsuario" SET DEFAULT uuid_generate_v4();

-- Para la tabla TipoDocumento
ALTER TABLE "TipoDocumento"
ALTER COLUMN "IdTipoDocumento" SET DEFAULT uuid_generate_v4();

-- Para la tabla TipoGenero
ALTER TABLE "TipoGenero"
ALTER COLUMN "IdTipoGenero" SET DEFAULT uuid_generate_v4();

-- Para la tabla TipoEstadoCivil
ALTER TABLE "TipoEstadoCivil"
ALTER COLUMN "IdTipoEstadoCivil" SET DEFAULT uuid_generate_v4();

-- Para la tabla Destino
ALTER TABLE "Destino"
ALTER COLUMN "IdDestino" SET DEFAULT uuid_generate_v4();

-- Para la tabla TipoViaje
ALTER TABLE "TipoViaje"
ALTER COLUMN "IdTipoViaje" SET DEFAULT uuid_generate_v4();

-- Para la tabla TipoClase
ALTER TABLE "TipoClase"
ALTER COLUMN "IdTipoClase" SET DEFAULT uuid_generate_v4();

-- Para la tabla Factura
ALTER TABLE "Factura"
ALTER COLUMN "IdFactura" SET DEFAULT uuid_generate_v4();

-- Para la tabla Moneda
ALTER TABLE "Moneda"
ALTER COLUMN "IdMoneda" SET DEFAULT uuid_generate_v4();

-- Para la tabla DetalleFactura
ALTER TABLE "DetalleFactura"
ALTER COLUMN "IdDetalleFactura" SET DEFAULT uuid_generate_v4();

-- Para la tabla EstadoFactura
ALTER TABLE "EstadoFactura"
ALTER COLUMN "IdEstadoFactura" SET DEFAULT uuid_generate_v4();

-- Para la tabla Pasabordo
ALTER TABLE "Pasabordo"
ALTER COLUMN "IdPasabordo" SET DEFAULT uuid_generate_v4();




