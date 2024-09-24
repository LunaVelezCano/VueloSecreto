UPDATE "Pais" 
SET "Activo" = '0',
	"Actualiza" = CURRENT_TIMESTAMP
WHERE "IdPais" = 'd158ba1e-0c66-49f5-a037-75b8482da040'
	AND "Activo" = '1';