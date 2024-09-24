-- Crear tabla EstadoFactura
CREATE TABLE "EstadoFactura" (
	"IdEstadoFactura" UUID NOT NULL UNIQUE,
	"EstadoFactura" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEstadoFactura")
);

COMMENT ON TABLE "EstadoFactura" IS 'Estado de la factura';