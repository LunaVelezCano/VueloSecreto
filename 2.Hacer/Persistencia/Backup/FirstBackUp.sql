PGDMP  %        	            |            VueloSecreto    16.4    16.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16805    VueloSecreto    DATABASE     �   CREATE DATABASE "VueloSecreto" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "VueloSecreto";
                postgres    false                        3079    17124 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2                       1255    17052 i   actualizar_agencia(uuid, character varying, character varying, character varying, character varying, bit)    FUNCTION     �  CREATE FUNCTION public.actualizar_agencia(id uuid, nit character varying, razon_social character varying, direccion character varying, telefono character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Agencia"
    SET "NIT" = nit, "RazonSocial" = razon_social, "DireccionAgencia" = direccion, "TelefonoAgencia" = telefono, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idAgencia" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_agencia(id uuid, nit character varying, razon_social character varying, direccion character varying, telefono character varying, activo bit);
       public          postgres    false            7           1255    17048 5   actualizar_ciudad(uuid, uuid, character varying, bit)    FUNCTION     J  CREATE FUNCTION public.actualizar_ciudad(id uuid, id_departamento uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Ciudad"
    SET "idDepartamento" = id_departamento, "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idCiudad" = id;
END;
$$;
 m   DROP FUNCTION public.actualizar_ciudad(id uuid, id_departamento uuid, nombre character varying, activo bit);
       public          postgres    false            $           1255    17044 ;   actualizar_departamento(uuid, uuid, character varying, bit)    FUNCTION     D  CREATE FUNCTION public.actualizar_departamento(id uuid, id_pais uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Departamento"
    SET "idPais" = id_pais, "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDepartamento" = id;
END;
$$;
 k   DROP FUNCTION public.actualizar_departamento(id uuid, id_pais uuid, nombre character varying, activo bit);
       public          postgres    false            '           1255    17080 0   actualizar_destino(uuid, character varying, bit)    FUNCTION       CREATE FUNCTION public.actualizar_destino(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Destino"
    SET "NombreDestino" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDestino" = id;
END;
$$;
 X   DROP FUNCTION public.actualizar_destino(id uuid, nombre character varying, activo bit);
       public          postgres    false            �            1255    17096 C   actualizar_detalle_factura(uuid, uuid, text, integer, numeric, bit)    FUNCTION     �  CREATE FUNCTION public.actualizar_detalle_factura(id uuid, id_factura uuid, descripcion text, cantidad integer, precio_unitario numeric, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "DetalleFactura"
    SET "idFactura" = id_factura, "Descripcion" = descripcion, "Cantidad" = cantidad, "PrecioUnitario" = precio_unitario, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idDetalleFactura" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_detalle_factura(id uuid, id_factura uuid, descripcion text, cantidad integer, precio_unitario numeric, activo bit);
       public          postgres    false                       1255    17060 7   actualizar_empleado(uuid, uuid, character varying, bit)    FUNCTION     @  CREATE FUNCTION public.actualizar_empleado(id uuid, id_sede uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Empleado"
    SET "idSede" = id_sede, "NombreEmpleado" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idEmpleado" = id;
END;
$$;
 g   DROP FUNCTION public.actualizar_empleado(id uuid, id_sede uuid, nombre character varying, activo bit);
       public          postgres    false            9           1255    17100 7   actualizar_estado_factura(uuid, character varying, bit)    FUNCTION     3  CREATE FUNCTION public.actualizar_estado_factura(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "EstadoFactura"
    SET "NombreEstadoFactura" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idEstadoFactura" = id;
END;
$$;
 _   DROP FUNCTION public.actualizar_estado_factura(id uuid, nombre character varying, activo bit);
       public          postgres    false                       1255    17092 I   actualizar_factura(uuid, uuid, timestamp without time zone, numeric, bit)    FUNCTION     s  CREATE FUNCTION public.actualizar_factura(id uuid, id_cliente uuid, fecha timestamp without time zone, total numeric, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Factura"
    SET "idCliente" = id_cliente, "FechaFactura" = fecha, "TotalFactura" = total, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idFactura" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_factura(id uuid, id_cliente uuid, fecha timestamp without time zone, total numeric, activo bit);
       public          postgres    false                       1255    17104 B   actualizar_moneda(uuid, character varying, character varying, bit)    FUNCTION     L  CREATE FUNCTION public.actualizar_moneda(id uuid, nombre character varying, simbolo character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Moneda"
    SET "NombreMoneda" = nombre, "SimboloMoneda" = simbolo, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idMoneda" = id;
END;
$$;
 r   DROP FUNCTION public.actualizar_moneda(id uuid, nombre character varying, simbolo character varying, activo bit);
       public          postgres    false            �            1255    17040 -   actualizar_pais(uuid, character varying, bit)    FUNCTION     
  CREATE FUNCTION public.actualizar_pais(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Pais"
    SET "Nombre" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idPais" = id;
END;
$$;
 U   DROP FUNCTION public.actualizar_pais(id uuid, nombre character varying, activo bit);
       public          postgres    false            =           1255    17122 i   actualizar_pasabordo(uuid, uuid, character varying, date, time without time zone, character varying, bit)    FUNCTION       CREATE FUNCTION public.actualizar_pasabordo(id uuid, id_factura uuid, numero_vuelo character varying, fecha_vuelo date, hora_vuelo time without time zone, puerta_embarque character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Pasabordo"
    SET "IdFactura" = id_factura, "NumeroVuelo" = numero_vuelo, "FechaVuelo" = fecha_vuelo, "HoraVuelo" = hora_vuelo, "PuertaEmbarque" = puerta_embarque, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "IdPasabordo" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_pasabordo(id uuid, id_factura uuid, numero_vuelo character varying, fecha_vuelo date, hora_vuelo time without time zone, puerta_embarque character varying, activo bit);
       public          postgres    false            A           1255    17056 _   actualizar_sede(uuid, uuid, uuid, character varying, character varying, character varying, bit)    FUNCTION     �  CREATE FUNCTION public.actualizar_sede(id uuid, id_agencia uuid, id_ciudad uuid, nombre character varying, telefono character varying, direccion character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Sede"
    SET "idAgencia" = id_agencia, "idCiudad" = id_ciudad, "NombreSede" = nombre, "TelefonoSede" = telefono, "DireccionSede" = direccion, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idSede" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_sede(id uuid, id_agencia uuid, id_ciudad uuid, nombre character varying, telefono character varying, direccion character varying, activo bit);
       public          postgres    false            �            1255    17084 3   actualizar_tipo_clase(uuid, character varying, bit)    FUNCTION     #  CREATE FUNCTION public.actualizar_tipo_clase(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "TipoClase"
    SET "NombreTipoClase" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoClase" = id;
END;
$$;
 [   DROP FUNCTION public.actualizar_tipo_clase(id uuid, nombre character varying, activo bit);
       public          postgres    false                       1255    17072 7   actualizar_tipo_documento(uuid, character varying, bit)    FUNCTION     3  CREATE FUNCTION public.actualizar_tipo_documento(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "TipoDocumento"
    SET "NombreTipoDocumento" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoDocumento" = id;
END;
$$;
 _   DROP FUNCTION public.actualizar_tipo_documento(id uuid, nombre character varying, activo bit);
       public          postgres    false            �            1255    17076 :   actualizar_tipo_estado_civil(uuid, character varying, bit)    FUNCTION     <  CREATE FUNCTION public.actualizar_tipo_estado_civil(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "TipoEstadoCivil"
    SET "NombreTipoEstadoCivil" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoEstadoCivil" = id;
END;
$$;
 b   DROP FUNCTION public.actualizar_tipo_estado_civil(id uuid, nombre character varying, activo bit);
       public          postgres    false            !           1255    17068 4   actualizar_tipo_genero(uuid, character varying, bit)    FUNCTION     '  CREATE FUNCTION public.actualizar_tipo_genero(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "TipoGenero"
    SET "NombreTipoGenero" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoGenero" = id;
END;
$$;
 \   DROP FUNCTION public.actualizar_tipo_genero(id uuid, nombre character varying, activo bit);
       public          postgres    false            �            1255    17088 3   actualizar_tipo_viaje(uuid, character varying, bit)    FUNCTION     #  CREATE FUNCTION public.actualizar_tipo_viaje(id uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "TipoViaje"
    SET "NombreTipoViaje" = nombre, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idTipoViaje" = id;
END;
$$;
 [   DROP FUNCTION public.actualizar_tipo_viaje(id uuid, nombre character varying, activo bit);
       public          postgres    false            6           1255    17064 h   actualizar_usuario(uuid, uuid, uuid, uuid, character varying, character varying, character varying, bit)    FUNCTION     P  CREATE FUNCTION public.actualizar_usuario(id uuid, id_tipo_genero uuid, id_tipo_documento uuid, id_estado_civil uuid, nombre character varying, apellido character varying, numero_documento character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE "Usuario"
    SET "idTipoGenero" = id_tipo_genero, "idTipoDocumento" = id_tipo_documento, "idTipoEstadoCivil" = id_estado_civil, "NombreUsuario" = nombre, "ApellidoUsuario" = apellido, "NumeroDocumento" = numero_documento, "Activo" = activo, "Actualiza" = CURRENT_TIMESTAMP
    WHERE "idUsuario" = id;
END;
$$;
 �   DROP FUNCTION public.actualizar_usuario(id uuid, id_tipo_genero uuid, id_tipo_documento uuid, id_estado_civil uuid, nombre character varying, apellido character varying, numero_documento character varying, activo bit);
       public          postgres    false                       1255    17050 ^   crear_agencia(character varying, character varying, character varying, character varying, bit)    FUNCTION     |  CREATE FUNCTION public.crear_agencia(nit character varying, razon_social character varying, direccion character varying, telefono character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Agencia" ("NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia", "Activo") 
    VALUES (nit, razon_social, direccion, telefono, activo);
END;
$$;
 �   DROP FUNCTION public.crear_agencia(nit character varying, razon_social character varying, direccion character varying, telefono character varying, activo bit);
       public          postgres    false            )           1255    17046 *   crear_ciudad(uuid, character varying, bit)    FUNCTION       CREATE FUNCTION public.crear_ciudad(id_departamento uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Ciudad" ("idDepartamento", "Nombre", "Activo") VALUES (id_departamento, nombre, activo);
END;
$$;
 _   DROP FUNCTION public.crear_ciudad(id_departamento uuid, nombre character varying, activo bit);
       public          postgres    false            ,           1255    17042 0   crear_departamento(uuid, character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_departamento(id_pais uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Departamento" ("idPais", "Nombre", "Activo") VALUES (id_pais, nombre, activo);
END;
$$;
 ]   DROP FUNCTION public.crear_departamento(id_pais uuid, nombre character varying, activo bit);
       public          postgres    false            �            1255    17078 %   crear_destino(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_destino(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Destino" ("NombreDestino", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 J   DROP FUNCTION public.crear_destino(nombre character varying, activo bit);
       public          postgres    false            �            1255    17094 8   crear_detalle_factura(uuid, text, integer, numeric, bit)    FUNCTION     r  CREATE FUNCTION public.crear_detalle_factura(id_factura uuid, descripcion text, cantidad integer, precio_unitario numeric, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "DetalleFactura" ("idFactura", "Descripcion", "Cantidad", "PrecioUnitario", "Activo") 
    VALUES (id_factura, descripcion, cantidad, precio_unitario, activo);
END;
$$;
 �   DROP FUNCTION public.crear_detalle_factura(id_factura uuid, descripcion text, cantidad integer, precio_unitario numeric, activo bit);
       public          postgres    false                       1255    17058 ,   crear_empleado(uuid, character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_empleado(id_sede uuid, nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Empleado" ("idSede", "NombreEmpleado", "Activo") 
    VALUES (id_sede, nombre, activo);
END;
$$;
 Y   DROP FUNCTION public.crear_empleado(id_sede uuid, nombre character varying, activo bit);
       public          postgres    false            F           1255    17098 ,   crear_estado_factura(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_estado_factura(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "EstadoFactura" ("NombreEstadoFactura", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 Q   DROP FUNCTION public.crear_estado_factura(nombre character varying, activo bit);
       public          postgres    false                       1255    17090 >   crear_factura(uuid, timestamp without time zone, numeric, bit)    FUNCTION     1  CREATE FUNCTION public.crear_factura(id_cliente uuid, fecha timestamp without time zone, total numeric, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Factura" ("idCliente", "FechaFactura", "TotalFactura", "Activo") 
    VALUES (id_cliente, fecha, total, activo);
END;
$$;
 s   DROP FUNCTION public.crear_factura(id_cliente uuid, fecha timestamp without time zone, total numeric, activo bit);
       public          postgres    false                       1255    17102 7   crear_moneda(character varying, character varying, bit)    FUNCTION       CREATE FUNCTION public.crear_moneda(nombre character varying, simbolo character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Moneda" ("NombreMoneda", "SimboloMoneda", "Activo") 
    VALUES (nombre, simbolo, activo);
END;
$$;
 d   DROP FUNCTION public.crear_moneda(nombre character varying, simbolo character varying, activo bit);
       public          postgres    false            *           1255    17038 "   crear_pais(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_pais(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Pais" ("Nombre", "Activo") VALUES (nombre, activo);
END;
$$;
 G   DROP FUNCTION public.crear_pais(nombre character varying, activo bit);
       public          postgres    false            �            1255    17120 ^   crear_pasabordo(uuid, character varying, date, time without time zone, character varying, bit)    FUNCTION     �  CREATE FUNCTION public.crear_pasabordo(id_factura uuid, numero_vuelo character varying, fecha_vuelo date, hora_vuelo time without time zone, puerta_embarque character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Pasabordo" ("IdFactura", "NumeroVuelo", "FechaVuelo", "HoraVuelo", "PuertaEmbarque", "Activo") 
    VALUES (id_factura, numero_vuelo, fecha_vuelo, hora_vuelo, puerta_embarque, activo);
END;
$$;
 �   DROP FUNCTION public.crear_pasabordo(id_factura uuid, numero_vuelo character varying, fecha_vuelo date, hora_vuelo time without time zone, puerta_embarque character varying, activo bit);
       public          postgres    false            :           1255    17054 T   crear_sede(uuid, uuid, character varying, character varying, character varying, bit)    FUNCTION     �  CREATE FUNCTION public.crear_sede(id_agencia uuid, id_ciudad uuid, nombre character varying, telefono character varying, direccion character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Sede" ("idAgencia", "idCiudad", "NombreSede", "TelefonoSede", "DireccionSede", "Activo") 
    VALUES (id_agencia, id_ciudad, nombre, telefono, direccion, activo);
END;
$$;
 �   DROP FUNCTION public.crear_sede(id_agencia uuid, id_ciudad uuid, nombre character varying, telefono character varying, direccion character varying, activo bit);
       public          postgres    false            E           1255    17082 (   crear_tipo_clase(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_tipo_clase(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "TipoClase" ("NombreTipoClase", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 M   DROP FUNCTION public.crear_tipo_clase(nombre character varying, activo bit);
       public          postgres    false            �            1255    17070 ,   crear_tipo_documento(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_tipo_documento(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "TipoDocumento" ("NombreTipoDocumento", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 Q   DROP FUNCTION public.crear_tipo_documento(nombre character varying, activo bit);
       public          postgres    false            >           1255    17074 /   crear_tipo_estado_civil(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_tipo_estado_civil(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "TipoEstadoCivil" ("NombreTipoEstadoCivil", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 T   DROP FUNCTION public.crear_tipo_estado_civil(nombre character varying, activo bit);
       public          postgres    false            B           1255    17066 )   crear_tipo_genero(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_tipo_genero(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "TipoGenero" ("NombreTipoGenero", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 N   DROP FUNCTION public.crear_tipo_genero(nombre character varying, activo bit);
       public          postgres    false            �            1255    17086 (   crear_tipo_viaje(character varying, bit)    FUNCTION     �   CREATE FUNCTION public.crear_tipo_viaje(nombre character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "TipoViaje" ("NombreTipoViaje", "Activo") 
    VALUES (nombre, activo);
END;
$$;
 M   DROP FUNCTION public.crear_tipo_viaje(nombre character varying, activo bit);
       public          postgres    false            �            1255    17062 ]   crear_usuario(uuid, uuid, uuid, character varying, character varying, character varying, bit)    FUNCTION       CREATE FUNCTION public.crear_usuario(id_tipo_genero uuid, id_tipo_documento uuid, id_estado_civil uuid, nombre character varying, apellido character varying, numero_documento character varying, activo bit) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO "Usuario" ("idTipoGenero", "idTipoDocumento", "idTipoEstadoCivil", "NombreUsuario", "ApellidoUsuario", "NumeroDocumento", "Activo") 
    VALUES (id_tipo_genero, id_tipo_documento, id_estado_civil, nombre, apellido, numero_documento, activo);
END;
$$;
 �   DROP FUNCTION public.crear_usuario(id_tipo_genero uuid, id_tipo_documento uuid, id_estado_civil uuid, nombre character varying, apellido character varying, numero_documento character varying, activo bit);
       public          postgres    false            /           1255    17053    eliminar_agencia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_agencia(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Agencia"
    WHERE "idAgencia" = id;
END;
$$;
 0   DROP FUNCTION public.eliminar_agencia(id uuid);
       public          postgres    false            	           1255    17049    eliminar_ciudad(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_ciudad(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Ciudad"
    WHERE "idCiudad" = id;
END;
$$;
 /   DROP FUNCTION public.eliminar_ciudad(id uuid);
       public          postgres    false            
           1255    17045    eliminar_departamento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_departamento(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Departamento"
    WHERE "idDepartamento" = id;
END;
$$;
 5   DROP FUNCTION public.eliminar_departamento(id uuid);
       public          postgres    false                       1255    17081    eliminar_destino(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_destino(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Destino"
    WHERE "idDestino" = id;
END;
$$;
 0   DROP FUNCTION public.eliminar_destino(id uuid);
       public          postgres    false                       1255    17097    eliminar_detalle_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_detalle_factura(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "DetalleFactura"
    WHERE "idDetalleFactura" = id;
END;
$$;
 8   DROP FUNCTION public.eliminar_detalle_factura(id uuid);
       public          postgres    false            3           1255    17061    eliminar_empleado(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_empleado(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Empleado"
    WHERE "idEmpleado" = id;
END;
$$;
 1   DROP FUNCTION public.eliminar_empleado(id uuid);
       public          postgres    false            D           1255    17101    eliminar_estado_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_estado_factura(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "EstadoFactura"
    WHERE "idEstadoFactura" = id;
END;
$$;
 7   DROP FUNCTION public.eliminar_estado_factura(id uuid);
       public          postgres    false            4           1255    17093    eliminar_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_factura(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Factura"
    WHERE "idFactura" = id;
END;
$$;
 0   DROP FUNCTION public.eliminar_factura(id uuid);
       public          postgres    false            �            1255    17105    eliminar_moneda(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_moneda(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Moneda"
    WHERE "idMoneda" = id;
END;
$$;
 /   DROP FUNCTION public.eliminar_moneda(id uuid);
       public          postgres    false                       1255    17041    eliminar_pais(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_pais(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Pais"
    WHERE "idPais" = id;
END;
$$;
 -   DROP FUNCTION public.eliminar_pais(id uuid);
       public          postgres    false                       1255    17123    eliminar_pasabordo(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_pasabordo(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Pasabordo"
    WHERE "IdPasabordo" = id;
END;
$$;
 2   DROP FUNCTION public.eliminar_pasabordo(id uuid);
       public          postgres    false                        1255    17057    eliminar_sede(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_sede(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Sede"
    WHERE "idSede" = id;
END;
$$;
 -   DROP FUNCTION public.eliminar_sede(id uuid);
       public          postgres    false                       1255    17085    eliminar_tipo_clase(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_tipo_clase(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "TipoClase"
    WHERE "idTipoClase" = id;
END;
$$;
 3   DROP FUNCTION public.eliminar_tipo_clase(id uuid);
       public          postgres    false            -           1255    17073    eliminar_tipo_documento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_tipo_documento(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "TipoDocumento"
    WHERE "idTipoDocumento" = id;
END;
$$;
 7   DROP FUNCTION public.eliminar_tipo_documento(id uuid);
       public          postgres    false            <           1255    17077     eliminar_tipo_estado_civil(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_tipo_estado_civil(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "TipoEstadoCivil"
    WHERE "idTipoEstadoCivil" = id;
END;
$$;
 :   DROP FUNCTION public.eliminar_tipo_estado_civil(id uuid);
       public          postgres    false            ?           1255    17069    eliminar_tipo_genero(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_tipo_genero(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "TipoGenero"
    WHERE "idTipoGenero" = id;
END;
$$;
 4   DROP FUNCTION public.eliminar_tipo_genero(id uuid);
       public          postgres    false            #           1255    17089    eliminar_tipo_viaje(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_tipo_viaje(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "TipoViaje"
    WHERE "idTipoViaje" = id;
END;
$$;
 3   DROP FUNCTION public.eliminar_tipo_viaje(id uuid);
       public          postgres    false            5           1255    17065    eliminar_usuario(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_usuario(id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Usuario"
    WHERE "idUsuario" = id;
END;
$$;
 0   DROP FUNCTION public.eliminar_usuario(id uuid);
       public          postgres    false            C           1255    17051    leer_agencia(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_agencia(id uuid) RETURNS TABLE(idagencia uuid, nit character varying, razonsocial character varying, direccionagencia character varying, telefonoagencia character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idAgencia", "NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia", "Activo", "Actualiza"
    FROM "Agencia"
    WHERE "idAgencia" = id;
END;
$$;
 ,   DROP FUNCTION public.leer_agencia(id uuid);
       public          postgres    false            "           1255    17047    leer_ciudad(uuid)    FUNCTION     `  CREATE FUNCTION public.leer_ciudad(id uuid) RETURNS TABLE(idciudad uuid, iddepartamento uuid, nombre character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idCiudad", "idDepartamento", "Nombre", "Activo", "Actualiza"
    FROM "Ciudad"
    WHERE "idCiudad" = id;
END;
$$;
 +   DROP FUNCTION public.leer_ciudad(id uuid);
       public          postgres    false                       1255    17043    leer_departamento(uuid)    FUNCTION     n  CREATE FUNCTION public.leer_departamento(id uuid) RETURNS TABLE(iddepartamento uuid, idpais uuid, nombre character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idDepartamento", "idPais", "Nombre", "Activo", "Actualiza"
    FROM "Departamento"
    WHERE "idDepartamento" = id;
END;
$$;
 1   DROP FUNCTION public.leer_departamento(id uuid);
       public          postgres    false                       1255    17079    leer_destino(uuid)    FUNCTION     L  CREATE FUNCTION public.leer_destino(id uuid) RETURNS TABLE(iddestino uuid, nombredestino character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idDestino", "NombreDestino", "Activo", "Actualiza"
    FROM "Destino"
    WHERE "idDestino" = id;
END;
$$;
 ,   DROP FUNCTION public.leer_destino(id uuid);
       public          postgres    false                       1255    17095    leer_detalle_factura(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_detalle_factura(id uuid) RETURNS TABLE(iddetallefactura uuid, idfactura uuid, descripcion text, cantidad integer, preciounitario numeric, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idDetalleFactura", "idFactura", "Descripcion", "Cantidad", "PrecioUnitario", "Activo", "Actualiza"
    FROM "DetalleFactura"
    WHERE "idDetalleFactura" = id;
END;
$$;
 4   DROP FUNCTION public.leer_detalle_factura(id uuid);
       public          postgres    false                       1255    17059    leer_empleado(uuid)    FUNCTION     j  CREATE FUNCTION public.leer_empleado(id uuid) RETURNS TABLE(idempleado uuid, idsede uuid, nombreempleado character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idEmpleado", "idSede", "NombreEmpleado", "Activo", "Actualiza"
    FROM "Empleado"
    WHERE "idEmpleado" = id;
END;
$$;
 -   DROP FUNCTION public.leer_empleado(id uuid);
       public          postgres    false                       1255    17099    leer_estado_factura(uuid)    FUNCTION     w  CREATE FUNCTION public.leer_estado_factura(id uuid) RETURNS TABLE(idestadofactura uuid, nombreestadofactura character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idEstadoFactura", "NombreEstadoFactura", "Activo", "Actualiza"
    FROM "EstadoFactura"
    WHERE "idEstadoFactura" = id;
END;
$$;
 3   DROP FUNCTION public.leer_estado_factura(id uuid);
       public          postgres    false                       1255    17091    leer_factura(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_factura(id uuid) RETURNS TABLE(idfactura uuid, idcliente uuid, fechafactura timestamp without time zone, totalfactura numeric, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idFactura", "idCliente", "FechaFactura", "TotalFactura", "Activo", "Actualiza"
    FROM "Factura"
    WHERE "idFactura" = id;
END;
$$;
 ,   DROP FUNCTION public.leer_factura(id uuid);
       public          postgres    false            0           1255    17103    leer_moneda(uuid)    FUNCTION     w  CREATE FUNCTION public.leer_moneda(id uuid) RETURNS TABLE(idmoneda uuid, nombremoneda character varying, simbolomoneda character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idMoneda", "NombreMoneda", "SimboloMoneda", "Activo", "Actualiza"
    FROM "Moneda"
    WHERE "idMoneda" = id;
END;
$$;
 +   DROP FUNCTION public.leer_moneda(id uuid);
       public          postgres    false                       1255    17039    leer_pais(uuid)    FUNCTION     /  CREATE FUNCTION public.leer_pais(id uuid) RETURNS TABLE(idpais uuid, nombre character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idPais", "Nombre", "Activo", "Actualiza"
    FROM "Pais"
    WHERE "idPais" = id;
END;
$$;
 )   DROP FUNCTION public.leer_pais(id uuid);
       public          postgres    false            �            1255    17121    leer_pasabordo(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_pasabordo(id uuid) RETURNS TABLE(idpasabordo uuid, idfactura uuid, numerovuelo character varying, fechavuelo date, horavuelo time without time zone, puertaembarque character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "IdPasabordo", "IdFactura", "NumeroVuelo", "FechaVuelo", "HoraVuelo", "PuertaEmbarque", "Activo", "Actualiza"
    FROM "Pasabordo"
    WHERE "IdPasabordo" = id;
END;
$$;
 .   DROP FUNCTION public.leer_pasabordo(id uuid);
       public          postgres    false            +           1255    17055    leer_sede(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_sede(id uuid) RETURNS TABLE(idsede uuid, idagencia uuid, idciudad uuid, nombresede character varying, telefonosede character varying, direccionsede character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idSede", "idAgencia", "idCiudad", "NombreSede", "TelefonoSede", "DireccionSede", "Activo", "Actualiza"
    FROM "Sede"
    WHERE "idSede" = id;
END;
$$;
 )   DROP FUNCTION public.leer_sede(id uuid);
       public          postgres    false                       1255    17083    leer_tipo_clase(uuid)    FUNCTION     [  CREATE FUNCTION public.leer_tipo_clase(id uuid) RETURNS TABLE(idtipoclase uuid, nombretipoclase character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoClase", "NombreTipoClase", "Activo", "Actualiza"
    FROM "TipoClase"
    WHERE "idTipoClase" = id;
END;
$$;
 /   DROP FUNCTION public.leer_tipo_clase(id uuid);
       public          postgres    false            �            1255    17071    leer_tipo_documento(uuid)    FUNCTION     w  CREATE FUNCTION public.leer_tipo_documento(id uuid) RETURNS TABLE(idtipodocumento uuid, nombretipodocumento character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoDocumento", "NombreTipoDocumento", "Activo", "Actualiza"
    FROM "TipoDocumento"
    WHERE "idTipoDocumento" = id;
END;
$$;
 3   DROP FUNCTION public.leer_tipo_documento(id uuid);
       public          postgres    false                       1255    17075    leer_tipo_estado_civil(uuid)    FUNCTION     �  CREATE FUNCTION public.leer_tipo_estado_civil(id uuid) RETURNS TABLE(idtipoestadocivil uuid, nombretipoestadocivil character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoEstadoCivil", "NombreTipoEstadoCivil", "Activo", "Actualiza"
    FROM "TipoEstadoCivil"
    WHERE "idTipoEstadoCivil" = id;
END;
$$;
 6   DROP FUNCTION public.leer_tipo_estado_civil(id uuid);
       public          postgres    false            �            1255    17067    leer_tipo_genero(uuid)    FUNCTION     b  CREATE FUNCTION public.leer_tipo_genero(id uuid) RETURNS TABLE(idtipogenero uuid, nombretipogenero character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoGenero", "NombreTipoGenero", "Activo", "Actualiza"
    FROM "TipoGenero"
    WHERE "idTipoGenero" = id;
END;
$$;
 0   DROP FUNCTION public.leer_tipo_genero(id uuid);
       public          postgres    false            �            1255    17087    leer_tipo_viaje(uuid)    FUNCTION     [  CREATE FUNCTION public.leer_tipo_viaje(id uuid) RETURNS TABLE(idtipoviaje uuid, nombretipoviaje character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idTipoViaje", "NombreTipoViaje", "Activo", "Actualiza"
    FROM "TipoViaje"
    WHERE "idTipoViaje" = id;
END;
$$;
 /   DROP FUNCTION public.leer_tipo_viaje(id uuid);
       public          postgres    false            &           1255    17063    leer_usuario(uuid)    FUNCTION     1  CREATE FUNCTION public.leer_usuario(id uuid) RETURNS TABLE(idusuario uuid, idtipogenero uuid, idtipodocumento uuid, idtipoestadocivil uuid, nombreusuario character varying, apellidousuario character varying, numerodocumento character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT "idUsuario", "idTipoGenero", "idTipoDocumento", "idTipoEstadoCivil", "NombreUsuario", "ApellidoUsuario", "NumeroDocumento", "Activo", "Actualiza"
    FROM "Usuario"
    WHERE "idUsuario" = id;
END;
$$;
 ,   DROP FUNCTION public.leer_usuario(id uuid);
       public          postgres    false            �            1259    16840    Agencia    TABLE     g  CREATE TABLE public."Agencia" (
    "IdAgencia" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NIT" character varying,
    "RazonSocial" character varying,
    "DireccionAgencia" character varying,
    "TelefonoAgencia" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Agencia";
       public         heap    postgres    false    2            �            1259    16827    Ciudad    TABLE       CREATE TABLE public."Ciudad" (
    "IdCiudad" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdDepartamento" uuid NOT NULL,
    "Nombre" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Ciudad";
       public         heap    postgres    false    2            �            1259    16814    Departamento    TABLE     $  CREATE TABLE public."Departamento" (
    "IdDepartamento" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdPais" uuid NOT NULL,
    "NombreDepartamento" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public."Departamento";
       public         heap    postgres    false    2            �            1259    16919    Destino    TABLE     *  CREATE TABLE public."Destino" (
    "IdDestino" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NombreDestino" character varying,
    "FechaSalida" date,
    "FechaRegreso" date,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Destino";
       public         heap    postgres    false    2            �            1259    17016    DetalleFactura    TABLE     |  CREATE TABLE public."DetalleFactura" (
    "IdDetalleFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdFactura" uuid NOT NULL,
    "CantidadTiquetes" integer,
    "PesoEquipaje" integer,
    "ValorTiquete" integer,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "IdEstadoFactura" uuid NOT NULL
);
 $   DROP TABLE public."DetalleFactura";
       public         heap    postgres    false    2            �            1259    16866    Empleado    TABLE       CREATE TABLE public."Empleado" (
    "IdEmpleado" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdSede" uuid NOT NULL,
    "NombreEmpleado" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Empleado";
       public         heap    postgres    false    2            �            1259    17008    EstadoFactura    TABLE       CREATE TABLE public."EstadoFactura" (
    "IdEstadoFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "EstadoFactura" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public."EstadoFactura";
       public         heap    postgres    false    2            �            1259    16982    Factura    TABLE     d  CREATE TABLE public."Factura" (
    "IdFactura" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdSede" uuid NOT NULL,
    "IdUsuario" uuid NOT NULL,
    "IdDestino" uuid NOT NULL,
    "IdMoneda" uuid NOT NULL,
    "IMPUESTROS" integer,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Factura";
       public         heap    postgres    false    2            �            1259    16976    Moneda    TABLE     �   CREATE TABLE public."Moneda" (
    "IdMoneda" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "Divisa" integer,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Moneda";
       public         heap    postgres    false    2            �            1259    16806    Pais    TABLE     �   CREATE TABLE public."Pais" (
    "IdPais" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NombrePais" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Pais";
       public         heap    postgres    false    2            �            1259    17106 	   Pasabordo    TABLE     �  CREATE TABLE public."Pasabordo" (
    "IdPasabordo" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdFactura" uuid NOT NULL,
    "NumeroVuelo" character varying NOT NULL,
    "FechaVuelo" date NOT NULL,
    "HoraVuelo" time without time zone NOT NULL,
    "PuertaEmbarque" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Pasabordo";
       public         heap    postgres    false    2            �            1259    16848    Sede    TABLE     z  CREATE TABLE public."Sede" (
    "IdSede" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdAgencia" uuid NOT NULL,
    "IdCiudad" uuid NOT NULL,
    "NombreSede" character varying,
    "TelefonoSede" character varying,
    "DireccionSede" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Sede";
       public         heap    postgres    false    2            �            1259    16963 	   TipoClase    TABLE       CREATE TABLE public."TipoClase" (
    "IdTipoClase" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdDestino" uuid NOT NULL,
    "NombreTipoClase" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."TipoClase";
       public         heap    postgres    false    2            �            1259    16895    TipoDocumento    TABLE       CREATE TABLE public."TipoDocumento" (
    "IdTipoDocumento" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NombreTipoDocumento" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public."TipoDocumento";
       public         heap    postgres    false    2            �            1259    16911    TipoEstadoCivil    TABLE       CREATE TABLE public."TipoEstadoCivil" (
    "IdTipoEstadoCivil" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NombreEstadoCivil" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 %   DROP TABLE public."TipoEstadoCivil";
       public         heap    postgres    false    2            �            1259    16903 
   TipoGenero    TABLE       CREATE TABLE public."TipoGenero" (
    "IdTipoGenero" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "NombreTipoGenero" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public."TipoGenero";
       public         heap    postgres    false    2            �            1259    16950 	   TipoViaje    TABLE       CREATE TABLE public."TipoViaje" (
    "IdTipoViaje" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdDestino" uuid NOT NULL,
    "NombreTipoViaje" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."TipoViaje";
       public         heap    postgres    false    2            �            1259    16927    Usuario    TABLE     �  CREATE TABLE public."Usuario" (
    "IdUsuario" uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "IdTipoGenero" uuid NOT NULL,
    "IdTipoDocumento" uuid NOT NULL,
    "IdTipoEstadoCivil" uuid NOT NULL,
    "NombreUsuario" character varying,
    "ApellidoUsuario" character varying,
    "NumeroDocumento" character varying,
    "Activo" bit(1) DEFAULT '1'::"bit",
    "Actualiza" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."Usuario";
       public         heap    postgres    false    2            �          0    16840    Agencia 
   TABLE DATA           �   COPY public."Agencia" ("IdAgencia", "NIT", "RazonSocial", "DireccionAgencia", "TelefonoAgencia", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    219   �      �          0    16827    Ciudad 
   TABLE DATA           a   COPY public."Ciudad" ("IdCiudad", "IdDepartamento", "Nombre", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    218   �      �          0    16814    Departamento 
   TABLE DATA           q   COPY public."Departamento" ("IdDepartamento", "IdPais", "NombreDepartamento", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    217   .
      �          0    16919    Destino 
   TABLE DATA           w   COPY public."Destino" ("IdDestino", "NombreDestino", "FechaSalida", "FechaRegreso", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    225   }      �          0    17016    DetalleFactura 
   TABLE DATA           �   COPY public."DetalleFactura" ("IdDetalleFactura", "IdFactura", "CantidadTiquetes", "PesoEquipaje", "ValorTiquete", "Activo", "Actualiza", "IdEstadoFactura") FROM stdin;
    public          postgres    false    232   �      �          0    16866    Empleado 
   TABLE DATA           e   COPY public."Empleado" ("IdEmpleado", "IdSede", "NombreEmpleado", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    221   �      �          0    17008    EstadoFactura 
   TABLE DATA           d   COPY public."EstadoFactura" ("IdEstadoFactura", "EstadoFactura", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    231   �      �          0    16982    Factura 
   TABLE DATA           �   COPY public."Factura" ("IdFactura", "IdSede", "IdUsuario", "IdDestino", "IdMoneda", "IMPUESTROS", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    230   �      �          0    16976    Moneda 
   TABLE DATA           O   COPY public."Moneda" ("IdMoneda", "Divisa", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    229         �          0    16806    Pais 
   TABLE DATA           O   COPY public."Pais" ("IdPais", "NombrePais", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    216   +      �          0    17106 	   Pasabordo 
   TABLE DATA           �   COPY public."Pasabordo" ("IdPasabordo", "IdFactura", "NumeroVuelo", "FechaVuelo", "HoraVuelo", "PuertaEmbarque", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    233         �          0    16848    Sede 
   TABLE DATA           �   COPY public."Sede" ("IdSede", "IdAgencia", "IdCiudad", "NombreSede", "TelefonoSede", "DireccionSede", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    220   -      �          0    16963 	   TipoClase 
   TABLE DATA           k   COPY public."TipoClase" ("IdTipoClase", "IdDestino", "NombreTipoClase", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    228   J      �          0    16895    TipoDocumento 
   TABLE DATA           j   COPY public."TipoDocumento" ("IdTipoDocumento", "NombreTipoDocumento", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    222   g      �          0    16911    TipoEstadoCivil 
   TABLE DATA           l   COPY public."TipoEstadoCivil" ("IdTipoEstadoCivil", "NombreEstadoCivil", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    224   �      �          0    16903 
   TipoGenero 
   TABLE DATA           a   COPY public."TipoGenero" ("IdTipoGenero", "NombreTipoGenero", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    223   �      �          0    16950 	   TipoViaje 
   TABLE DATA           k   COPY public."TipoViaje" ("IdTipoViaje", "IdDestino", "NombreTipoViaje", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    227   �      �          0    16927    Usuario 
   TABLE DATA           �   COPY public."Usuario" ("IdUsuario", "IdTipoGenero", "IdTipoDocumento", "IdTipoEstadoCivil", "NombreUsuario", "ApellidoUsuario", "NumeroDocumento", "Activo", "Actualiza") FROM stdin;
    public          postgres    false    226   �      #           2606    16847    Agencia Agencia_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Agencia"
    ADD CONSTRAINT "Agencia_pkey" PRIMARY KEY ("IdAgencia");
 B   ALTER TABLE ONLY public."Agencia" DROP CONSTRAINT "Agencia_pkey";
       public            postgres    false    219            !           2606    16834    Ciudad Ciudad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_pkey" PRIMARY KEY ("IdCiudad");
 @   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_pkey";
       public            postgres    false    218                       2606    16821    Departamento Departamento_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Departamento"
    ADD CONSTRAINT "Departamento_pkey" PRIMARY KEY ("IdDepartamento");
 L   ALTER TABLE ONLY public."Departamento" DROP CONSTRAINT "Departamento_pkey";
       public            postgres    false    217            /           2606    16926    Destino Destino_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Destino"
    ADD CONSTRAINT "Destino_pkey" PRIMARY KEY ("IdDestino");
 B   ALTER TABLE ONLY public."Destino" DROP CONSTRAINT "Destino_pkey";
       public            postgres    false    225            =           2606    17021 "   DetalleFactura DetalleFactura_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_pkey" PRIMARY KEY ("IdDetalleFactura");
 P   ALTER TABLE ONLY public."DetalleFactura" DROP CONSTRAINT "DetalleFactura_pkey";
       public            postgres    false    232            '           2606    16873    Empleado Empleado_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("IdEmpleado");
 D   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT "Empleado_pkey";
       public            postgres    false    221            ;           2606    17015     EstadoFactura EstadoFactura_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."EstadoFactura"
    ADD CONSTRAINT "EstadoFactura_pkey" PRIMARY KEY ("IdEstadoFactura");
 N   ALTER TABLE ONLY public."EstadoFactura" DROP CONSTRAINT "EstadoFactura_pkey";
       public            postgres    false    231            9           2606    16987    Factura Factura_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_pkey" PRIMARY KEY ("IdFactura");
 B   ALTER TABLE ONLY public."Factura" DROP CONSTRAINT "Factura_pkey";
       public            postgres    false    230            7           2606    16981    Moneda Moneda_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Moneda"
    ADD CONSTRAINT "Moneda_pkey" PRIMARY KEY ("IdMoneda");
 @   ALTER TABLE ONLY public."Moneda" DROP CONSTRAINT "Moneda_pkey";
       public            postgres    false    229                       2606    16813    Pais Pais_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Pais"
    ADD CONSTRAINT "Pais_pkey" PRIMARY KEY ("IdPais");
 <   ALTER TABLE ONLY public."Pais" DROP CONSTRAINT "Pais_pkey";
       public            postgres    false    216            ?           2606    17114    Pasabordo Pasabordo_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Pasabordo"
    ADD CONSTRAINT "Pasabordo_pkey" PRIMARY KEY ("IdPasabordo");
 F   ALTER TABLE ONLY public."Pasabordo" DROP CONSTRAINT "Pasabordo_pkey";
       public            postgres    false    233            %           2606    16855    Sede Sede_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_pkey" PRIMARY KEY ("IdSede");
 <   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_pkey";
       public            postgres    false    220            5           2606    16970    TipoClase TipoClase_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."TipoClase"
    ADD CONSTRAINT "TipoClase_pkey" PRIMARY KEY ("IdTipoClase");
 F   ALTER TABLE ONLY public."TipoClase" DROP CONSTRAINT "TipoClase_pkey";
       public            postgres    false    228            )           2606    16902     TipoDocumento TipoDocumento_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public."TipoDocumento"
    ADD CONSTRAINT "TipoDocumento_pkey" PRIMARY KEY ("IdTipoDocumento");
 N   ALTER TABLE ONLY public."TipoDocumento" DROP CONSTRAINT "TipoDocumento_pkey";
       public            postgres    false    222            -           2606    16918 $   TipoEstadoCivil TipoEstadoCivil_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."TipoEstadoCivil"
    ADD CONSTRAINT "TipoEstadoCivil_pkey" PRIMARY KEY ("IdTipoEstadoCivil");
 R   ALTER TABLE ONLY public."TipoEstadoCivil" DROP CONSTRAINT "TipoEstadoCivil_pkey";
       public            postgres    false    224            +           2606    16910    TipoGenero TipoGenero_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."TipoGenero"
    ADD CONSTRAINT "TipoGenero_pkey" PRIMARY KEY ("IdTipoGenero");
 H   ALTER TABLE ONLY public."TipoGenero" DROP CONSTRAINT "TipoGenero_pkey";
       public            postgres    false    223            3           2606    16957    TipoViaje TipoViaje_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."TipoViaje"
    ADD CONSTRAINT "TipoViaje_pkey" PRIMARY KEY ("IdTipoViaje");
 F   ALTER TABLE ONLY public."TipoViaje" DROP CONSTRAINT "TipoViaje_pkey";
       public            postgres    false    227            1           2606    16934    Usuario Usuario_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("IdUsuario");
 B   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_pkey";
       public            postgres    false    226            A           2606    16835 !   Ciudad Ciudad_IdDepartamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ciudad"
    ADD CONSTRAINT "Ciudad_IdDepartamento_fkey" FOREIGN KEY ("IdDepartamento") REFERENCES public."Departamento"("IdDepartamento");
 O   ALTER TABLE ONLY public."Ciudad" DROP CONSTRAINT "Ciudad_IdDepartamento_fkey";
       public          postgres    false    4895    218    217            @           2606    16822 %   Departamento Departamento_IdPais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Departamento"
    ADD CONSTRAINT "Departamento_IdPais_fkey" FOREIGN KEY ("IdPais") REFERENCES public."Pais"("IdPais");
 S   ALTER TABLE ONLY public."Departamento" DROP CONSTRAINT "Departamento_IdPais_fkey";
       public          postgres    false    4893    216    217            N           2606    17027 2   DetalleFactura DetalleFactura_IdEstadoFactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_IdEstadoFactura_fkey" FOREIGN KEY ("IdEstadoFactura") REFERENCES public."EstadoFactura"("IdEstadoFactura");
 `   ALTER TABLE ONLY public."DetalleFactura" DROP CONSTRAINT "DetalleFactura_IdEstadoFactura_fkey";
       public          postgres    false    231    4923    232            O           2606    17022 ,   DetalleFactura DetalleFactura_IdFactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."DetalleFactura"
    ADD CONSTRAINT "DetalleFactura_IdFactura_fkey" FOREIGN KEY ("IdFactura") REFERENCES public."Factura"("IdFactura");
 Z   ALTER TABLE ONLY public."DetalleFactura" DROP CONSTRAINT "DetalleFactura_IdFactura_fkey";
       public          postgres    false    4921    232    230            D           2606    16874    Empleado Empleado_IdSede_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_IdSede_fkey" FOREIGN KEY ("IdSede") REFERENCES public."Sede"("IdSede");
 K   ALTER TABLE ONLY public."Empleado" DROP CONSTRAINT "Empleado_IdSede_fkey";
       public          postgres    false    4901    220    221            J           2606    16998    Factura Factura_IdDestino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdDestino_fkey" FOREIGN KEY ("IdDestino") REFERENCES public."Destino"("IdDestino");
 L   ALTER TABLE ONLY public."Factura" DROP CONSTRAINT "Factura_IdDestino_fkey";
       public          postgres    false    230    4911    225            K           2606    17003    Factura Factura_IdMoneda_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdMoneda_fkey" FOREIGN KEY ("IdMoneda") REFERENCES public."Moneda"("IdMoneda");
 K   ALTER TABLE ONLY public."Factura" DROP CONSTRAINT "Factura_IdMoneda_fkey";
       public          postgres    false    4919    230    229            L           2606    16988    Factura Factura_IdSede_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdSede_fkey" FOREIGN KEY ("IdSede") REFERENCES public."Sede"("IdSede");
 I   ALTER TABLE ONLY public."Factura" DROP CONSTRAINT "Factura_IdSede_fkey";
       public          postgres    false    230    220    4901            M           2606    16993    Factura Factura_IdUsuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Factura"
    ADD CONSTRAINT "Factura_IdUsuario_fkey" FOREIGN KEY ("IdUsuario") REFERENCES public."Usuario"("IdUsuario");
 L   ALTER TABLE ONLY public."Factura" DROP CONSTRAINT "Factura_IdUsuario_fkey";
       public          postgres    false    226    4913    230            P           2606    17115 "   Pasabordo Pasabordo_IdFactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Pasabordo"
    ADD CONSTRAINT "Pasabordo_IdFactura_fkey" FOREIGN KEY ("IdFactura") REFERENCES public."Factura"("IdFactura") ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."Pasabordo" DROP CONSTRAINT "Pasabordo_IdFactura_fkey";
       public          postgres    false    233    230    4921            B           2606    16856    Sede Sede_IdAgencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_IdAgencia_fkey" FOREIGN KEY ("IdAgencia") REFERENCES public."Agencia"("IdAgencia");
 F   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_IdAgencia_fkey";
       public          postgres    false    220    219    4899            C           2606    16861    Sede Sede_IdCiudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Sede"
    ADD CONSTRAINT "Sede_IdCiudad_fkey" FOREIGN KEY ("IdCiudad") REFERENCES public."Ciudad"("IdCiudad");
 E   ALTER TABLE ONLY public."Sede" DROP CONSTRAINT "Sede_IdCiudad_fkey";
       public          postgres    false    4897    218    220            I           2606    16971 "   TipoClase TipoClase_IdDestino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TipoClase"
    ADD CONSTRAINT "TipoClase_IdDestino_fkey" FOREIGN KEY ("IdDestino") REFERENCES public."Destino"("IdDestino");
 P   ALTER TABLE ONLY public."TipoClase" DROP CONSTRAINT "TipoClase_IdDestino_fkey";
       public          postgres    false    225    4911    228            H           2606    16958 "   TipoViaje TipoViaje_IdDestino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."TipoViaje"
    ADD CONSTRAINT "TipoViaje_IdDestino_fkey" FOREIGN KEY ("IdDestino") REFERENCES public."Destino"("IdDestino");
 P   ALTER TABLE ONLY public."TipoViaje" DROP CONSTRAINT "TipoViaje_IdDestino_fkey";
       public          postgres    false    227    4911    225            E           2606    16935 $   Usuario Usuario_IdTipoDocumento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_IdTipoDocumento_fkey" FOREIGN KEY ("IdTipoDocumento") REFERENCES public."TipoDocumento"("IdTipoDocumento");
 R   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_IdTipoDocumento_fkey";
       public          postgres    false    4905    222    226            F           2606    16945 &   Usuario Usuario_IdTipoEstadoCivil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_IdTipoEstadoCivil_fkey" FOREIGN KEY ("IdTipoEstadoCivil") REFERENCES public."TipoEstadoCivil"("IdTipoEstadoCivil");
 T   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_IdTipoEstadoCivil_fkey";
       public          postgres    false    226    224    4909            G           2606    16940 !   Usuario Usuario_IdTipoGenero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_IdTipoGenero_fkey" FOREIGN KEY ("IdTipoGenero") REFERENCES public."TipoGenero"("IdTipoGenero");
 O   ALTER TABLE ONLY public."Usuario" DROP CONSTRAINT "Usuario_IdTipoGenero_fkey";
       public          postgres    false    4907    226    223            �   �   x�}ѹj�0�Z�
��yh-��|B U-��A ��G�.�+Mq��є�%�, �ͩQ!�8侵P�!�Ĕ���?{}�[���/�c�<���z�ׯx
��@A!�����
jȋT��Z�zK =)Ԥ�Hy���pGU�@iGɯt
ޢr�RTyn�6@-0�-���*�@yGٯ|
ޢ*[%��!�d�P6��M�c�.d�*�@eGůr
ޢ�p�A��L��
��6����jZ�Q�h����x
ޢ��eY��q�}      �   G  x����m0�k�Sx�C"�.iҤH�*�
b���(d
/z�" �;�H��u��D}@��xT�|��!�	�\M��8�H�{��������߂�*	T��7U���Z�u%�iĉܩ	O�4&>�M\y����wz�6���a��zsQA*����_��>oϡa�0������`���Z��{�Pӻ���2��a �`����|y�׸�����"�)��@�:��I?܆s�ʹMK��v�>Z�yz��.��5n�]����{���o��V���^3l���˲D��M��&gFZ�b��|��c������������?���      �   ?  x���9n]1Ek�Ux4�I"�%�ti�PS��������5ι��"���5@�:�\U�{��l��+�P,��ho�� �����}]�x��U���j�B���9Iś���<:W~76b�5�6u�Txq����TUaX�j�89�����	��Oo`��e��a �`������ÖBxFΠ>�.��ˏ�{=��ǸH�zzBXd��Y�N��	�eVv&��I:�ĝTt\C��Y����������3�|�2�87B�dp��+��2�T�>���$��=�^�J]O��W��$��������W      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x��лmA�x�
7@���r��Pl�8ٯ}��n�-8Uc�
�d�Q��[NPX�J����T�U�>9���v�k	1� : ��I�h����-�}�
4���*Ԍ�٦s�9�����%w��I@�f��ꕱ�e���?k�Kc/20�I7٥Y {�U'�[���q�^�O�5��7������oM�D	�t���z���ò,���X:      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     