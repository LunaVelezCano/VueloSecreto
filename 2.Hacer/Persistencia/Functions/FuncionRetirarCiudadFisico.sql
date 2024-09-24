CREATE OR REPLACE FUNCTION public.FunctionRetirarCiudadFisico(
    P_IdCiudad UUID
) 
RETURNS void AS $$
BEGIN
    DELETE 
    FROM public."Ciudad" 
    WHERE "IdCiudad" = P_IdCiudad
        AND "Activo" = B'1';  -- Asegurarse de que la ciudad esté activa
END;
$$ LANGUAGE plpgsql;
