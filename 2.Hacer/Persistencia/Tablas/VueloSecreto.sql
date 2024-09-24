CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE,
	"NombrePais" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdPais")
);

COMMENT ON TABLE "Pais" IS 'GEOGRAFIA';


CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE,
	"IdPais" UUID,
	"NombreDepartamento" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdDepartamento")
);

COMMENT ON TABLE "Departamento" IS 'GEOGRAFIA';


CREATE TABLE "Ciudad" (
	"IdCiudad" UUID NOT NULL UNIQUE,
	"IdDepartamento" UUID,
	"Nombre" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdCiudad")
);

COMMENT ON TABLE "Ciudad" IS 'GEOGRAFIA';


CREATE TABLE "Agencia" (
	"IdAgencia" UUID NOT NULL UNIQUE,
	"NIT" VARCHAR,
	"RazonSocial" VARCHAR,
	"DireccionAgencia" VARCHAR,
	"TelefonoAgencia" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdAgencia")
);

COMMENT ON TABLE "Agencia" IS 'EMPRESA';


CREATE TABLE "Sede" (
	"IdSede" UUID NOT NULL UNIQUE,
	"IdAgencia" UUID,
	"IdCiudad" UUID,
	"NombreSede" VARCHAR,
	"TelefonoSede" VARCHAR,
	"DireccionSede" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdSede")
);

COMMENT ON TABLE "Sede" IS 'EMPRESA
';


CREATE TABLE "Empleado" (
	"IdEmpleado" UUID NOT NULL UNIQUE,
	"IdSede" UUID,
	"NombreEmpleado" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEmpleado")
);

COMMENT ON TABLE "Empleado" IS 'EMPRESA';


CREATE TABLE "Usuario" (
	"IdUsuario" UUID NOT NULL UNIQUE,
	"IdTipoGenero" UUID,
	"IdTipoDocumento" UUID,
	"IdTipoEstadoCivil" UUID,
	"NombreUsuario" VARCHAR,
	"ApellidoUsuario" VARCHAR,
	"NumeroDocumento" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdUsuario")
);

COMMENT ON TABLE "Usuario" IS 'CLIENTE';


CREATE TABLE "TipoDocumento" (
	"IdTipoDocumento" UUID NOT NULL UNIQUE,
	"NombreTipoDocumento" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoDocumento")
);

COMMENT ON TABLE "TipoDocumento" IS 'USUARIO';


CREATE TABLE "TipoGenero" (
	"IdTipoGenero" UUID NOT NULL UNIQUE,
	"NombreTipoGenero" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoGenero")
);

COMMENT ON TABLE "TipoGenero" IS 'USUARIO';


CREATE TABLE "TipoEstadoCivil" (
	"IdTipoEstadoCivil" UUID NOT NULL UNIQUE,
	"NombreEstadoCivil" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoEstadoCivil")
);

COMMENT ON TABLE "TipoEstadoCivil" IS 'USUARIO';


CREATE TABLE "Destino" (
	"IdDestino" UUID NOT NULL UNIQUE,
	"NombreDestino" VARCHAR,
	"FechaSalida" DATE,
	"FechaRegreso" DATE,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdDestino")
);

COMMENT ON TABLE "Destino" IS 'PRODUCTO';


CREATE TABLE "TipoViaje" (
	"IdTipoViaje" UUID NOT NULL UNIQUE,
	"IdDestino" UUID,
	"NombreTipoViaje" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoViaje")
);

COMMENT ON TABLE "TipoViaje" IS 'DESTINO';


CREATE TABLE "TipoClase" (
	"IdTipoClase" UUID NOT NULL UNIQUE,
	"IdDestino" UUID,
	"NombreTipoClase" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoClase")
);

COMMENT ON TABLE "TipoClase" IS 'Destino';


CREATE TABLE "Factura" (
	"IdFactura" UUID NOT NULL UNIQUE,
	"IdSede" UUID,
	"IdUsuario" UUID,
	"IdDestino" UUID,
	"IdMoneda" UUID,
	"IMPUESTROS" INTEGER,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdFactura")
);

COMMENT ON TABLE "Factura" IS 'Transaccion';


CREATE TABLE "Moneda" (
	"IdMoneda" UUID NOT NULL UNIQUE,
	"Divisa" INTEGER,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdMoneda")
);


CREATE TABLE "DetalleFactura" (
	"IdDetalleFactura" UUID NOT NULL UNIQUE,
	"IdFactura" UUID,
	"CantidadTiquetes" INTEGER,
	"PesoEquipaje" INTEGER,
	"ValorTiquete" INTEGER,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	"IdEstadoFactura" UUID,
	PRIMARY KEY("IdDetalleFactura")
);


CREATE TABLE "EstadoFactura" (
	"IdEstadoFactura" UUID NOT NULL UNIQUE,
	"EstadoFactura" VARCHAR,
	"Activo" BIT DEFAULT 1,
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEstadoFactura")
);


ALTER TABLE "Pais"
ADD FOREIGN KEY("IdPais") REFERENCES "Departamento"("IdPais")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Departamento"
ADD FOREIGN KEY("IdDepartamento") REFERENCES "Ciudad"("IdDepartamento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Agencia"
ADD FOREIGN KEY("IdAgencia") REFERENCES "Sede"("IdAgencia")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Ciudad"
ADD FOREIGN KEY("IdCiudad") REFERENCES "Sede"("IdCiudad")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("IdSede") REFERENCES "Empleado"("IdSede")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Usuario"
ADD FOREIGN KEY("IdTipoDocumento") REFERENCES "TipoDocumento"("IdTipoDocumento")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Usuario"
ADD FOREIGN KEY("IdTipoGenero") REFERENCES "TipoGenero"("IdTipoGenero")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Usuario"
ADD FOREIGN KEY("IdTipoEstadoCivil") REFERENCES "TipoEstadoCivil"("IdTipoEstadoCivil")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Destino"
ADD FOREIGN KEY("IdDestino") REFERENCES "TipoViaje"("IdDestino")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Destino"
ADD FOREIGN KEY("IdDestino") REFERENCES "TipoClase"("IdDestino")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Sede"
ADD FOREIGN KEY("IdSede") REFERENCES "Factura"("IdSede")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Usuario"
ADD FOREIGN KEY("IdUsuario") REFERENCES "Factura"("IdUsuario")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Destino"
ADD FOREIGN KEY("IdDestino") REFERENCES "Factura"("IdDestino")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Moneda"
ADD FOREIGN KEY("IdMoneda") REFERENCES "Factura"("IdMoneda")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "DetalleFactura"
ADD FOREIGN KEY("IdFactura") REFERENCES "Factura"("IdFactura")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "EstadoFactura"
ADD FOREIGN KEY("IdEstadoFactura") REFERENCES "DetalleFactura"("IdEstadoFactura")
ON UPDATE NO ACTION ON DELETE NO ACTION;