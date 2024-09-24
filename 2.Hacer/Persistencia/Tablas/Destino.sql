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