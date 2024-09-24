CREATE OR REPLACE FUNCTION public.FunctionConsultarDepartamento()
RETURNS TABLE(IdDepartamento UUID, NombreDepartamento VARCHAR, Activo BIT, Actualiza TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT "IdDepartamento" AS IdDepartamento,
           "NombreDepartamento" AS NombreDepartamento,
           "Activo" AS Activo,
           "Actualiza" AS Actualiza
    FROM public."Departamento"
    WHERE "Activo" = B'1';  -- Comparar con un valor BIT
END;  
$$;
