CREATE OR REPLACE FUNCTION public.FunctionModificarDepartamento(
    P_IdDepartamento UUID,
    P_NombreDepartamento VARCHAR
) 
RETURNS void AS $$
BEGIN
    UPDATE public."Departamento" 
    SET "NombreDepartamento" = P_NombreDepartamento,
        "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento
        AND "Activo" = B'1';  -- Asegúrate de comparar con un valor BIT
END;
$$ LANGUAGE plpgsql;
