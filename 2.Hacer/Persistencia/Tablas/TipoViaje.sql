-- Crear tabla TipoViaje
CREATE TABLE "TipoViaje" (
	"IdTipoViaje" UUID NOT NULL UNIQUE,
	"IdDestino" UUID NOT NULL,
	"NombreTipoViaje" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdTipoViaje"),
	FOREIGN KEY("IdDestino") REFERENCES "Destino"("IdDestino")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "TipoViaje" IS 'DESTINO';