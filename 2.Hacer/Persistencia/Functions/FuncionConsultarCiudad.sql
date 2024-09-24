CREATE OR REPLACE FUNCTION public.FunctionConsultarCiudad()
RETURNS TABLE(IdCiudad UUID, Nombre VARCHAR, Activo BIT, Actualiza TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "IdCiudad" AS IdCiudad,
           "Nombre" AS Nombre,
           "Activo" AS Activo,
           "Actualiza" AS Actualiza
    FROM public."Ciudad"
    WHERE "Activo" = B'1';  -- Comparar con un valor BIT
END;  
$$;
