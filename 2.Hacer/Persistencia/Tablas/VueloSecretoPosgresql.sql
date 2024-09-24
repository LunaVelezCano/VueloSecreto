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

-- Crear tabla Pais
CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE,
	"NombrePais" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdPais")
);

COMMENT ON TABLE "Pais" IS 'GEOGRAFIA';

-- Crear tabla Departamento
CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE,
	"IdPais" UUID NOT NULL,
	"NombreDepartamento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdDepartamento"),
	FOREIGN KEY("IdPais") REFERENCES "Pais"("IdPais")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Departamento" IS 'GEOGRAFIA';

-- Crear tabla Ciudad
CREATE TABLE "Ciudad" (
	"IdCiudad" UUID NOT NULL UNIQUE,
	"IdDepartamento" UUID NOT NULL,
	"Nombre" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdCiudad"),
	FOREIGN KEY("IdDepartamento") REFERENCES "Departamento"("IdDepartamento")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Ciudad" IS 'GEOGRAFIA';

-- Crear tabla Agencia
CREATE TABLE "Agencia" (
	"IdAgencia" UUID NOT NULL UNIQUE,
	"NIT" VARCHAR,
	"RazonSocial" VARCHAR,
	"DireccionAgencia" VARCHAR,
	"TelefonoAgencia" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdAgencia")
);

COMMENT ON TABLE "Agencia" IS 'EMPRESA';

-- Crear tabla Sede
CREATE TABLE "Sede" (
	"IdSede" UUID NOT NULL UNIQUE,
	"IdAgencia" UUID NOT NULL,
	"IdCiudad" UUID NOT NULL,
	"NombreSede" VARCHAR,
	"TelefonoSede" VARCHAR,
	"DireccionSede" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdSede"),
	FOREIGN KEY("IdAgencia") REFERENCES "Agencia"("IdAgencia")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdCiudad") REFERENCES "Ciudad"("IdCiudad")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Sede" IS 'EMPRESA';

-- Crear tabla Empleado
CREATE TABLE "Empleado" (
	"IdEmpleado" UUID NOT NULL UNIQUE,
	"IdSede" UUID NOT NULL,
	"NombreEmpleado" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEmpleado"),
	FOREIGN KEY("IdSede") REFERENCES "Sede"("IdSede")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Empleado" IS 'EMPRESA';

-- Crear tabla Usuario
CREATE TABLE "Usuario" (
	"IdUsuario" UUID NOT NULL UNIQUE,
	"IdTipoGenero" UUID NOT NULL,
	"IdTipoDocumento" UUID NOT NULL,
	"IdTipoEstadoCivil" UUID NOT NULL,
	"NombreUsuario" VARCHAR,
	"ApellidoUsuario" VARCHAR,
	"NumeroDocumento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdUsuario"),
	FOREIGN KEY("IdTipoDocumento") REFERENCES "TipoDocumento"("IdTipoDocumento")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdTipoGenero") REFERENCES "TipoGenero"("IdTipoGenero")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdTipoEstadoCivil") REFERENCES "TipoEstadoCivil"("IdTipoEstadoCivil")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Usuario" IS 'CLIENTE';

-- Crear tabla TipoDocumento
CREATE TABLE "TipoDocumento" (
	"IdTipoDocumento" UUID NOT NULL UNIQUE,
	"NombreTipoDocumento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoDocumento")
);

COMMENT ON TABLE "TipoDocumento" IS 'USUARIO';

-- Crear tabla TipoGenero
CREATE TABLE "TipoGenero" (
	"IdTipoGenero" UUID NOT NULL UNIQUE,
	"NombreTipoGenero" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoGenero")
);

COMMENT ON TABLE "TipoGenero" IS 'USUARIO';

-- Crear tabla TipoEstadoCivil
CREATE TABLE "TipoEstadoCivil" (
	"IdTipoEstadoCivil" UUID NOT NULL UNIQUE,
	"NombreEstadoCivil" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoEstadoCivil")
);

COMMENT ON TABLE "TipoEstadoCivil" IS 'USUARIO';

-- Crear tabla Destino
CREATE TABLE "Destino" (
	"IdDestino" UUID NOT NULL UNIQUE,
	"NombreDestino" VARCHAR,
	"FechaSalida" DATE,
	"FechaRegreso" DATE,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdDestino")
);

COMMENT ON TABLE "Destino" IS 'PRODUCTO';

-- Crear tabla TipoViaje
CREATE TABLE "TipoViaje" (
	"IdTipoViaje" UUID NOT NULL UNIQUE,
	"IdDestino" UUID NOT NULL,
	"NombreTipoViaje" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoViaje"),
	FOREIGN KEY("IdDestino") REFERENCES "Destino"("IdDestino")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "TipoViaje" IS 'DESTINO';

-- Crear tabla TipoClase
CREATE TABLE "TipoClase" (
	"IdTipoClase" UUID NOT NULL UNIQUE,
	"IdDestino" UUID NOT NULL,
	"NombreTipoClase" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoClase"),
	FOREIGN KEY("IdDestino") REFERENCES "Destino"("IdDestino")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "TipoClase" IS 'Destino';

-- Crear la tabla Pasabordo
CREATE TABLE "Pasabordo" (
    "IdPasabordo" UUID NOT NULL UNIQUE,
    "IdFactura" UUID NOT NULL,
    "NumeroVuelo" VARCHAR NOT NULL,
    "FechaVuelo" DATE NOT NULL,
    "HoraVuelo" TIME NOT NULL,
    "PuertaEmbarque" VARCHAR,
    "Activo" BIT DEFAULT '1',
    "Actualiza" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("IdPasabordo"),
    FOREIGN KEY("IdFactura") REFERENCES "Factura"("IdFactura")
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

COMMENT ON TABLE "Pasabordo" IS 'Tabla que almacena los datos de los pasabordos relacionados con las facturas.';

-- Crear tabla Factura
CREATE TABLE "Factura" (
	"IdFactura" UUID NOT NULL UNIQUE,
	"IdSede" UUID NOT NULL,
	"IdUsuario" UUID NOT NULL,
	"IdDestino" UUID NOT NULL,
	"IdMoneda" UUID NOT NULL,
	"IMPUESTROS" INTEGER,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdFactura"),
	FOREIGN KEY("IdSede") REFERENCES "Sede"("IdSede")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdUsuario") REFERENCES "Usuario"("IdUsuario")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdDestino") REFERENCES "Destino"("IdDestino")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdMoneda") REFERENCES "Moneda"("IdMoneda")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Factura" IS 'Transaccion';

-- Crear tabla Moneda
CREATE TABLE "Moneda" (
	"IdMoneda" UUID NOT NULL UNIQUE,
	"Divisa" INTEGER,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdMoneda")
);

-- Crear tabla DetalleFactura
CREATE TABLE "DetalleFactura" (
	"IdDetalleFactura" UUID NOT NULL UNIQUE,
	"IdFactura" UUID NOT NULL,
	"CantidadTiquetes" INTEGER,
	"PesoEquipaje" INTEGER,
	"ValorTiquete" INTEGER,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	"IdEstadoFactura" UUID NOT NULL,
	PRIMARY KEY("IdDetalleFactura"),
	FOREIGN KEY("IdFactura") REFERENCES "Factura"("IdFactura")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdEstadoFactura") REFERENCES "EstadoFactura"("IdEstadoFactura")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Crear tabla EstadoFactura
CREATE TABLE "EstadoFactura" (
	"IdEstadoFactura" UUID NOT NULL UNIQUE,
	"EstadoFactura" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEstadoFactura")
);

COMMENT ON TABLE "EstadoFactura" IS 'Estado de la factura';
