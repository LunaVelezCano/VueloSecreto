CREATE OR REPLACE FUNCTION public.FunctionConsultarPais()
RETURNS TABLE(IdPais UUID, NombrePais VARCHAR, Activo BIT, Actualiza TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "IdPais" AS IdPais,
           "NombrePais" AS NombrePais,
           "Activo" AS Activo,
           "Actualiza" AS Actualiza
    FROM public."Pais"
    WHERE "Activo" = B'1';  -- Comparar con un valor BIT
END;  
$$;
