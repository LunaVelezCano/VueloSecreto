CREATE OR REPLACE FUNCTION public.FunctionModificarCiudad(
    P_IdCiudad UUID,
    P_NombreCiudad VARCHAR
) 
RETURNS void AS $$
BEGIN
    UPDATE public."Ciudad" 
    SET "Nombre" = P_NombreCiudad,
        "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdCiudad" = P_IdCiudad
        AND "Activo" = B'1';  -- Comparar con un valor BIT
END;
$$ LANGUAGE plpgsql;
