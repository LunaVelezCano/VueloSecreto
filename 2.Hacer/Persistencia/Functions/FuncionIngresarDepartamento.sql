CREATE OR REPLACE FUNCTION public.FunctionIngresarDepartamento(
	P_IdPais UUID,
    P_NombreDepartamento VARCHAR
) 
RETURNS void AS $$
BEGIN
    INSERT INTO public."Pais"("IdPais","NombreDepartamento")
    VALUES(P_IdPais,P_NombreDepartamento);
END;
$$ LANGUAGE plpgsql;