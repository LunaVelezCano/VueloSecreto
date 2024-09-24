CREATE OR REPLACE FUNCTION public.FunctionRetirarDepartamentoLogico(
    P_IdDepartamento UUID
) 
RETURNS void AS $$
BEGIN
    UPDATE public."Departamento" 
    SET "Activo" = B'0',  -- Cambiar a un valor BIT
        "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdDepartamento" = P_IdDepartamento
        AND "Activo" = B'1';  -- Asegurarse de que el departamento esté activo
END;
$$ LANGUAGE plpgsql;
