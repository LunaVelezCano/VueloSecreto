SELECT jsonb_build_object
(
	'IdPais', "P"."IdPais",
	'NombrePais', "P"."NombrePais",
	'IdDepartamento', "D"."IdDepartamento",
	'NombreDepartamento', "D"."NombreDepartamento",	
	'IdCiudad', "C"."IdCiudad",
	'NombreCiudad', "C"."Nombre"
) 
AS Geografia
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