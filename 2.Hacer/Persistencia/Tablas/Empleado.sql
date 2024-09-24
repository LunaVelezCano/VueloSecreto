-- Crear tabla Empleado
CREATE TABLE "Empleado" (
	"IdEmpleado" UUID NOT NULL UNIQUE,
	"IdSede" UUID NOT NULL,
	"NombreEmpleado" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdEmpleado"),
	FOREIGN KEY("IdSede") REFERENCES "Sede"("IdSede")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);

COMMENT ON TABLE "Empleado" IS 'EMPRESA';