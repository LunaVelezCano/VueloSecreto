CREATE OR REPLACE FUNCTION public.FunctionModificarPais(
    P_IdPais UUID,
	P_NombrePais VARCHAR
) 
RETURNS void as $$
BEGIN
    UPDATE public."Pais" 
	SET "NombrePais" = P_NombrePais,
		"Actualiza" = CURRENT_TIMESTAMP
	WHERE "IdPais" = P_IdPais
		AND "Activo" = '1';	
END;
$$ LANGUAGE plpgsql;