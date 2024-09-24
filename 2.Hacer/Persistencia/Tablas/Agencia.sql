-- Crear tabla Agencia
CREATE TABLE "Agencia" (
	"IdAgencia" UUID NOT NULL UNIQUE,
	"NIT" VARCHAR,
	"RazonSocial" VARCHAR,
	"DireccionAgencia" VARCHAR,
	"TelefonoAgencia" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdAgencia")
);

COMMENT ON TABLE "Agencia" IS 'EMPRESA';