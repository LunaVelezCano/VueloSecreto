

SELECT
	"P"."IdPais" AS "IdPais",
	"P"."NombrePais" AS "NombrePais",
	"D"."IdDepartamento" AS "IdDepartamento",
	"D"."NombreDepartamento" AS "NombreDepartamento",	
	"C"."IdCiudad" AS "IdCiudad",
	"C"."Nombre" AS "NombreCiudad"	
FROM "Pais" AS "P"
	INNER JOIN "Departamento" AS "D"
		ON "P"."IdPais" = "D"."IdPais"
	INNER JOIN "Ciudad" AS "C"
		ON "D"."IdDepartamento" = "C"."IdDepartamento"
WHERE 
		"P"."Activo" = '1'
	AND
		"D"."Activo" = '1'
	AND
		"C"."Activo" = '1'		
	;