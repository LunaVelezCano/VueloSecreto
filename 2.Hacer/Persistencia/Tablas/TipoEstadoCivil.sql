-- Crear tabla TipoEstadoCivil
CREATE TABLE "TipoEstadoCivil" (
	"IdTipoEstadoCivil" UUID NOT NULL UNIQUE,
	"NombreEstadoCivil" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoEstadoCivil")
);

COMMENT ON TABLE "TipoEstadoCivil" IS 'USUARIO';