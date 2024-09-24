-- Crear tabla TipoGenero
CREATE TABLE "TipoGenero" (
	"IdTipoGenero" UUID NOT NULL UNIQUE,
	"NombreTipoGenero" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoGenero")
);

COMMENT ON TABLE "TipoGenero" IS 'USUARIO';