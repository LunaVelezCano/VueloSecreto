-- Crear tabla Ciudad
CREATE TABLE "Ciudad" (
	"IdCiudad" UUID NOT NULL UNIQUE,
	"IdDepartamento" UUID NOT NULL,
	"Nombre" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdCiudad"),
	FOREIGN KEY("IdDepartamento") REFERENCES "Departamento"("IdDepartamento")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);