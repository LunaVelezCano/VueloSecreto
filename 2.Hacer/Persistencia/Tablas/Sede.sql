-- Crear tabla Sede
CREATE TABLE "Sede" (
	"IdSede" UUID NOT NULL UNIQUE,
	"IdAgencia" UUID NOT NULL,
	"IdCiudad" UUID NOT NULL,
	"NombreSede" VARCHAR,
	"TelefonoSede" VARCHAR,
	"DireccionSede" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdSede"),
	FOREIGN KEY("IdAgencia") REFERENCES "Agencia"("IdAgencia")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdCiudad") REFERENCES "Ciudad"("IdCiudad")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Sede" IS 'EMPRESA';
