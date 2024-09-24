-- Crear tabla Pais
CREATE TABLE "Pais" (
	"IdPais" UUID NOT NULL UNIQUE,
	"NombrePais" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdPais")
);

COMMENT ON TABLE "Pais" IS 'GEOGRAFIA';