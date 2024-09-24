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