CREATE OR REPLACE FUNCTION public.FunctionRetirarPaisLogico(
    P_IdPais UUID
) 
RETURNS void as $$
BEGIN
    UPDATE public."Pais" 
	SET "Activo" = '0',
		"Actualiza" = CURRENT_TIMESTAMP
	WHERE "IdPais" = P_IdPais
		AND "Activo" = '1';	
END;
$$ LANGUAGE plpgsql;