CREATE OR REPLACE FUNCTION public.FunctionIngresarPais(
    P_Nombre VARCHAR
) 
RETURNS void AS $$
BEGIN
    INSERT INTO public.Pais(NombrePais)
    VALUES (P_Nombre);
END;
$$ LANGUAGE plpgsql;
