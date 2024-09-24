-- Crear la tabla Pasabordo
CREATE TABLE "Pasabordo" (
    "IdPasabordo" UUID NOT NULL UNIQUE,
    "IdFactura" UUID NOT NULL,
    "NumeroVuelo" VARCHAR NOT NULL,
    "FechaVuelo" DATE NOT NULL,
    "HoraVuelo" TIME NOT NULL,
    "PuertaEmbarque" VARCHAR,
    "Activo" BIT DEFAULT '1',
    "Actualiza" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("IdPasabordo"),
    FOREIGN KEY("IdFactura") REFERENCES "Factura"("IdFactura")
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

COMMENT ON TABLE "Pasabordo" IS 'Tabla que almacena los datos de los pasabordos relacionados con las facturas.';
