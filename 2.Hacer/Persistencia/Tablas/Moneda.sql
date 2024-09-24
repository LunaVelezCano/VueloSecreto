-- Crear tabla Moneda
CREATE TABLE "Moneda" (
	"IdMoneda" UUID NOT NULL UNIQUE,
	"Divisa" INTEGER,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdMoneda")
);