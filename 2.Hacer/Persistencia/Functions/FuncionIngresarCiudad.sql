CREATE OR REPLACE FUNCTION public.FunctionIngresarCiudad(
    P_IdDepartamento UUID,
	P_NombreCiudad VARCHAR
) 
RETURNS void as $$
BEGIN
    INSERT INTO public."Ciudad" ("P_IdDepartamento", "NombreCiudad")
    VALUES (P_IdDepartamento, P_NombreCiudad);	
END;
$$ LANGUAGE plpgsql;