CREATE OR REPLACE FUNCTION public.FunctionRetirarCiudadLogico(
    P_IdCiudad UUID
) 
RETURNS void AS $$
BEGIN
    UPDATE public."Ciudad" 
    SET "Activo" = B'0',  -- Cambiar a un valor BIT
        "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad
        AND "Activo" = B'1';  -- Asegurarse de que la ciudad esté activa
END;
$$ LANGUAGE plpgsql;
