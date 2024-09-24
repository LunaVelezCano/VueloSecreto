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