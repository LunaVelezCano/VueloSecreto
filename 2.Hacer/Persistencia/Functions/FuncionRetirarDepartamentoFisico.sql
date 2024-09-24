CREATE OR REPLACE FUNCTION public.FunctionRetirarDepartamentoFisico(
    P_IdDepartamento UUID
) 
RETURNS void AS $$
BEGIN
    DELETE 
    FROM public."Departamento" 
    WHERE "IdDepartamento" = P_IdDepartamento
        AND "Activo" = B'1';  -- Asegurarse de que el departamento esté activo
END;
$$ LANGUAGE plpgsql;
