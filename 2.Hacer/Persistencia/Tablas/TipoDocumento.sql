-- Crear tabla TipoDocumento
CREATE TABLE "TipoDocumento" (
	"IdTipoDocumento" UUID NOT NULL UNIQUE,
	"NombreTipoDocumento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoDocumento")
);

COMMENT ON TABLE "TipoDocumento" IS 'USUARIO';