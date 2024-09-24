-- Crear tabla Departamento
CREATE TABLE "Departamento" (
	"IdDepartamento" UUID NOT NULL UNIQUE,
	"IdPais" UUID NOT NULL,
	"NombreDepartamento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdDepartamento"),
	FOREIGN KEY("IdPais") REFERENCES "Pais"("IdPais")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Departamento" IS 'GEOGRAFIA';