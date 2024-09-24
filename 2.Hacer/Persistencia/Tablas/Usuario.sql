-- Crear tabla Usuario
CREATE TABLE "Usuario" (
	"IdUsuario" UUID NOT NULL UNIQUE,
	"IdTipoGenero" UUID NOT NULL,
	"IdTipoDocumento" UUID NOT NULL,
	"IdTipoEstadoCivil" UUID NOT NULL,
	"NombreUsuario" VARCHAR,
	"ApellidoUsuario" VARCHAR,
	"NumeroDocumento" VARCHAR,
	"Activo" BIT DEFAULT '1',
	"Actualiza" TIMESTAMP,
	PRIMARY KEY("IdUsuario"),
	FOREIGN KEY("IdTipoDocumento") REFERENCES "TipoDocumento"("IdTipoDocumento")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdTipoGenero") REFERENCES "TipoGenero"("IdTipoGenero")
	ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY("IdTipoEstadoCivil") REFERENCES "TipoEstadoCivil"("IdTipoEstadoCivil")
	ON UPDATE NO ACTION ON DELETE NO ACTION
);