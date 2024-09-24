CREATE OR REPLACE FUNCTION public.FunctionRetirarPaisFisico(
    P_IdPais UUID
) 
RETURNS void as $$
BEGIN
    DELETE 
	FROM public."Pais" 
	WHERE "IdPais" = P_IdPais
		AND "Activo" = '1';	
END;
$$ LANGUAGE plpgsql;