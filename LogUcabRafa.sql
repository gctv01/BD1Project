--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2018-12-13 18:29:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "LogUcab";
--
-- TOC entry 3222 (class 1262 OID 20959)
-- Name: LogUcab; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "LogUcab" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE "LogUcab" OWNER TO postgres;

\connect "LogUcab"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 246 (class 1255 OID 22346)
-- Name: drop_foreign_key(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.drop_foreign_key() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
statements CURSOR FOR
 
SELECT
(SELECT relname FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
 WHERE c.oid=r.conrelid) as nombre_tabla
,conname as nombre_llave,pg_catalog.pg_get_constraintdef(oid, true) as relacion_tipo_llave
FROM pg_catalog.pg_constraint r
WHERE r.conrelid in
(SELECT c.oid FROM pg_catalog.pg_class c
LEFT JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace
WHERE c.relname !~ 'pg_' and c.relkind = 'r'  AND pg_catalog.pg_table_is_visible(c.oid))
 AND r.contype = 'f';
 
BEGIN
FOR smt IN statements LOOP
RAISE NOTICE 'Llave foranea eliminada: %',smt.nombre_llave;
EXECUTE 'ALTER TABLE ' || smt.nombre_tabla || ' DROP CONSTRAINT ' || smt.nombre_llave;
END LOOP;
END;
$$;


ALTER FUNCTION public.drop_foreign_key() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 20960)
-- Name: Accion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Accion" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Accion" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 20966)
-- Name: Aeropuerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Aeropuerto" (
    "COD" integer NOT NULL,
    "CantTerminales" integer NOT NULL,
    "CantPistas" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "FK-SucursalA" integer NOT NULL,
    "FK-LugarAe" integer NOT NULL
);


ALTER TABLE public."Aeropuerto" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 20969)
-- Name: Asistencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Asistencia" (
    "COD" integer NOT NULL,
    "CIEmpleado" integer NOT NULL,
    "CODZona" integer NOT NULL,
    "HoraEntrada" integer NOT NULL,
    "HoraSalida" integer NOT NULL
);


ALTER TABLE public."Asistencia" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 20972)
-- Name: Avion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Avion" (
    "SerialMotor" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "SerialCarroceria" integer NOT NULL,
    "FechaCreacion" date NOT NULL,
    "Longitud" integer NOT NULL,
    "PesoVacio" integer NOT NULL,
    "Envergadura" integer NOT NULL,
    "PesoMax" integer NOT NULL,
    "Altura" integer NOT NULL,
    "AnchoCabina" integer NOT NULL,
    "CapacidadCombustible" integer NOT NULL,
    "CarreraDespegue" integer NOT NULL,
    "DiametroFuselaje" integer NOT NULL,
    "FK-ModeloA" integer,
    "FK-Aeropuerto" integer,
    "Placa" character varying NOT NULL
);


ALTER TABLE public."Avion" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 20978)
-- Name: Barco; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Barco" (
    "Placa" character varying NOT NULL,
    "SerialMotor" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "SerialCarroceria" integer NOT NULL,
    "FechaCreacion" date NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-ModeloB" integer,
    "FK-PuertoB" integer
);


ALTER TABLE public."Barco" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 20984)
-- Name: Cheque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cheque" (
    "COD" integer NOT NULL,
    "Banco" character varying NOT NULL,
    "NroCuenta" integer NOT NULL,
    "Fecha" date NOT NULL,
    "Monto" integer NOT NULL,
    "FK-ClienteM" integer NOT NULL,
    "Descripcion" character varying
);


ALTER TABLE public."Cheque" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 20990)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cliente" (
    "CI" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "Apellido" character varying NOT NULL,
    "FechaNac" date NOT NULL,
    "EstadoCivil" character varying NOT NULL,
    "Trabajo" character varying NOT NULL,
    "FK-LugarC" integer
);


ALTER TABLE public."Cliente" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 20996)
-- Name: Efectivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Efectivo" (
    "COD" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "Moneda" character varying NOT NULL,
    "FK-ClienteE" integer NOT NULL
);


ALTER TABLE public."Efectivo" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 21002)
-- Name: Empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Empleado" (
    "CI" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "Apellido" character varying NOT NULL,
    "FechaNac" date NOT NULL,
    "Correo" character varying NOT NULL,
    "NivelAca" character varying NOT NULL,
    "Profesion" character varying NOT NULL,
    "EstadoCivil" character varying NOT NULL,
    "CantHijos" character varying NOT NULL,
    "CorreoEmpresa" character varying NOT NULL,
    "SalarioAsig" integer NOT NULL,
    "FechaContratado" date,
    "FechaFinal" date,
    "FK-GastosE" integer,
    "FK-SucursalEmp" integer,
    "FK-HorarioEmp" integer
);


ALTER TABLE public."Empleado" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 21008)
-- Name: Envio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Envio" (
    "COD" integer NOT NULL,
    "FechaInicio" date NOT NULL,
    "FechaLlegada" date NOT NULL,
    "Origen" character varying NOT NULL,
    "Destino" character varying NOT NULL,
    "Monto" integer NOT NULL,
    "FK-EmpleadoE" integer NOT NULL,
    "FK-EstatusE" integer NOT NULL
);


ALTER TABLE public."Envio" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 21014)
-- Name: Estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estatus" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Estatus" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 21020)
-- Name: Gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gastos" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "MontoTotal" integer NOT NULL,
    "Pagado" boolean NOT NULL,
    "FK-SucursalG" integer NOT NULL
);


ALTER TABLE public."Gastos" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 21026)
-- Name: Horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Horario" (
    "COD" integer NOT NULL,
    "HorarioInicio" time without time zone NOT NULL,
    "HorarioFinal" time without time zone NOT NULL
);


ALTER TABLE public."Horario" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 21029)
-- Name: L-VIP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."L-VIP" (
    "NroCarnet" integer NOT NULL,
    "FK-ClienteL" integer NOT NULL
);


ALTER TABLE public."L-VIP" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 21032)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lugar" (
    "COD" integer NOT NULL,
    "Tipo" character varying NOT NULL,
    "Nombre" character varying NOT NULL,
    "Fk-LugarL" integer
);


ALTER TABLE public."Lugar" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 21038)
-- Name: Mantenimiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Mantenimiento" (
    "COD" integer NOT NULL,
    "Costo" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "FechaIni" date NOT NULL,
    "FechaFinal" date,
    "FK-GastosM" integer NOT NULL,
    "PlacaA" character varying,
    "PlacaB" character varying,
    "PlacaT" character varying,
    "CODTaller" integer NOT NULL
);


ALTER TABLE public."Mantenimiento" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 21044)
-- Name: Marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marca" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Marca" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 21050)
-- Name: Modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Modelo" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-MarcaM" integer NOT NULL
);


ALTER TABLE public."Modelo" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 21056)
-- Name: Pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pago" (
    "COD" integer NOT NULL,
    "MontoTotal" integer NOT NULL,
    "Fecha" date NOT NULL,
    "PagoDest" boolean NOT NULL,
    "FK-EmpleadoP" integer NOT NULL,
    "FK-EnvioP" integer NOT NULL
);


ALTER TABLE public."Pago" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 21059)
-- Name: Pago-Metodo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pago-Metodo" (
    "COD" integer NOT NULL,
    "CODPago" integer NOT NULL,
    "CODTarjeta" integer,
    "CODCheque" integer,
    "CODTrans" integer,
    "CODEfect" integer
);


ALTER TABLE public."Pago-Metodo" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 21062)
-- Name: Paquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Paquete" (
    "COD" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Volumen" integer NOT NULL,
    "CostoxPesoxVolumen" integer NOT NULL,
    "FK-TipoPaquete" integer NOT NULL,
    "FK-Sucursal" integer,
    "FK-EnvioP" integer NOT NULL,
    "FK-Cliente1" integer NOT NULL,
    "FK-Cliente2" integer NOT NULL
);


ALTER TABLE public."Paquete" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 21065)
-- Name: Puerto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Puerto" (
    "COD" integer NOT NULL,
    "Puestos" integer NOT NULL,
    "Calado" integer NOT NULL,
    "TotalMuelles" integer NOT NULL,
    "Uso" character varying NOT NULL,
    "Longitud" integer NOT NULL,
    "Ancho" integer NOT NULL,
    "FK-LugarP" integer NOT NULL,
    "FK-Sucursal" integer NOT NULL
);


ALTER TABLE public."Puerto" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 21071)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 21077)
-- Name: Rol-Accion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol-Accion" (
    "COD" integer NOT NULL,
    "CODRol" integer NOT NULL,
    "CODAccion" integer NOT NULL
);


ALTER TABLE public."Rol-Accion" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 21080)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ruta" (
    "COD" integer NOT NULL,
    "FK-Sucursal1" integer NOT NULL,
    "FK-Sucursal2" integer NOT NULL,
    "FK-Ruta" integer,
    "Duracion" integer NOT NULL
);


ALTER TABLE public."Ruta" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 21083)
-- Name: Servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Servicio" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-GastosS" integer NOT NULL
);


ALTER TABLE public."Servicio" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 21089)
-- Name: Sucursal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sucursal" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "Capacidad" integer NOT NULL,
    "Correo" character varying NOT NULL,
    "Almacenamiento" integer NOT NULL,
    "FK-LugarS" integer NOT NULL,
    "FK-EmpleadoS" integer NOT NULL
);


ALTER TABLE public."Sucursal" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 21095)
-- Name: Taller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Taller" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "PaginaWeb" character varying NOT NULL,
    "Contacto" character varying NOT NULL,
    "Correo" character varying NOT NULL,
    "FK-LugarT" integer NOT NULL,
    "FK-TelefonoT" integer NOT NULL
);


ALTER TABLE public."Taller" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 21101)
-- Name: Tarjeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tarjeta" (
    "COD" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "Tipo" character varying NOT NULL,
    "FechaVen" date NOT NULL,
    "Marca" character varying NOT NULL,
    "NroCuenta" integer NOT NULL,
    "Banco" character varying NOT NULL,
    "FK-ClienteT" integer NOT NULL
);


ALTER TABLE public."Tarjeta" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 21107)
-- Name: Telefono; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Telefono" (
    "COD" integer NOT NULL,
    "Numero" integer NOT NULL,
    "FK-SucursalT" integer NOT NULL,
    "FK-Empleado" integer NOT NULL,
    "FK-Cliente" integer NOT NULL
);


ALTER TABLE public."Telefono" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 21110)
-- Name: Terrestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Terrestre" (
    "Placa" character varying NOT NULL,
    "SerialMotor" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Descripcion" character varying,
    "SerialCarroceria" integer NOT NULL,
    "FechaCreacion" date NOT NULL,
    "Tipo" character varying NOT NULL,
    "FK-SucursalT" integer,
    "FK-ModeloT" integer
);


ALTER TABLE public."Terrestre" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 21116)
-- Name: TipoPaquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoPaquete" (
    "COD" integer NOT NULL,
    "Clasificacion" character varying NOT NULL
);


ALTER TABLE public."TipoPaquete" OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 21122)
-- Name: Transferencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transferencia" (
    "COD" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "NroCuenta" integer NOT NULL,
    "Banco" character varying NOT NULL,
    "Correo" character varying NOT NULL,
    "FK-ClienteTrans" integer NOT NULL
);


ALTER TABLE public."Transferencia" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 21128)
-- Name: Traslado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Traslado" (
    "COD" integer NOT NULL,
    "CODVeh-Rut" integer NOT NULL,
    "CODEnvio" integer NOT NULL,
    "PrecioVeh" integer NOT NULL,
    "PrecioRuta" integer NOT NULL
);


ALTER TABLE public."Traslado" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 21131)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Nombre" character varying NOT NULL,
    "Contrasena" character varying NOT NULL,
    "FK-RolU" integer NOT NULL,
    "FK-ClienteU" integer,
    "FK-EmpleadoU" integer,
    "COD" integer NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 21137)
-- Name: Veh-Rut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Veh-Rut" (
    "COD" integer NOT NULL,
    "PlacaA" character varying,
    "PlacaB" character varying,
    "PlacaT" character varying,
    "CODRuta" integer NOT NULL,
    "Duracion" integer NOT NULL
);


ALTER TABLE public."Veh-Rut" OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 21143)
-- Name: Zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Zona" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "TamanoDep" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "Dimension" integer NOT NULL,
    "CapacidadEmp" integer NOT NULL,
    "FK-SucursalZ" integer NOT NULL
);


ALTER TABLE public."Zona" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 22335)
-- Name: seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 20960)
-- Dependencies: 196
-- Data for Name: Accion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3180 (class 0 OID 20966)
-- Dependencies: 197
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3181 (class 0 OID 20969)
-- Dependencies: 198
-- Data for Name: Asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3182 (class 0 OID 20972)
-- Dependencies: 199
-- Data for Name: Avion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Avion" ("SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Longitud", "PesoVacio", "Envergadura", "PesoMax", "Altura", "AnchoCabina", "CapacidadCombustible", "CarreraDespegue", "DiametroFuselaje", "FK-ModeloA", "FK-Aeropuerto", "Placa") VALUES (980, 5000, 500000, '', 98765, '2018-11-30', 4000, 499999, 15000, 6000000, 1000000, 10000, 543, 0, 876, NULL, NULL, '456DEF');


--
-- TOC entry 3183 (class 0 OID 20978)
-- Dependencies: 200
-- Data for Name: Barco; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Barco" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Nombre", "FK-ModeloB", "FK-PuertoB") VALUES ('123ABC', 980, 100, 1000, '', 456, '1999-01-01', 'Elena', NULL, NULL);


--
-- TOC entry 3184 (class 0 OID 20984)
-- Dependencies: 201
-- Data for Name: Cheque; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3185 (class 0 OID 20990)
-- Dependencies: 202
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cliente" ("CI", "Nombre", "Apellido", "FechaNac", "EstadoCivil", "Trabajo", "FK-LugarC") VALUES (45678, 'Gladys', 'Moreno', '1990-01-13', 'Soltero', 'Ingeniero en procesos', NULL);
INSERT INTO public."Cliente" ("CI", "Nombre", "Apellido", "FechaNac", "EstadoCivil", "Trabajo", "FK-LugarC") VALUES (25213842, 'Brian', 'Moreno', '1998-10-17', 'Soltero', 'Entrenador Pokemon', NULL);
INSERT INTO public."Cliente" ("CI", "Nombre", "Apellido", "FechaNac", "EstadoCivil", "Trabajo", "FK-LugarC") VALUES (26726082, 'Rafael', 'Jimenez', '1998-11-02', 'Casado', '', NULL);


--
-- TOC entry 3186 (class 0 OID 20996)
-- Dependencies: 203
-- Data for Name: Efectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3187 (class 0 OID 21002)
-- Dependencies: 204
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Empleado" ("CI", "Nombre", "Apellido", "FechaNac", "Correo", "NivelAca", "Profesion", "EstadoCivil", "CantHijos", "CorreoEmpresa", "SalarioAsig", "FechaContratado", "FechaFinal", "FK-GastosE", "FK-SucursalEmp", "FK-HorarioEmp") VALUES (6316457, 'Elena', 'Moreno', '0001-01-01 BC', 'Rita@gmail.com', 'Profesional', 'Abogado', 'Soltero', '2', 'Rita2@LogUCAB.com', 2000, '1967-12-13', '0001-01-01 BC', NULL, NULL, NULL);
INSERT INTO public."Empleado" ("CI", "Nombre", "Apellido", "FechaNac", "Correo", "NivelAca", "Profesion", "EstadoCivil", "CantHijos", "CorreoEmpresa", "SalarioAsig", "FechaContratado", "FechaFinal", "FK-GastosE", "FK-SucursalEmp", "FK-HorarioEmp") VALUES (4823744, 'Gladys', 'Moreno', '0001-01-01 BC', 'Gladista@gmail.com', 'Profesional', 'Ingeniero', 'Soltero', '1', 'Gladys', 3500, '1998-12-13', '0001-01-01 BC', NULL, NULL, NULL);


--
-- TOC entry 3188 (class 0 OID 21008)
-- Dependencies: 205
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3189 (class 0 OID 21014)
-- Dependencies: 206
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3190 (class 0 OID 21020)
-- Dependencies: 207
-- Data for Name: Gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") VALUES (1, 'Luz', 2000, true, 1);
INSERT INTO public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") VALUES (2, 'Agua', 2100, true, 2);
INSERT INTO public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") VALUES (3, 'Gas', 2200, true, 3);
INSERT INTO public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") VALUES (4, 'Salarios', 2300, false, 4);
INSERT INTO public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") VALUES (5, 'Comida', 2400, true, 5);


--
-- TOC entry 3191 (class 0 OID 21026)
-- Dependencies: 208
-- Data for Name: Horario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3192 (class 0 OID 21029)
-- Dependencies: 209
-- Data for Name: L-VIP; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3193 (class 0 OID 21032)
-- Dependencies: 210
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1601, 'Estado', 'Amazonas', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1602, 'Estado', 'Anzoátegui', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1603, 'Estado', 'Apure', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1604, 'Estado', 'Aragua', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1605, 'Estado', 'Barinas', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1606, 'Estado', 'Bolívar', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1607, 'Estado', 'Carabobo', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1608, 'Estado', 'Cojedes', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1609, 'Estado', 'Delta Amacuro', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1610, 'Estado', 'Falcón', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1611, 'Estado', 'Guárico', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1612, 'Estado', 'Lara', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1613, 'Estado', 'Mérida', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1614, 'Estado', 'Miranda', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1615, 'Estado', 'Monagas', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1616, 'Estado', 'Nueva Esparta', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1617, 'Estado', 'Portuguesa', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1618, 'Estado', 'Sucre', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1619, 'Estado', 'Táchira', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1620, 'Estado', 'Trujillo', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1621, 'Estado', 'Vargas', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1622, 'Estado', 'Yaracuy', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1623, 'Estado', 'Zulia', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1624, 'Estado', 'Distrito Capital', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1625, 'Estado', 'Dependencias Federales', NULL);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1, 'Municipio', 'Alto Orinoco', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (2, 'Municipio', 'Atabapo', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (3, 'Municipio', 'Atures', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (4, 'Municipio', 'Autana', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (5, 'Municipio', 'Manapiare', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (6, 'Municipio', 'Maroa', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (7, 'Municipio', 'Río Negro', 1601);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (8, 'Municipio', 'Anaco', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (9, 'Municipio', 'Aragua', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (10, 'Municipio', 'Manuel Ezequiel Bruzual', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (11, 'Municipio', 'Diego Bautista Urbaneja', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (12, 'Municipio', 'Fernando Peñalver', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (13, 'Municipio', 'Francisco Del Carmen Carvajal', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (14, 'Municipio', 'General Sir Arthur McGregor', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (15, 'Municipio', 'Guanta', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (16, 'Municipio', 'Independencia', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (17, 'Municipio', 'José Gregorio Monagas', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (18, 'Municipio', 'Juan Antonio Sotillo', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (19, 'Municipio', 'Juan Manuel Cajigal', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (20, 'Municipio', 'Libertad', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (21, 'Municipio', 'Francisco de Miranda', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (22, 'Municipio', 'Pedro María Freites', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (23, 'Municipio', 'Píritu', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (24, 'Municipio', 'San José de Guanipa', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (25, 'Municipio', 'San Juan de Capistrano', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (26, 'Municipio', 'Santa Ana', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (27, 'Municipio', 'Simón Bolívar', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (28, 'Municipio', 'Simón Rodríguez', 1602);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (29, 'Municipio', 'Achaguas', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (30, 'Municipio', 'Biruaca', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (31, 'Municipio', 'Muñóz', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (32, 'Municipio', 'Páez', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (33, 'Municipio', 'Pedro Camejo', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (34, 'Municipio', 'Rómulo Gallegos', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (35, 'Municipio', 'San Fernando', 1603);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (36, 'Municipio', 'Atanasio Girardot', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (37, 'Municipio', 'Bolívar', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (38, 'Municipio', 'Camatagua', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (39, 'Municipio', 'Francisco Linares Alcántara', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (40, 'Municipio', 'José Ángel Lamas', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (41, 'Municipio', 'José Félix Ribas', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (42, 'Municipio', 'José Rafael Revenga', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (43, 'Municipio', 'Libertador', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (44, 'Municipio', 'Mario Briceño Iragorry', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (45, 'Municipio', 'Ocumare de la Costa de Oro', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (46, 'Municipio', 'San Casimiro', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (47, 'Municipio', 'San Sebastián', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (48, 'Municipio', 'Santiago Mariño', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (49, 'Municipio', 'Santos Michelena', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (50, 'Municipio', 'Sucre', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (51, 'Municipio', 'Tovar', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (52, 'Municipio', 'Urdaneta', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (53, 'Municipio', 'Zamora', 1604);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (54, 'Municipio', 'Alberto Arvelo Torrealba', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (55, 'Municipio', 'Andrés Eloy Blanco', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (56, 'Municipio', 'Antonio José de Sucre', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (57, 'Municipio', 'Arismendi', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (58, 'Municipio', 'Barinas', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (59, 'Municipio', 'Bolívar', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (60, 'Municipio', 'Cruz Paredes', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (61, 'Municipio', 'Ezequiel Zamora', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (62, 'Municipio', 'Obispos', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (63, 'Municipio', 'Pedraza', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (64, 'Municipio', 'Rojas', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (65, 'Municipio', 'Sosa', 1605);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (66, 'Municipio', 'Caroní', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (67, 'Municipio', 'Cedeño', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (68, 'Municipio', 'El Callao', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (69, 'Municipio', 'Gran Sabana', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (70, 'Municipio', 'Heres', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (71, 'Municipio', 'Piar', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (72, 'Municipio', 'Angostura (Raúl Leoni)', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (73, 'Municipio', 'Roscio', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (74, 'Municipio', 'Sifontes', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (75, 'Municipio', 'Sucre', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (76, 'Municipio', 'Padre Pedro Chien', 1606);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (77, 'Municipio', 'Bejuma', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (78, 'Municipio', 'Carlos Arvelo', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (79, 'Municipio', 'Diego Ibarra', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (80, 'Municipio', 'Guacara', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (81, 'Municipio', 'Juan José Mora', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (82, 'Municipio', 'Libertador', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (83, 'Municipio', 'Los Guayos', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (84, 'Municipio', 'Miranda', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (85, 'Municipio', 'Montalbán', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (86, 'Municipio', 'Naguanagua', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (87, 'Municipio', 'Puerto Cabello', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (88, 'Municipio', 'San Diego', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (89, 'Municipio', 'San Joaquín', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (90, 'Municipio', 'Valencia', 1607);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (91, 'Municipio', 'Anzoátegui', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (92, 'Municipio', 'Tinaquillo', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (93, 'Municipio', 'Girardot', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (94, 'Municipio', 'Lima Blanco', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (95, 'Municipio', 'Pao de San Juan Bautista', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (96, 'Municipio', 'Ricaurte', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (97, 'Municipio', 'Rómulo Gallegos', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (98, 'Municipio', 'San Carlos', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (99, 'Municipio', 'Tinaco', 1608);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (100, 'Municipio', 'Antonio Díaz', 1609);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (101, 'Municipio', 'Casacoima', 1609);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (102, 'Municipio', 'Pedernales', 1609);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (103, 'Municipio', 'Tucupita', 1609);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (104, 'Municipio', 'Acosta', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (105, 'Municipio', 'Bolívar', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (106, 'Municipio', 'Buchivacoa', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (107, 'Municipio', 'Cacique Manaure', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (108, 'Municipio', 'Carirubana', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (109, 'Municipio', 'Colina', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (110, 'Municipio', 'Dabajuro', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (111, 'Municipio', 'Democracia', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (112, 'Municipio', 'Falcón', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (113, 'Municipio', 'Federación', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (114, 'Municipio', 'Jacura', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (115, 'Municipio', 'José Laurencio Silva', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (116, 'Municipio', 'Los Taques', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (117, 'Municipio', 'Mauroa', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (118, 'Municipio', 'Miranda', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (119, 'Municipio', 'Monseñor Iturriza', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (120, 'Municipio', 'Palmasola', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (121, 'Municipio', 'Petit', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (122, 'Municipio', 'Píritu', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (123, 'Municipio', 'San Francisco', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (124, 'Municipio', 'Sucre', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (125, 'Municipio', 'Tocópero', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (126, 'Municipio', 'Unión', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (127, 'Municipio', 'Urumaco', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (128, 'Municipio', 'Zamora', 1610);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (129, 'Municipio', 'Camaguán', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (130, 'Municipio', 'Chaguaramas', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (131, 'Municipio', 'El Socorro', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (132, 'Municipio', 'José Félix Ribas', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (133, 'Municipio', 'José Tadeo Monagas', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (134, 'Municipio', 'Juan Germán Roscio', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (135, 'Municipio', 'Julián Mellado', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (136, 'Municipio', 'Las Mercedes', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (137, 'Municipio', 'Leonardo Infante', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (138, 'Municipio', 'Pedro Zaraza', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (139, 'Municipio', 'Ortíz', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (140, 'Municipio', 'San Gerónimo de Guayabal', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (141, 'Municipio', 'San José de Guaribe', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (142, 'Municipio', 'Santa María de Ipire', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (143, 'Municipio', 'Sebastián Francisco de Miranda', 1611);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (144, 'Municipio', 'Andrés Eloy Blanco', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (145, 'Municipio', 'Crespo', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (146, 'Municipio', 'Iribarren', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (147, 'Municipio', 'Jiménez', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (148, 'Municipio', 'Morán', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (149, 'Municipio', 'Palavecino', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (150, 'Municipio', 'Simón Planas', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (151, 'Municipio', 'Torres', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (152, 'Municipio', 'Urdaneta', 1612);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (179, 'Municipio', 'Alberto Adriani', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (180, 'Municipio', 'Andrés Bello', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (181, 'Municipio', 'Antonio Pinto Salinas', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (182, 'Municipio', 'Aricagua', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (183, 'Municipio', 'Arzobispo Chacón', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (184, 'Municipio', 'Campo Elías', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (185, 'Municipio', 'Caracciolo Parra Olmedo', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (186, 'Municipio', 'Cardenal Quintero', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (187, 'Municipio', 'Guaraque', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (188, 'Municipio', 'Julio César Salas', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (189, 'Municipio', 'Justo Briceño', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (190, 'Municipio', 'Libertador', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (191, 'Municipio', 'Miranda', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (192, 'Municipio', 'Obispo Ramos de Lora', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (193, 'Municipio', 'Padre Noguera', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (194, 'Municipio', 'Pueblo Llano', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (195, 'Municipio', 'Rangel', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (196, 'Municipio', 'Rivas Dávila', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (197, 'Municipio', 'Santos Marquina', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (198, 'Municipio', 'Sucre', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (199, 'Municipio', 'Tovar', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (200, 'Municipio', 'Tulio Febres Cordero', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (201, 'Municipio', 'Zea', 1613);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (223, 'Municipio', 'Acevedo', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (224, 'Municipio', 'Andrés Bello', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (225, 'Municipio', 'Baruta', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (226, 'Municipio', 'Brión', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (227, 'Municipio', 'Buroz', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (228, 'Municipio', 'Carrizal', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (229, 'Municipio', 'Chacao', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (230, 'Municipio', 'Cristóbal Rojas', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (231, 'Municipio', 'El Hatillo', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (232, 'Municipio', 'Guaicaipuro', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (233, 'Municipio', 'Independencia', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (234, 'Municipio', 'Lander', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (235, 'Municipio', 'Los Salias', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (236, 'Municipio', 'Páez', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (237, 'Municipio', 'Paz Castillo', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (238, 'Municipio', 'Pedro Gual', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (239, 'Municipio', 'Plaza', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (240, 'Municipio', 'Simón Bolívar', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (241, 'Municipio', 'Sucre', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (242, 'Municipio', 'Urdaneta', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (243, 'Municipio', 'Zamora', 1614);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (258, 'Municipio', 'Acosta', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (259, 'Municipio', 'Aguasay', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (260, 'Municipio', 'Bolívar', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (261, 'Municipio', 'Caripe', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (262, 'Municipio', 'Cedeño', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (263, 'Municipio', 'Ezequiel Zamora', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (264, 'Municipio', 'Libertador', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (265, 'Municipio', 'Maturín', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (266, 'Municipio', 'Piar', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (267, 'Municipio', 'Punceres', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (268, 'Municipio', 'Santa Bárbara', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (269, 'Municipio', 'Sotillo', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (270, 'Municipio', 'Uracoa', 1615);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (271, 'Municipio', 'Antolín del Campo', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (272, 'Municipio', 'Arismendi', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (273, 'Municipio', 'García', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (274, 'Municipio', 'Gómez', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (275, 'Municipio', 'Maneiro', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (276, 'Municipio', 'Marcano', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (277, 'Municipio', 'Mariño', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (278, 'Municipio', 'Península de Macanao', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (279, 'Municipio', 'Tubores', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (280, 'Municipio', 'Villalba', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (281, 'Municipio', 'Díaz', 1616);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (282, 'Municipio', 'Agua Blanca', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (283, 'Municipio', 'Araure', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (284, 'Municipio', 'Esteller', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (285, 'Municipio', 'Guanare', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (286, 'Municipio', 'Guanarito', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (287, 'Municipio', 'Monseñor José Vicente de Unda', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (288, 'Municipio', 'Ospino', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (289, 'Municipio', 'Páez', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (290, 'Municipio', 'Papelón', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (291, 'Municipio', 'San Genaro de Boconoíto', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (292, 'Municipio', 'San Rafael de Onoto', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (293, 'Municipio', 'Santa Rosalía', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (294, 'Municipio', 'Sucre', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (295, 'Municipio', 'Turén', 1617);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (296, 'Municipio', 'Andrés Eloy Blanco', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (297, 'Municipio', 'Andrés Mata', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (298, 'Municipio', 'Arismendi', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (299, 'Municipio', 'Benítez', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (300, 'Municipio', 'Bermúdez', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (301, 'Municipio', 'Bolívar', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (302, 'Municipio', 'Cajigal', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (303, 'Municipio', 'Cruz Salmerón Acosta', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (304, 'Municipio', 'Libertador', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (305, 'Municipio', 'Mariño', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (306, 'Municipio', 'Mejía', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (307, 'Municipio', 'Montes', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (308, 'Municipio', 'Ribero', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (309, 'Municipio', 'Sucre', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (310, 'Municipio', 'Valdéz', 1618);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (341, 'Municipio', 'Andrés Bello', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (342, 'Municipio', 'Antonio Rómulo Costa', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (343, 'Municipio', 'Ayacucho', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (344, 'Municipio', 'Bolívar', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (345, 'Municipio', 'Cárdenas', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (346, 'Municipio', 'Córdoba', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (347, 'Municipio', 'Fernández Feo', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (348, 'Municipio', 'Francisco de Miranda', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (349, 'Municipio', 'García de Hevia', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (350, 'Municipio', 'Guásimos', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (351, 'Municipio', 'Independencia', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (352, 'Municipio', 'Jáuregui', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (353, 'Municipio', 'José María Vargas', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (354, 'Municipio', 'Junín', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (355, 'Municipio', 'Libertad', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (356, 'Municipio', 'Libertador', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (357, 'Municipio', 'Lobatera', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (358, 'Municipio', 'Michelena', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (359, 'Municipio', 'Panamericano', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (360, 'Municipio', 'Pedro María Ureña', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (361, 'Municipio', 'Rafael Urdaneta', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (362, 'Municipio', 'Samuel Darío Maldonado', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (363, 'Municipio', 'San Cristóbal', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (364, 'Municipio', 'Seboruco', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (365, 'Municipio', 'Simón Rodríguez', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (366, 'Municipio', 'Sucre', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (367, 'Municipio', 'Torbes', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (368, 'Municipio', 'Uribante', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (369, 'Municipio', 'San Judas Tadeo', 1619);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (370, 'Municipio', 'Andrés Bello', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (371, 'Municipio', 'Boconó', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (372, 'Municipio', 'Bolívar', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (373, 'Municipio', 'Candelaria', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (374, 'Municipio', 'Carache', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (375, 'Municipio', 'Escuque', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (376, 'Municipio', 'José Felipe Márquez Cañizalez', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (377, 'Municipio', 'Juan Vicente Campos Elías', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (378, 'Municipio', 'La Ceiba', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (379, 'Municipio', 'Miranda', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (380, 'Municipio', 'Monte Carmelo', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (381, 'Municipio', 'Motatán', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (382, 'Municipio', 'Pampán', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (383, 'Municipio', 'Pampanito', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (384, 'Municipio', 'Rafael Rangel', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (385, 'Municipio', 'San Rafael de Carvajal', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (386, 'Municipio', 'Sucre', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (387, 'Municipio', 'Trujillo', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (388, 'Municipio', 'Urdaneta', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (389, 'Municipio', 'Valera', 1620);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (390, 'Municipio', 'Vargas', 1621);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (391, 'Municipio', 'Arístides Bastidas', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (392, 'Municipio', 'Bolívar', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (407, 'Municipio', 'Bruzual', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (408, 'Municipio', 'Cocorote', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (409, 'Municipio', 'Independencia', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (410, 'Municipio', 'José Antonio Páez', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (411, 'Municipio', 'La Trinidad', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (412, 'Municipio', 'Manuel Monge', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (413, 'Municipio', 'Nirgua', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (414, 'Municipio', 'Peña', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (415, 'Municipio', 'San Felipe', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (416, 'Municipio', 'Sucre', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (417, 'Municipio', 'Urachiche', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (418, 'Municipio', 'José Joaquín Veroes', 1622);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (441, 'Municipio', 'Almirante Padilla', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (442, 'Municipio', 'Baralt', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (443, 'Municipio', 'Cabimas', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (444, 'Municipio', 'Catatumbo', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (445, 'Municipio', 'Colón', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (446, 'Municipio', 'Francisco Javier Pulgar', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (447, 'Municipio', 'Páez', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (448, 'Municipio', 'Jesús Enrique Losada', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (449, 'Municipio', 'Jesús María Semprún', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (450, 'Municipio', 'La Cañada de Urdaneta', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (451, 'Municipio', 'Lagunillas', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (452, 'Municipio', 'Machiques de Perijá', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (453, 'Municipio', 'Mara', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (454, 'Municipio', 'Maracaibo', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (455, 'Municipio', 'Miranda', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (456, 'Municipio', 'Rosario de Perijá', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (457, 'Municipio', 'San Francisco', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (458, 'Municipio', 'Santa Rita', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (459, 'Municipio', 'Simón Bolívar', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (460, 'Municipio', 'Sucre', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (461, 'Municipio', 'Valmore Rodríguez', 1623);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (462, 'Municipio', 'Libertador', 1624);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (463, 'Parroquia', 'Alto Orinoco', 1);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (464, 'Parroquia', 'Huachamacare Acanaña', 1);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (465, 'Parroquia', 'Marawaka Toky Shamanaña', 1);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (466, 'Parroquia', 'Mavaka Mavaka', 1);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (467, 'Parroquia', 'Sierra Parima Parimabé', 1);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (468, 'Parroquia', 'Ucata Laja Lisa', 2);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (469, 'Parroquia', 'Yapacana Macuruco', 2);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (470, 'Parroquia', 'Caname Guarinuma', 2);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (471, 'Parroquia', 'Fernando Girón Tovar', 3);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (472, 'Parroquia', 'Luis Alberto Gómez', 3);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (473, 'Parroquia', 'Pahueña Limón de Parhueña', 3);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (474, 'Parroquia', 'Platanillal Platanillal', 3);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (475, 'Parroquia', 'Samariapo', 4);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (476, 'Parroquia', 'Sipapo', 4);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (477, 'Parroquia', 'Munduapo', 4);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (478, 'Parroquia', 'Guayapo', 4);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (479, 'Parroquia', 'Alto Ventuari', 5);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (480, 'Parroquia', 'Medio Ventuari', 5);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (481, 'Parroquia', 'Bajo Ventuari', 5);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (482, 'Parroquia', 'Victorino', 6);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (483, 'Parroquia', 'Comunidad', 6);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (484, 'Parroquia', 'Casiquiare', 7);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (485, 'Parroquia', 'Cocuy', 7);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (486, 'Parroquia', 'San Carlos de Río Negro', 7);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (487, 'Parroquia', 'Solano', 7);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (488, 'Parroquia', 'Anaco', 8);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (489, 'Parroquia', 'San Joaquín', 8);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (490, 'Parroquia', 'Cachipo', 9);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (491, 'Parroquia', 'Aragua de Barcelona', 9);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (492, 'Parroquia', 'Lechería', 11);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (493, 'Parroquia', 'El Morro', 11);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (494, 'Parroquia', 'Puerto Píritu', 12);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (495, 'Parroquia', 'San Miguel', 12);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (496, 'Parroquia', 'Sucre', 12);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (497, 'Parroquia', 'Valle de Guanape', 13);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (498, 'Parroquia', 'Santa Bárbara', 13);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (499, 'Parroquia', 'El Chaparro', 14);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (500, 'Parroquia', 'Tomás Alfaro', 14);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (501, 'Parroquia', 'Calatrava', 14);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (502, 'Parroquia', 'Guanta', 15);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (503, 'Parroquia', 'Chorrerón', 15);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (504, 'Parroquia', 'Mamo', 16);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (505, 'Parroquia', 'Soledad', 16);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (506, 'Parroquia', 'Mapire', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (507, 'Parroquia', 'Piar', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (508, 'Parroquia', 'Santa Clara', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (509, 'Parroquia', 'San Diego de Cabrutica', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (510, 'Parroquia', 'Uverito', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (511, 'Parroquia', 'Zuata', 17);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (512, 'Parroquia', 'Puerto La Cruz', 18);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (513, 'Parroquia', 'Pozuelos', 18);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (514, 'Parroquia', 'Onoto', 19);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (515, 'Parroquia', 'San Pablo', 19);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (516, 'Parroquia', 'San Mateo', 20);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (517, 'Parroquia', 'El Carito', 20);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (518, 'Parroquia', 'Santa Inés', 20);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (519, 'Parroquia', 'La Romereña', 20);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (520, 'Parroquia', 'Atapirire', 21);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (521, 'Parroquia', 'Boca del Pao', 21);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (522, 'Parroquia', 'El Pao', 21);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (523, 'Parroquia', 'Pariaguán', 21);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (524, 'Parroquia', 'Cantaura', 22);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (525, 'Parroquia', 'Libertador', 22);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (526, 'Parroquia', 'Santa Rosa', 22);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (527, 'Parroquia', 'Urica', 22);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (528, 'Parroquia', 'Píritu', 23);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (529, 'Parroquia', 'San Francisco', 23);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (530, 'Parroquia', 'San José de Guanipa', 24);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (531, 'Parroquia', 'Boca de Uchire', 25);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (532, 'Parroquia', 'Boca de Chávez', 25);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (533, 'Parroquia', 'Pueblo Nuevo', 26);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (534, 'Parroquia', 'Santa Ana', 26);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (535, 'Parroquia', 'Bergantín', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (536, 'Parroquia', 'Caigua', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (537, 'Parroquia', 'El Carmen', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (538, 'Parroquia', 'El Pilar', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (539, 'Parroquia', 'Naricual', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (540, 'Parroquia', 'San Crsitóbal', 27);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (541, 'Parroquia', 'Edmundo Barrios', 28);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (542, 'Parroquia', 'Miguel Otero Silva', 28);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (543, 'Parroquia', 'Achaguas', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (544, 'Parroquia', 'Apurito', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (545, 'Parroquia', 'El Yagual', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (546, 'Parroquia', 'Guachara', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (547, 'Parroquia', 'Mucuritas', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (548, 'Parroquia', 'Queseras del medio', 29);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (549, 'Parroquia', 'Biruaca', 30);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (550, 'Parroquia', 'Bruzual', 31);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (551, 'Parroquia', 'Mantecal', 31);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (552, 'Parroquia', 'Quintero', 31);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (553, 'Parroquia', 'Rincón Hondo', 31);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (554, 'Parroquia', 'San Vicente', 31);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (555, 'Parroquia', 'Guasdualito', 32);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (556, 'Parroquia', 'Aramendi', 32);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (557, 'Parroquia', 'El Amparo', 32);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (558, 'Parroquia', 'San Camilo', 32);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (559, 'Parroquia', 'Urdaneta', 32);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (560, 'Parroquia', 'San Juan de Payara', 33);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (561, 'Parroquia', 'Codazzi', 33);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (562, 'Parroquia', 'Cunaviche', 33);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (563, 'Parroquia', 'Elorza', 34);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (564, 'Parroquia', 'La Trinidad', 34);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (565, 'Parroquia', 'San Fernando', 35);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (566, 'Parroquia', 'El Recreo', 35);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (567, 'Parroquia', 'Peñalver', 35);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (568, 'Parroquia', 'San Rafael de Atamaica', 35);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (569, 'Parroquia', 'Pedro José Ovalles', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (570, 'Parroquia', 'Joaquín Crespo', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (571, 'Parroquia', 'José Casanova Godoy', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (572, 'Parroquia', 'Madre María de San José', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (573, 'Parroquia', 'Andrés Eloy Blanco', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (574, 'Parroquia', 'Los Tacarigua', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (575, 'Parroquia', 'Las Delicias', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (576, 'Parroquia', 'Choroní', 36);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (577, 'Parroquia', 'Bolívar', 37);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (578, 'Parroquia', 'Camatagua', 38);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (579, 'Parroquia', 'Carmen de Cura', 38);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (580, 'Parroquia', 'Santa Rita', 39);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (581, 'Parroquia', 'Francisco de Miranda', 39);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (582, 'Parroquia', 'Moseñor Feliciano González', 39);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (583, 'Parroquia', 'Santa Cruz', 40);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (584, 'Parroquia', 'José Félix Ribas', 41);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (585, 'Parroquia', 'Castor Nieves Ríos', 41);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (586, 'Parroquia', 'Las Guacamayas', 41);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (587, 'Parroquia', 'Pao de Zárate', 41);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (588, 'Parroquia', 'Zuata', 41);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (589, 'Parroquia', 'José Rafael Revenga', 42);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (590, 'Parroquia', 'Palo Negro', 43);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (591, 'Parroquia', 'San Martín de Porres', 43);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (592, 'Parroquia', 'El Limón', 44);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (593, 'Parroquia', 'Caña de Azúcar', 44);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (594, 'Parroquia', 'Ocumare de la Costa', 45);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (595, 'Parroquia', 'San Casimiro', 46);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (596, 'Parroquia', 'Güiripa', 46);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (597, 'Parroquia', 'Ollas de Caramacate', 46);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (598, 'Parroquia', 'Valle Morín', 46);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (599, 'Parroquia', 'San Sebastían', 47);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (600, 'Parroquia', 'Turmero', 48);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (601, 'Parroquia', 'Arevalo Aponte', 48);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (602, 'Parroquia', 'Chuao', 48);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (603, 'Parroquia', 'Samán de Güere', 48);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (604, 'Parroquia', 'Alfredo Pacheco Miranda', 48);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (605, 'Parroquia', 'Santos Michelena', 49);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (606, 'Parroquia', 'Tiara', 49);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (607, 'Parroquia', 'Cagua', 50);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (608, 'Parroquia', 'Bella Vista', 50);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (609, 'Parroquia', 'Tovar', 51);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (610, 'Parroquia', 'Urdaneta', 52);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (611, 'Parroquia', 'Las Peñitas', 52);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (612, 'Parroquia', 'San Francisco de Cara', 52);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (613, 'Parroquia', 'Taguay', 52);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (614, 'Parroquia', 'Zamora', 53);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (615, 'Parroquia', 'Magdaleno', 53);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (616, 'Parroquia', 'San Francisco de Asís', 53);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (617, 'Parroquia', 'Valles de Tucutunemo', 53);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (618, 'Parroquia', 'Augusto Mijares', 53);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (619, 'Parroquia', 'Sabaneta', 54);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (620, 'Parroquia', 'Juan Antonio Rodríguez Domínguez', 54);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (621, 'Parroquia', 'El Cantón', 55);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (622, 'Parroquia', 'Santa Cruz de Guacas', 55);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (623, 'Parroquia', 'Puerto Vivas', 55);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (624, 'Parroquia', 'Ticoporo', 56);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (625, 'Parroquia', 'Nicolás Pulido', 56);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (626, 'Parroquia', 'Andrés Bello', 56);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (627, 'Parroquia', 'Arismendi', 57);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (628, 'Parroquia', 'Guadarrama', 57);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (629, 'Parroquia', 'La Unión', 57);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (630, 'Parroquia', 'San Antonio', 57);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (631, 'Parroquia', 'Barinas', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (632, 'Parroquia', 'Alberto Arvelo Larriva', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (633, 'Parroquia', 'San Silvestre', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (634, 'Parroquia', 'Santa Inés', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (635, 'Parroquia', 'Santa Lucía', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (636, 'Parroquia', 'Torumos', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (637, 'Parroquia', 'El Carmen', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (638, 'Parroquia', 'Rómulo Betancourt', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (639, 'Parroquia', 'Corazón de Jesús', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (640, 'Parroquia', 'Ramón Ignacio Méndez', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (641, 'Parroquia', 'Alto Barinas', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (642, 'Parroquia', 'Manuel Palacio Fajardo', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (643, 'Parroquia', 'Juan Antonio Rodríguez Domínguez', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (644, 'Parroquia', 'Dominga Ortiz de Páez', 58);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (645, 'Parroquia', 'Barinitas', 59);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (646, 'Parroquia', 'Altamira de Cáceres', 59);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (647, 'Parroquia', 'Calderas', 59);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (648, 'Parroquia', 'Barrancas', 60);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (649, 'Parroquia', 'El Socorro', 60);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (650, 'Parroquia', 'Mazparrito', 60);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (651, 'Parroquia', 'Santa Bárbara', 61);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (652, 'Parroquia', 'Pedro Briceño Méndez', 61);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (653, 'Parroquia', 'Ramón Ignacio Méndez', 61);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (654, 'Parroquia', 'José Ignacio del Pumar', 61);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (655, 'Parroquia', 'Obispos', 62);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (656, 'Parroquia', 'Guasimitos', 62);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (657, 'Parroquia', 'El Real', 62);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (658, 'Parroquia', 'La Luz', 62);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (659, 'Parroquia', 'Ciudad Bolívia', 63);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (660, 'Parroquia', 'José Ignacio Briceño', 63);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (661, 'Parroquia', 'José Félix Ribas', 63);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (662, 'Parroquia', 'Páez', 63);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (663, 'Parroquia', 'Libertad', 64);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (664, 'Parroquia', 'Dolores', 64);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (665, 'Parroquia', 'Santa Rosa', 64);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (666, 'Parroquia', 'Palacio Fajardo', 64);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (667, 'Parroquia', 'Ciudad de Nutrias', 65);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (668, 'Parroquia', 'El Regalo', 65);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (669, 'Parroquia', 'Puerto Nutrias', 65);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (670, 'Parroquia', 'Santa Catalina', 65);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (671, 'Parroquia', 'Cachamay', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (672, 'Parroquia', 'Chirica', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (673, 'Parroquia', 'Dalla Costa', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (674, 'Parroquia', 'Once de Abril', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (675, 'Parroquia', 'Simón Bolívar', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (676, 'Parroquia', 'Unare', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (677, 'Parroquia', 'Universidad', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (678, 'Parroquia', 'Vista al Sol', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (679, 'Parroquia', 'Pozo Verde', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (680, 'Parroquia', 'Yocoima', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (681, 'Parroquia', '5 de Julio', 66);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (682, 'Parroquia', 'Cedeño', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (683, 'Parroquia', 'Altagracia', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (684, 'Parroquia', 'Ascensión Farreras', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (685, 'Parroquia', 'Guaniamo', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (686, 'Parroquia', 'La Urbana', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (687, 'Parroquia', 'Pijiguaos', 67);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (688, 'Parroquia', 'El Callao', 68);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (689, 'Parroquia', 'Gran Sabana', 69);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (690, 'Parroquia', 'Ikabarú', 69);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (691, 'Parroquia', 'Catedral', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (692, 'Parroquia', 'Zea', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (693, 'Parroquia', 'Orinoco', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (694, 'Parroquia', 'José Antonio Páez', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (695, 'Parroquia', 'Marhuanta', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (696, 'Parroquia', 'Agua Salada', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (697, 'Parroquia', 'Vista Hermosa', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (698, 'Parroquia', 'La Sabanita', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (699, 'Parroquia', 'Panapana', 70);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (700, 'Parroquia', 'Andrés Eloy Blanco', 71);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (701, 'Parroquia', 'Pedro Cova', 71);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (702, 'Parroquia', 'Raúl Leoni', 72);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (703, 'Parroquia', 'Barceloneta', 72);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (704, 'Parroquia', 'Santa Bárbara', 72);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (705, 'Parroquia', 'San Francisco', 72);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (706, 'Parroquia', 'Roscio', 73);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (707, 'Parroquia', 'Salóm', 73);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (708, 'Parroquia', 'Sifontes', 74);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (709, 'Parroquia', 'Dalla Costa', 74);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (710, 'Parroquia', 'San Isidro', 74);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (711, 'Parroquia', 'Sucre', 75);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (712, 'Parroquia', 'Aripao', 75);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (713, 'Parroquia', 'Guarataro', 75);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (714, 'Parroquia', 'Las Majadas', 75);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (715, 'Parroquia', 'Moitaco', 75);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (716, 'Parroquia', 'Padre Pedro Chien', 76);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (717, 'Parroquia', 'Río Grande', 76);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (718, 'Parroquia', 'Bejuma', 77);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (719, 'Parroquia', 'Canoabo', 77);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (720, 'Parroquia', 'Simón Bolívar', 77);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (721, 'Parroquia', 'Güigüe', 78);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (722, 'Parroquia', 'Carabobo', 78);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (723, 'Parroquia', 'Tacarigua', 78);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (724, 'Parroquia', 'Mariara', 79);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (725, 'Parroquia', 'Aguas Calientes', 79);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (726, 'Parroquia', 'Ciudad Alianza', 80);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (727, 'Parroquia', 'Guacara', 80);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (728, 'Parroquia', 'Yagua', 80);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (729, 'Parroquia', 'Morón', 81);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (730, 'Parroquia', 'Yagua', 81);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (731, 'Parroquia', 'Tocuyito', 82);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (732, 'Parroquia', 'Independencia', 82);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (733, 'Parroquia', 'Los Guayos', 83);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (734, 'Parroquia', 'Miranda', 84);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (735, 'Parroquia', 'Montalbán', 85);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (736, 'Parroquia', 'Naguanagua', 86);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (737, 'Parroquia', 'Bartolomé Salóm', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (738, 'Parroquia', 'Democracia', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (739, 'Parroquia', 'Fraternidad', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (740, 'Parroquia', 'Goaigoaza', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (741, 'Parroquia', 'Juan José Flores', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (742, 'Parroquia', 'Unión', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (743, 'Parroquia', 'Borburata', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (744, 'Parroquia', 'Patanemo', 87);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (745, 'Parroquia', 'San Diego', 88);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (746, 'Parroquia', 'San Joaquín', 89);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (747, 'Parroquia', 'Candelaria', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (748, 'Parroquia', 'Catedral', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (749, 'Parroquia', 'El Socorro', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (750, 'Parroquia', 'Miguel Peña', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (751, 'Parroquia', 'Rafael Urdaneta', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (752, 'Parroquia', 'San Blas', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (753, 'Parroquia', 'San José', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (754, 'Parroquia', 'Santa Rosa', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (755, 'Parroquia', 'Negro Primero', 90);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (756, 'Parroquia', 'Cojedes', 91);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (757, 'Parroquia', 'Juan de Mata Suárez', 91);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (758, 'Parroquia', 'Tinaquillo', 92);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (759, 'Parroquia', 'El Baúl', 93);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (760, 'Parroquia', 'Sucre', 93);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (761, 'Parroquia', 'La Aguadita', 94);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (762, 'Parroquia', 'Macapo', 94);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (763, 'Parroquia', 'El Pao', 95);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (764, 'Parroquia', 'El Amparo', 96);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (765, 'Parroquia', 'Libertad de Cojedes', 96);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (766, 'Parroquia', 'Rómulo Gallegos', 97);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (767, 'Parroquia', 'San Carlos de Austria', 98);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (768, 'Parroquia', 'Juan Ángel Bravo', 98);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (769, 'Parroquia', 'Manuel Manrique', 98);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (770, 'Parroquia', 'General en Jefe José Laurencio Silva', 99);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (771, 'Parroquia', 'Curiapo', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (772, 'Parroquia', 'Almirante Luis Brión', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (773, 'Parroquia', 'Francisco Aniceto Lugo', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (774, 'Parroquia', 'Manuel Renaud', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (775, 'Parroquia', 'Padre Barral', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (776, 'Parroquia', 'Santos de Abelgas', 100);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (777, 'Parroquia', 'Imataca', 101);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (778, 'Parroquia', 'Cinco de Julio', 101);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (779, 'Parroquia', 'Juan Bautista Arismendi', 101);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (780, 'Parroquia', 'Manuel Piar', 101);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (781, 'Parroquia', 'Rómulo Gallegos', 101);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (782, 'Parroquia', 'Pedernales', 102);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (783, 'Parroquia', 'Luis Beltrán Prieto Figueroa', 102);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (784, 'Parroquia', 'San José (Delta Amacuro)', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (785, 'Parroquia', 'José Vidal Marcano', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (786, 'Parroquia', 'Juan Millán', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (787, 'Parroquia', 'Leonardo Ruíz Pineda', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (788, 'Parroquia', 'Mariscal Antonio José de Sucre', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (789, 'Parroquia', 'Monseñor Argimiro García', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (790, 'Parroquia', 'San Rafael (Delta Amacuro)', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (791, 'Parroquia', 'Virgen del Valle', 103);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (792, 'Parroquia', 'Clarines', 10);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (793, 'Parroquia', 'Guanape', 10);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (794, 'Parroquia', 'Sabana de Uchire', 10);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (795, 'Parroquia', 'Capadare', 104);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (796, 'Parroquia', 'La Pastora', 104);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (797, 'Parroquia', 'Libertador', 104);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (798, 'Parroquia', 'San Juan de los Cayos', 104);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (799, 'Parroquia', 'Aracua', 105);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (800, 'Parroquia', 'La Peña', 105);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (801, 'Parroquia', 'San Luis', 105);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (802, 'Parroquia', 'Bariro', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (803, 'Parroquia', 'Borojó', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (804, 'Parroquia', 'Capatárida', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (805, 'Parroquia', 'Guajiro', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (806, 'Parroquia', 'Seque', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (807, 'Parroquia', 'Zazárida', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (808, 'Parroquia', 'Valle de Eroa', 106);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (809, 'Parroquia', 'Cacique Manaure', 107);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (810, 'Parroquia', 'Norte', 108);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (811, 'Parroquia', 'Carirubana', 108);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (812, 'Parroquia', 'Santa Ana', 108);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (813, 'Parroquia', 'Urbana Punta Cardón', 108);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (814, 'Parroquia', 'La Vela de Coro', 109);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (815, 'Parroquia', 'Acurigua', 109);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (816, 'Parroquia', 'Guaibacoa', 109);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (817, 'Parroquia', 'Las Calderas', 109);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (818, 'Parroquia', 'Macoruca', 109);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (819, 'Parroquia', 'Dabajuro', 110);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (820, 'Parroquia', 'Agua Clara', 111);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (821, 'Parroquia', 'Avaria', 111);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (822, 'Parroquia', 'Pedregal', 111);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (823, 'Parroquia', 'Piedra Grande', 111);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (824, 'Parroquia', 'Purureche', 111);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (825, 'Parroquia', 'Adaure', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (826, 'Parroquia', 'Adícora', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (827, 'Parroquia', 'Baraived', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (828, 'Parroquia', 'Buena Vista', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (829, 'Parroquia', 'Jadacaquiva', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (830, 'Parroquia', 'El Vínculo', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (831, 'Parroquia', 'El Hato', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (832, 'Parroquia', 'Moruy', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (833, 'Parroquia', 'Pueblo Nuevo', 112);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (834, 'Parroquia', 'Agua Larga', 113);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (835, 'Parroquia', 'El Paují', 113);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (836, 'Parroquia', 'Independencia', 113);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (837, 'Parroquia', 'Mapararí', 113);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (838, 'Parroquia', 'Agua Linda', 114);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (839, 'Parroquia', 'Araurima', 114);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (840, 'Parroquia', 'Jacura', 114);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (841, 'Parroquia', 'Tucacas', 115);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (842, 'Parroquia', 'Boca de Aroa', 115);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (843, 'Parroquia', 'Los Taques', 116);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (844, 'Parroquia', 'Judibana', 116);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (845, 'Parroquia', 'Mene de Mauroa', 117);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (846, 'Parroquia', 'San Félix', 117);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (847, 'Parroquia', 'Casigua', 117);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (848, 'Parroquia', 'Guzmán Guillermo', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (849, 'Parroquia', 'Mitare', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (850, 'Parroquia', 'Río Seco', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (851, 'Parroquia', 'Sabaneta', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (852, 'Parroquia', 'San Antonio', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (853, 'Parroquia', 'San Gabriel', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (854, 'Parroquia', 'Santa Ana', 118);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (855, 'Parroquia', 'Boca del Tocuyo', 119);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (856, 'Parroquia', 'Chichiriviche', 119);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (857, 'Parroquia', 'Tocuyo de la Costa', 119);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (858, 'Parroquia', 'Palmasola', 120);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (859, 'Parroquia', 'Cabure', 121);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (860, 'Parroquia', 'Colina', 121);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (861, 'Parroquia', 'Curimagua', 121);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (862, 'Parroquia', 'San José de la Costa', 122);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (863, 'Parroquia', 'Píritu', 122);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (864, 'Parroquia', 'San Francisco', 123);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (865, 'Parroquia', 'Sucre', 124);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (866, 'Parroquia', 'Pecaya', 124);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (867, 'Parroquia', 'Tocópero', 125);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (868, 'Parroquia', 'El Charal', 126);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (869, 'Parroquia', 'Las Vegas del Tuy', 126);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (870, 'Parroquia', 'Santa Cruz de Bucaral', 126);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (871, 'Parroquia', 'Bruzual', 127);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (872, 'Parroquia', 'Urumaco', 127);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (873, 'Parroquia', 'Puerto Cumarebo', 128);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (874, 'Parroquia', 'La Ciénaga', 128);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (875, 'Parroquia', 'La Soledad', 128);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (876, 'Parroquia', 'Pueblo Cumarebo', 128);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (877, 'Parroquia', 'Zazárida', 128);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (878, 'Parroquia', 'Churuguara', 113);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (879, 'Parroquia', 'Camaguán', 129);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (880, 'Parroquia', 'Puerto Miranda', 129);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (881, 'Parroquia', 'Uverito', 129);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (882, 'Parroquia', 'Chaguaramas', 130);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (883, 'Parroquia', 'El Socorro', 131);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (884, 'Parroquia', 'Tucupido', 132);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (885, 'Parroquia', 'San Rafael de Laya', 132);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (886, 'Parroquia', 'Altagracia de Orituco', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (887, 'Parroquia', 'San Rafael de Orituco', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (888, 'Parroquia', 'San Francisco Javier de Lezama', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (889, 'Parroquia', 'Paso Real de Macaira', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (890, 'Parroquia', 'Carlos Soublette', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (891, 'Parroquia', 'San Francisco de Macaira', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (892, 'Parroquia', 'Libertad de Orituco', 133);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (893, 'Parroquia', 'Cantaclaro', 134);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (894, 'Parroquia', 'San Juan de los Morros', 134);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (895, 'Parroquia', 'Parapara', 134);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (896, 'Parroquia', 'El Sombrero', 135);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (897, 'Parroquia', 'Sosa', 135);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (898, 'Parroquia', 'Las Mercedes', 136);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (899, 'Parroquia', 'Cabruta', 136);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (900, 'Parroquia', 'Santa Rita de Manapire', 136);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (901, 'Parroquia', 'Valle de la Pascua', 137);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (902, 'Parroquia', 'Espino', 137);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (903, 'Parroquia', 'San José de Unare', 138);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (904, 'Parroquia', 'Zaraza', 138);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (905, 'Parroquia', 'San José de Tiznados', 139);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (906, 'Parroquia', 'San Francisco de Tiznados', 139);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (907, 'Parroquia', 'San Lorenzo de Tiznados', 139);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (908, 'Parroquia', 'Ortiz', 139);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (909, 'Parroquia', 'Guayabal', 140);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (910, 'Parroquia', 'Cazorla', 140);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (911, 'Parroquia', 'San José de Guaribe', 141);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (912, 'Parroquia', 'Uveral', 141);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (913, 'Parroquia', 'Santa María de Ipire', 142);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (914, 'Parroquia', 'Altamira', 142);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (915, 'Parroquia', 'El Calvario', 143);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (916, 'Parroquia', 'El Rastro', 143);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (917, 'Parroquia', 'Guardatinajas', 143);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (918, 'Parroquia', 'Capital Urbana Calabozo', 143);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (919, 'Parroquia', 'Quebrada Honda de Guache', 144);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (920, 'Parroquia', 'Pío Tamayo', 144);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (921, 'Parroquia', 'Yacambú', 144);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (922, 'Parroquia', 'Fréitez', 145);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (923, 'Parroquia', 'José María Blanco', 145);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (924, 'Parroquia', 'Catedral', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (925, 'Parroquia', 'Concepción', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (926, 'Parroquia', 'El Cují', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (927, 'Parroquia', 'Juan de Villegas', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (928, 'Parroquia', 'Santa Rosa', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (929, 'Parroquia', 'Tamaca', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (930, 'Parroquia', 'Unión', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (931, 'Parroquia', 'Aguedo Felipe Alvarado', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (932, 'Parroquia', 'Buena Vista', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (933, 'Parroquia', 'Juárez', 146);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (934, 'Parroquia', 'Juan Bautista Rodríguez', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (935, 'Parroquia', 'Cuara', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (936, 'Parroquia', 'Diego de Lozada', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (937, 'Parroquia', 'Paraíso de San José', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (938, 'Parroquia', 'San Miguel', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (939, 'Parroquia', 'Tintorero', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (940, 'Parroquia', 'José Bernardo Dorante', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (941, 'Parroquia', 'Coronel Mariano Peraza ', 147);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (942, 'Parroquia', 'Bolívar', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (943, 'Parroquia', 'Anzoátegui', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (944, 'Parroquia', 'Guarico', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (945, 'Parroquia', 'Hilario Luna y Luna', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (946, 'Parroquia', 'Humocaro Alto', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (947, 'Parroquia', 'Humocaro Bajo', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (948, 'Parroquia', 'La Candelaria', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (949, 'Parroquia', 'Morán', 148);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (950, 'Parroquia', 'Cabudare', 149);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (951, 'Parroquia', 'José Gregorio Bastidas', 149);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (952, 'Parroquia', 'Agua Viva', 149);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (953, 'Parroquia', 'Sarare', 150);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (954, 'Parroquia', 'Buría', 150);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (955, 'Parroquia', 'Gustavo Vegas León', 150);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (956, 'Parroquia', 'Trinidad Samuel', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (957, 'Parroquia', 'Antonio Díaz', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (958, 'Parroquia', 'Camacaro', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (959, 'Parroquia', 'Castañeda', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (960, 'Parroquia', 'Cecilio Zubillaga', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (961, 'Parroquia', 'Chiquinquirá', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (962, 'Parroquia', 'El Blanco', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (963, 'Parroquia', 'Espinoza de los Monteros', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (964, 'Parroquia', 'Lara', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (965, 'Parroquia', 'Las Mercedes', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (966, 'Parroquia', 'Manuel Morillo', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (967, 'Parroquia', 'Montaña Verde', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (968, 'Parroquia', 'Montes de Oca', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (969, 'Parroquia', 'Torres', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (970, 'Parroquia', 'Heriberto Arroyo', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (971, 'Parroquia', 'Reyes Vargas', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (972, 'Parroquia', 'Altagracia', 151);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (973, 'Parroquia', 'Siquisique', 152);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (974, 'Parroquia', 'Moroturo', 152);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (975, 'Parroquia', 'San Miguel', 152);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (976, 'Parroquia', 'Xaguas', 152);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (977, 'Parroquia', 'Presidente Betancourt', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (978, 'Parroquia', 'Presidente Páez', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (979, 'Parroquia', 'Presidente Rómulo Gallegos', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (980, 'Parroquia', 'Gabriel Picón González', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (981, 'Parroquia', 'Héctor Amable Mora', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (982, 'Parroquia', 'José Nucete Sardi', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (983, 'Parroquia', 'Pulido Méndez', 179);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (984, 'Parroquia', 'La Azulita', 180);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (985, 'Parroquia', 'Santa Cruz de Mora', 181);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (986, 'Parroquia', 'Mesa Bolívar', 181);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (987, 'Parroquia', 'Mesa de Las Palmas', 181);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (988, 'Parroquia', 'Aricagua', 182);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (989, 'Parroquia', 'San Antonio', 182);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (990, 'Parroquia', 'Canagua', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (991, 'Parroquia', 'Capurí', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (992, 'Parroquia', 'Chacantá', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (993, 'Parroquia', 'El Molino', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (994, 'Parroquia', 'Guaimaral', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (995, 'Parroquia', 'Mucutuy', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (996, 'Parroquia', 'Mucuchachí', 183);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (997, 'Parroquia', 'Fernández Peña', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (998, 'Parroquia', 'Matriz', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (999, 'Parroquia', 'Montalbán', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1000, 'Parroquia', 'Acequias', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1001, 'Parroquia', 'Jají', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1002, 'Parroquia', 'La Mesa', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1003, 'Parroquia', 'San José del Sur', 184);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1004, 'Parroquia', 'Tucaní', 185);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1005, 'Parroquia', 'Florencio Ramírez', 185);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1006, 'Parroquia', 'Santo Domingo', 186);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1007, 'Parroquia', 'Las Piedras', 186);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1008, 'Parroquia', 'Guaraque', 187);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1009, 'Parroquia', 'Mesa de Quintero', 187);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1010, 'Parroquia', 'Río Negro', 187);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1011, 'Parroquia', 'Arapuey', 188);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1012, 'Parroquia', 'Palmira', 188);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1013, 'Parroquia', 'San Cristóbal de Torondoy', 189);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1014, 'Parroquia', 'Torondoy', 189);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1015, 'Parroquia', 'Antonio Spinetti Dini', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1016, 'Parroquia', 'Arias', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1017, 'Parroquia', 'Caracciolo Parra Pérez', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1018, 'Parroquia', 'Domingo Peña', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1019, 'Parroquia', 'El Llano', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1020, 'Parroquia', 'Gonzalo Picón Febres', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1021, 'Parroquia', 'Jacinto Plaza', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1022, 'Parroquia', 'Juan Rodríguez Suárez', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1023, 'Parroquia', 'Lasso de la Vega', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1024, 'Parroquia', 'Mariano Picón Salas', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1025, 'Parroquia', 'Milla', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1026, 'Parroquia', 'Osuna Rodríguez', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1027, 'Parroquia', 'Sagrario', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1028, 'Parroquia', 'El Morro', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1029, 'Parroquia', 'Los Nevados', 190);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1030, 'Parroquia', 'Andrés Eloy Blanco', 191);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1031, 'Parroquia', 'La Venta', 191);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1032, 'Parroquia', 'Piñango', 191);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1033, 'Parroquia', 'Timotes', 191);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1034, 'Parroquia', 'Eloy Paredes', 192);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1035, 'Parroquia', 'San Rafael de Alcázar', 192);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1036, 'Parroquia', 'Santa Elena de Arenales', 192);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1037, 'Parroquia', 'Santa María de Caparo', 193);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1038, 'Parroquia', 'Pueblo Llano', 194);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1039, 'Parroquia', 'Cacute', 195);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1040, 'Parroquia', 'La Toma', 195);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1041, 'Parroquia', 'Mucuchíes', 195);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1042, 'Parroquia', 'Mucurubá', 195);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1043, 'Parroquia', 'San Rafael', 195);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1044, 'Parroquia', 'Gerónimo Maldonado', 196);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1045, 'Parroquia', 'Bailadores', 196);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1046, 'Parroquia', 'Tabay', 197);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1047, 'Parroquia', 'Chiguará', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1048, 'Parroquia', 'Estánquez', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1049, 'Parroquia', 'Lagunillas', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1050, 'Parroquia', 'La Trampa', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1051, 'Parroquia', 'Pueblo Nuevo del Sur', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1052, 'Parroquia', 'San Juan', 198);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1053, 'Parroquia', 'El Amparo', 199);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1054, 'Parroquia', 'El Llano', 199);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1055, 'Parroquia', 'San Francisco', 199);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1056, 'Parroquia', 'Tovar', 199);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1057, 'Parroquia', 'Independencia', 200);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1058, 'Parroquia', 'María de la Concepción Palacios Blanco', 200);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1059, 'Parroquia', 'Nueva Bolivia', 200);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1060, 'Parroquia', 'Santa Apolonia', 200);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1061, 'Parroquia', 'Caño El Tigre', 201);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1062, 'Parroquia', 'Zea', 201);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1063, 'Parroquia', 'Aragüita', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1064, 'Parroquia', 'Arévalo González', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1065, 'Parroquia', 'Capaya', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1066, 'Parroquia', 'Caucagua', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1067, 'Parroquia', 'Panaquire', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1068, 'Parroquia', 'Ribas', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1069, 'Parroquia', 'El Café', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1070, 'Parroquia', 'Marizapa', 223);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1071, 'Parroquia', 'Cumbo', 224);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1072, 'Parroquia', 'San José de Barlovento', 224);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1073, 'Parroquia', 'El Cafetal', 225);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1074, 'Parroquia', 'Las Minas', 225);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1075, 'Parroquia', 'Nuestra Señora del Rosario', 225);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1076, 'Parroquia', 'Higuerote', 226);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1077, 'Parroquia', 'Curiepe', 226);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1078, 'Parroquia', 'Tacarigua de Brión', 226);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1079, 'Parroquia', 'Mamporal', 227);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1080, 'Parroquia', 'Carrizal', 228);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1081, 'Parroquia', 'Chacao', 229);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1082, 'Parroquia', 'Charallave', 230);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1083, 'Parroquia', 'Las Brisas', 230);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1084, 'Parroquia', 'El Hatillo', 231);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1085, 'Parroquia', 'Altagracia de la Montaña', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1086, 'Parroquia', 'Cecilio Acosta', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1087, 'Parroquia', 'Los Teques', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1088, 'Parroquia', 'El Jarillo', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1089, 'Parroquia', 'San Pedro', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1090, 'Parroquia', 'Tácata', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1091, 'Parroquia', 'Paracotos', 232);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1092, 'Parroquia', 'Cartanal', 233);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1093, 'Parroquia', 'Santa Teresa del Tuy', 233);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1094, 'Parroquia', 'La Democracia', 234);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1095, 'Parroquia', 'Ocumare del Tuy', 234);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1096, 'Parroquia', 'Santa Bárbara', 234);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1097, 'Parroquia', 'San Antonio de los Altos', 235);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1098, 'Parroquia', 'Río Chico', 236);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1099, 'Parroquia', 'El Guapo', 236);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1100, 'Parroquia', 'Tacarigua de la Laguna', 236);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1101, 'Parroquia', 'Paparo', 236);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1102, 'Parroquia', 'San Fernando del Guapo', 236);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1103, 'Parroquia', 'Santa Lucía del Tuy', 237);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1104, 'Parroquia', 'Cúpira', 238);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1105, 'Parroquia', 'Machurucuto', 238);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1106, 'Parroquia', 'Guarenas', 239);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1107, 'Parroquia', 'San Antonio de Yare', 240);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1108, 'Parroquia', 'San Francisco de Yare', 240);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1109, 'Parroquia', 'Leoncio Martínez', 241);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1110, 'Parroquia', 'Petare', 241);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1111, 'Parroquia', 'Caucagüita', 241);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1112, 'Parroquia', 'Filas de Mariche', 241);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1113, 'Parroquia', 'La Dolorita', 241);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1114, 'Parroquia', 'Cúa', 242);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1115, 'Parroquia', 'Nueva Cúa', 242);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1116, 'Parroquia', 'Guatire', 243);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1117, 'Parroquia', 'Bolívar', 243);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1118, 'Parroquia', 'San Antonio de Maturín', 258);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1119, 'Parroquia', 'San Francisco de Maturín', 258);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1120, 'Parroquia', 'Aguasay', 259);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1121, 'Parroquia', 'Caripito', 260);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1122, 'Parroquia', 'El Guácharo', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1123, 'Parroquia', 'La Guanota', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1124, 'Parroquia', 'Sabana de Piedra', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1125, 'Parroquia', 'San Agustín', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1126, 'Parroquia', 'Teresen', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1127, 'Parroquia', 'Caripe', 261);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1128, 'Parroquia', 'Areo', 262);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1129, 'Parroquia', 'Capital Cedeño', 262);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1130, 'Parroquia', 'San Félix de Cantalicio', 262);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1131, 'Parroquia', 'Viento Fresco', 262);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1132, 'Parroquia', 'El Tejero', 263);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1133, 'Parroquia', 'Punta de Mata', 263);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1134, 'Parroquia', 'Chaguaramas', 264);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1135, 'Parroquia', 'Las Alhuacas', 264);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1136, 'Parroquia', 'Tabasca', 264);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1137, 'Parroquia', 'Temblador', 264);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1138, 'Parroquia', 'Alto de los Godos', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1139, 'Parroquia', 'Boquerón', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1140, 'Parroquia', 'Las Cocuizas', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1141, 'Parroquia', 'La Cruz', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1142, 'Parroquia', 'San Simón', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1143, 'Parroquia', 'El Corozo', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1144, 'Parroquia', 'El Furrial', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1145, 'Parroquia', 'Jusepín', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1146, 'Parroquia', 'La Pica', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1147, 'Parroquia', 'San Vicente', 265);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1148, 'Parroquia', 'Aparicio', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1149, 'Parroquia', 'Aragua de Maturín', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1150, 'Parroquia', 'Chaguamal', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1151, 'Parroquia', 'El Pinto', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1152, 'Parroquia', 'Guanaguana', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1153, 'Parroquia', 'La Toscana', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1154, 'Parroquia', 'Taguaya', 266);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1155, 'Parroquia', 'Cachipo', 267);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1156, 'Parroquia', 'Quiriquire', 267);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1157, 'Parroquia', 'Santa Bárbara', 268);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1158, 'Parroquia', 'Barrancas', 269);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1159, 'Parroquia', 'Los Barrancos de Fajardo', 269);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1160, 'Parroquia', 'Uracoa', 270);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1161, 'Parroquia', 'Antolín del Campo', 271);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1162, 'Parroquia', 'Arismendi', 272);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1163, 'Parroquia', 'García', 273);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1164, 'Parroquia', 'Francisco Fajardo', 273);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1165, 'Parroquia', 'Bolívar', 274);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1166, 'Parroquia', 'Guevara', 274);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1167, 'Parroquia', 'Matasiete', 274);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1168, 'Parroquia', 'Santa Ana', 274);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1169, 'Parroquia', 'Sucre', 274);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1170, 'Parroquia', 'Aguirre', 275);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1171, 'Parroquia', 'Maneiro', 275);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1172, 'Parroquia', 'Adrián', 276);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1173, 'Parroquia', 'Juan Griego', 276);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1174, 'Parroquia', 'Yaguaraparo', 276);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1175, 'Parroquia', 'Porlamar', 277);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1176, 'Parroquia', 'San Francisco de Macanao', 278);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1177, 'Parroquia', 'Boca de Río', 278);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1178, 'Parroquia', 'Tubores', 279);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1179, 'Parroquia', 'Los Baleales', 279);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1180, 'Parroquia', 'Vicente Fuentes', 280);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1181, 'Parroquia', 'Villalba', 280);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1182, 'Parroquia', 'San Juan Bautista', 281);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1183, 'Parroquia', 'Zabala', 281);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1184, 'Parroquia', 'Capital Araure', 283);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1185, 'Parroquia', 'Río Acarigua', 283);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1186, 'Parroquia', 'Capital Esteller', 284);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1187, 'Parroquia', 'Uveral', 284);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1188, 'Parroquia', 'Guanare', 285);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1189, 'Parroquia', 'Córdoba', 285);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1190, 'Parroquia', 'San José de la Montaña', 285);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1191, 'Parroquia', 'San Juan de Guanaguanare', 285);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1192, 'Parroquia', 'Virgen de la Coromoto', 285);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1193, 'Parroquia', 'Guanarito', 286);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1194, 'Parroquia', 'Trinidad de la Capilla', 286);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1195, 'Parroquia', 'Divina Pastora', 286);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1196, 'Parroquia', 'Monseñor José Vicente de Unda', 287);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1197, 'Parroquia', 'Peña Blanca', 287);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1198, 'Parroquia', 'Capital Ospino', 288);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1199, 'Parroquia', 'Aparición', 288);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1200, 'Parroquia', 'La Estación', 288);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1201, 'Parroquia', 'Páez', 289);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1202, 'Parroquia', 'Payara', 289);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1203, 'Parroquia', 'Pimpinela', 289);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1204, 'Parroquia', 'Ramón Peraza', 289);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1205, 'Parroquia', 'Papelón', 290);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1206, 'Parroquia', 'Caño Delgadito', 290);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1207, 'Parroquia', 'San Genaro de Boconoito', 291);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1208, 'Parroquia', 'Antolín Tovar', 291);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1209, 'Parroquia', 'San Rafael de Onoto', 292);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1210, 'Parroquia', 'Santa Fe', 292);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1211, 'Parroquia', 'Thermo Morles', 292);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1212, 'Parroquia', 'Santa Rosalía', 293);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1213, 'Parroquia', 'Florida', 293);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1214, 'Parroquia', 'Sucre', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1215, 'Parroquia', 'Concepción', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1216, 'Parroquia', 'San Rafael de Palo Alzado', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1217, 'Parroquia', 'Uvencio Antonio Velásquez', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1218, 'Parroquia', 'San José de Saguaz', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1219, 'Parroquia', 'Villa Rosa', 294);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1220, 'Parroquia', 'Turén', 295);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1221, 'Parroquia', 'Canelones', 295);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1222, 'Parroquia', 'Santa Cruz', 295);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1223, 'Parroquia', 'San Isidro Labrador', 295);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1224, 'Parroquia', 'Mariño', 296);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1225, 'Parroquia', 'Rómulo Gallegos', 296);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1226, 'Parroquia', 'San José de Aerocuar', 297);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1227, 'Parroquia', 'Tavera Acosta', 297);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1228, 'Parroquia', 'Río Caribe', 298);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1229, 'Parroquia', 'Antonio José de Sucre', 298);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1230, 'Parroquia', 'El Morro de Puerto Santo', 298);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1231, 'Parroquia', 'Puerto Santo', 298);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1232, 'Parroquia', 'San Juan de las Galdonas', 298);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1233, 'Parroquia', 'El Pilar', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1234, 'Parroquia', 'El Rincón', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1235, 'Parroquia', 'General Francisco Antonio Váquez', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1236, 'Parroquia', 'Guaraúnos', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1237, 'Parroquia', 'Tunapuicito', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1238, 'Parroquia', 'Unión', 299);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1239, 'Parroquia', 'Santa Catalina', 300);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1240, 'Parroquia', 'Santa Rosa', 300);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1241, 'Parroquia', 'Santa Teresa', 300);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1242, 'Parroquia', 'Bolívar', 300);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1243, 'Parroquia', 'Maracapana', 300);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1244, 'Parroquia', 'Libertad', 302);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1245, 'Parroquia', 'El Paujil', 302);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1246, 'Parroquia', 'Yaguaraparo', 302);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1247, 'Parroquia', 'Cruz Salmerón Acosta', 303);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1248, 'Parroquia', 'Chacopata', 303);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1249, 'Parroquia', 'Manicuare', 303);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1250, 'Parroquia', 'Tunapuy', 304);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1251, 'Parroquia', 'Campo Elías', 304);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1252, 'Parroquia', 'Irapa', 305);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1253, 'Parroquia', 'Campo Claro', 305);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1254, 'Parroquia', 'Maraval', 305);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1255, 'Parroquia', 'San Antonio de Irapa', 305);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1256, 'Parroquia', 'Soro', 305);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1257, 'Parroquia', 'Mejía', 306);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1258, 'Parroquia', 'Cumanacoa', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1259, 'Parroquia', 'Arenas', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1260, 'Parroquia', 'Aricagua', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1261, 'Parroquia', 'Cogollar', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1262, 'Parroquia', 'San Fernando', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1263, 'Parroquia', 'San Lorenzo', 307);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1264, 'Parroquia', 'Villa Frontado (Muelle de Cariaco)', 308);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1265, 'Parroquia', 'Catuaro', 308);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1266, 'Parroquia', 'Rendón', 308);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1267, 'Parroquia', 'San Cruz', 308);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1268, 'Parroquia', 'Santa María', 308);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1269, 'Parroquia', 'Altagracia', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1270, 'Parroquia', 'Santa Inés', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1271, 'Parroquia', 'Valentín Valiente', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1272, 'Parroquia', 'Ayacucho', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1273, 'Parroquia', 'San Juan', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1274, 'Parroquia', 'Raúl Leoni', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1275, 'Parroquia', 'Gran Mariscal', 309);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1276, 'Parroquia', 'Cristóbal Colón', 310);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1277, 'Parroquia', 'Bideau', 310);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1278, 'Parroquia', 'Punta de Piedras', 310);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1279, 'Parroquia', 'Güiria', 310);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1280, 'Parroquia', 'Andrés Bello', 341);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1281, 'Parroquia', 'Antonio Rómulo Costa', 342);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1282, 'Parroquia', 'Ayacucho', 343);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1283, 'Parroquia', 'Rivas Berti', 343);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1284, 'Parroquia', 'San Pedro del Río', 343);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1285, 'Parroquia', 'Bolívar', 344);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1286, 'Parroquia', 'Palotal', 344);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1287, 'Parroquia', 'General Juan Vicente Gómez', 344);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1288, 'Parroquia', 'Isaías Medina Angarita', 344);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1289, 'Parroquia', 'Cárdenas', 345);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1290, 'Parroquia', 'Amenodoro Ángel Lamus', 345);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1291, 'Parroquia', 'La Florida', 345);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1292, 'Parroquia', 'Córdoba', 346);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1293, 'Parroquia', 'Fernández Feo', 347);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1294, 'Parroquia', 'Alberto Adriani', 347);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1295, 'Parroquia', 'Santo Domingo', 347);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1296, 'Parroquia', 'Francisco de Miranda', 348);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1297, 'Parroquia', 'García de Hevia', 349);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1298, 'Parroquia', 'Boca de Grita', 349);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1299, 'Parroquia', 'José Antonio Páez', 349);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1300, 'Parroquia', 'Guásimos', 350);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1301, 'Parroquia', 'Independencia', 351);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1302, 'Parroquia', 'Juan Germán Roscio', 351);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1303, 'Parroquia', 'Román Cárdenas', 351);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1304, 'Parroquia', 'Jáuregui', 352);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1305, 'Parroquia', 'Emilio Constantino Guerrero', 352);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1306, 'Parroquia', 'Monseñor Miguel Antonio Salas', 352);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1307, 'Parroquia', 'José María Vargas', 353);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1308, 'Parroquia', 'Junín', 354);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1309, 'Parroquia', 'La Petrólea', 354);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1310, 'Parroquia', 'Quinimarí', 354);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1311, 'Parroquia', 'Bramón', 354);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1312, 'Parroquia', 'Libertad', 355);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1313, 'Parroquia', 'Cipriano Castro', 355);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1314, 'Parroquia', 'Manuel Felipe Rugeles', 355);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1315, 'Parroquia', 'Libertador', 356);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1316, 'Parroquia', 'Doradas', 356);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1317, 'Parroquia', 'Emeterio Ochoa', 356);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1318, 'Parroquia', 'San Joaquín de Navay', 356);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1319, 'Parroquia', 'Lobatera', 357);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1320, 'Parroquia', 'Constitución', 357);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1321, 'Parroquia', 'Michelena', 358);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1322, 'Parroquia', 'Panamericano', 359);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1323, 'Parroquia', 'La Palmita', 359);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1324, 'Parroquia', 'Pedro María Ureña', 360);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1325, 'Parroquia', 'Nueva Arcadia', 360);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1326, 'Parroquia', 'Delicias', 361);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1327, 'Parroquia', 'Pecaya', 361);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1328, 'Parroquia', 'Samuel Darío Maldonado', 362);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1329, 'Parroquia', 'Boconó', 362);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1330, 'Parroquia', 'Hernández', 362);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1331, 'Parroquia', 'La Concordia', 363);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1332, 'Parroquia', 'San Juan Bautista', 363);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1333, 'Parroquia', 'Pedro María Morantes', 363);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1334, 'Parroquia', 'San Sebastián', 363);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1335, 'Parroquia', 'Dr. Francisco Romero Lobo', 363);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1336, 'Parroquia', 'Seboruco', 364);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1337, 'Parroquia', 'Simón Rodríguez', 365);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1338, 'Parroquia', 'Sucre', 366);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1339, 'Parroquia', 'Eleazar López Contreras', 366);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1340, 'Parroquia', 'San Pablo', 366);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1341, 'Parroquia', 'Torbes', 367);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1342, 'Parroquia', 'Uribante', 368);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1343, 'Parroquia', 'Cárdenas', 368);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1344, 'Parroquia', 'Juan Pablo Peñalosa', 368);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1345, 'Parroquia', 'Potosí', 368);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1346, 'Parroquia', 'San Judas Tadeo', 369);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1347, 'Parroquia', 'Araguaney', 370);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1348, 'Parroquia', 'El Jaguito', 370);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1349, 'Parroquia', 'La Esperanza', 370);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1350, 'Parroquia', 'Santa Isabel', 370);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1351, 'Parroquia', 'Boconó', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1352, 'Parroquia', 'El Carmen', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1353, 'Parroquia', 'Mosquey', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1354, 'Parroquia', 'Ayacucho', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1355, 'Parroquia', 'Burbusay', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1356, 'Parroquia', 'General Ribas', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1357, 'Parroquia', 'Guaramacal', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1358, 'Parroquia', 'Vega de Guaramacal', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1359, 'Parroquia', 'Monseñor Jáuregui', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1360, 'Parroquia', 'Rafael Rangel', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1361, 'Parroquia', 'San Miguel', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1362, 'Parroquia', 'San José', 371);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1363, 'Parroquia', 'Sabana Grande', 372);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1364, 'Parroquia', 'Cheregüé', 372);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1365, 'Parroquia', 'Granados', 372);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1366, 'Parroquia', 'Arnoldo Gabaldón', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1367, 'Parroquia', 'Bolivia', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1368, 'Parroquia', 'Carrillo', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1369, 'Parroquia', 'Cegarra', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1370, 'Parroquia', 'Chejendé', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1371, 'Parroquia', 'Manuel Salvador Ulloa', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1372, 'Parroquia', 'San José', 373);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1373, 'Parroquia', 'Carache', 374);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1374, 'Parroquia', 'La Concepción', 374);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1375, 'Parroquia', 'Cuicas', 374);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1376, 'Parroquia', 'Panamericana', 374);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1377, 'Parroquia', 'Santa Cruz', 374);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1378, 'Parroquia', 'Escuque', 375);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1379, 'Parroquia', 'La Unión', 375);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1380, 'Parroquia', 'Santa Rita', 375);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1381, 'Parroquia', 'Sabana Libre', 375);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1382, 'Parroquia', 'El Socorro', 376);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1383, 'Parroquia', 'Los Caprichos', 376);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1384, 'Parroquia', 'Antonio José de Sucre', 376);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1385, 'Parroquia', 'Campo Elías', 377);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1386, 'Parroquia', 'Arnoldo Gabaldón', 377);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1387, 'Parroquia', 'Santa Apolonia', 378);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1388, 'Parroquia', 'El Progreso', 378);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1389, 'Parroquia', 'La Ceiba', 378);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1390, 'Parroquia', 'Tres de Febrero', 378);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1391, 'Parroquia', 'El Dividive', 379);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1392, 'Parroquia', 'Agua Santa', 379);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1393, 'Parroquia', 'Agua Caliente', 379);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1394, 'Parroquia', 'El Cenizo', 379);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1395, 'Parroquia', 'Valerita', 379);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1396, 'Parroquia', 'Monte Carmelo', 380);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1397, 'Parroquia', 'Buena Vista', 380);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1398, 'Parroquia', 'Santa María del Horcón', 380);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1399, 'Parroquia', 'Motatán', 381);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1400, 'Parroquia', 'El Baño', 381);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1401, 'Parroquia', 'Jalisco', 381);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1402, 'Parroquia', 'Pampán', 382);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1403, 'Parroquia', 'Flor de Patria', 382);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1404, 'Parroquia', 'La Paz', 382);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1405, 'Parroquia', 'Santa Ana', 382);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1406, 'Parroquia', 'Pampanito', 383);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1407, 'Parroquia', 'La Concepción', 383);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1408, 'Parroquia', 'Pampanito II', 383);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1409, 'Parroquia', 'Betijoque', 384);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1410, 'Parroquia', 'José Gregorio Hernández', 384);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1411, 'Parroquia', 'La Pueblita', 384);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1412, 'Parroquia', 'Los Cedros', 384);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1413, 'Parroquia', 'Carvajal', 385);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1414, 'Parroquia', 'Campo Alegre', 385);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1415, 'Parroquia', 'Antonio Nicolás Briceño', 385);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1416, 'Parroquia', 'José Leonardo Suárez', 385);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1417, 'Parroquia', 'Sabana de Mendoza', 386);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1418, 'Parroquia', 'Junín', 386);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1419, 'Parroquia', 'Valmore Rodríguez', 386);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1420, 'Parroquia', 'El Paraíso', 386);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1421, 'Parroquia', 'Andrés Linares', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1422, 'Parroquia', 'Chiquinquirá', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1423, 'Parroquia', 'Cristóbal Mendoza', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1424, 'Parroquia', 'Cruz Carrillo', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1425, 'Parroquia', 'Matriz', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1426, 'Parroquia', 'Monseñor Carrillo', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1427, 'Parroquia', 'Tres Esquinas', 387);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1428, 'Parroquia', 'Cabimbú', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1429, 'Parroquia', 'Jajó', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1430, 'Parroquia', 'La Mesa de Esnujaque', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1431, 'Parroquia', 'Santiago', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1432, 'Parroquia', 'Tuñame', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1433, 'Parroquia', 'La Quebrada', 388);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1434, 'Parroquia', 'Juan Ignacio Montilla', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1435, 'Parroquia', 'La Beatriz', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1436, 'Parroquia', 'La Puerta', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1437, 'Parroquia', 'Mendoza del Valle de Momboy', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1438, 'Parroquia', 'Mercedes Díaz', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1439, 'Parroquia', 'San Luis', 389);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1440, 'Parroquia', 'Caraballeda', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1441, 'Parroquia', 'Carayaca', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1442, 'Parroquia', 'Carlos Soublette', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1443, 'Parroquia', 'Caruao Chuspa', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1444, 'Parroquia', 'Catia La Mar', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1445, 'Parroquia', 'El Junko', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1446, 'Parroquia', 'La Guaira', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1447, 'Parroquia', 'Macuto', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1448, 'Parroquia', 'Maiquetía', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1449, 'Parroquia', 'Naiguatá', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1450, 'Parroquia', 'Urimare', 390);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1451, 'Parroquia', 'Arístides Bastidas', 391);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1452, 'Parroquia', 'Bolívar', 392);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1453, 'Parroquia', 'Chivacoa', 407);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1454, 'Parroquia', 'Campo Elías', 407);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1455, 'Parroquia', 'Cocorote', 408);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1456, 'Parroquia', 'Independencia', 409);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1457, 'Parroquia', 'José Antonio Páez', 410);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1458, 'Parroquia', 'La Trinidad', 411);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1459, 'Parroquia', 'Manuel Monge', 412);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1460, 'Parroquia', 'Salóm', 413);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1461, 'Parroquia', 'Temerla', 413);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1462, 'Parroquia', 'Nirgua', 413);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1463, 'Parroquia', 'San Andrés', 414);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1464, 'Parroquia', 'Yaritagua', 414);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1465, 'Parroquia', 'San Javier', 415);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1466, 'Parroquia', 'Albarico', 415);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1467, 'Parroquia', 'San Felipe', 415);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1468, 'Parroquia', 'Sucre', 416);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1469, 'Parroquia', 'Urachiche', 417);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1470, 'Parroquia', 'El Guayabo', 418);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1471, 'Parroquia', 'Farriar', 418);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1472, 'Parroquia', 'Isla de Toas', 441);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1473, 'Parroquia', 'Monagas', 441);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1474, 'Parroquia', 'San Timoteo', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1475, 'Parroquia', 'General Urdaneta', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1476, 'Parroquia', 'Libertador', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1477, 'Parroquia', 'Marcelino Briceño', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1478, 'Parroquia', 'Pueblo Nuevo', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1479, 'Parroquia', 'Manuel Guanipa Matos', 442);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1480, 'Parroquia', 'Ambrosio', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1481, 'Parroquia', 'Carmen Herrera', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1482, 'Parroquia', 'La Rosa', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1483, 'Parroquia', 'Germán Ríos Linares', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1484, 'Parroquia', 'San Benito', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1485, 'Parroquia', 'Rómulo Betancourt', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1486, 'Parroquia', 'Jorge Hernández', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1487, 'Parroquia', 'Punta Gorda', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1488, 'Parroquia', 'Arístides Calvani', 443);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1489, 'Parroquia', 'Encontrados', 444);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1490, 'Parroquia', 'Udón Pérez', 444);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1491, 'Parroquia', 'Moralito', 445);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1492, 'Parroquia', 'San Carlos del Zulia', 445);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1493, 'Parroquia', 'Santa Cruz del Zulia', 445);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1494, 'Parroquia', 'Santa Bárbara', 445);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1495, 'Parroquia', 'Urribarrí', 445);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1496, 'Parroquia', 'Carlos Quevedo', 446);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1497, 'Parroquia', 'Francisco Javier Pulgar', 446);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1498, 'Parroquia', 'Simón Rodríguez', 446);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1499, 'Parroquia', 'Guamo-Gavilanes', 446);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1500, 'Parroquia', 'La Concepción', 448);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1501, 'Parroquia', 'San José', 448);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1502, 'Parroquia', 'Mariano Parra León', 448);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1503, 'Parroquia', 'José Ramón Yépez', 448);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1504, 'Parroquia', 'Jesús María Semprún', 449);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1505, 'Parroquia', 'Barí', 449);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1506, 'Parroquia', 'Concepción', 450);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1507, 'Parroquia', 'Andrés Bello', 450);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1508, 'Parroquia', 'Chiquinquirá', 450);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1509, 'Parroquia', 'El Carmelo', 450);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1510, 'Parroquia', 'Potreritos', 450);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1511, 'Parroquia', 'Libertad', 451);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1512, 'Parroquia', 'Alonso de Ojeda', 451);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1513, 'Parroquia', 'Venezuela', 451);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1514, 'Parroquia', 'Eleazar López Contreras', 451);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1515, 'Parroquia', 'Campo Lara', 451);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1516, 'Parroquia', 'Bartolomé de las Casas', 452);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1517, 'Parroquia', 'Libertad', 452);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1518, 'Parroquia', 'Río Negro', 452);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1519, 'Parroquia', 'San José de Perijá', 452);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1520, 'Parroquia', 'San Rafael', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1521, 'Parroquia', 'La Sierrita', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1522, 'Parroquia', 'Las Parcelas', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1523, 'Parroquia', 'Luis de Vicente', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1524, 'Parroquia', 'Monseñor Marcos Sergio Godoy', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1525, 'Parroquia', 'Ricaurte', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1526, 'Parroquia', 'Tamare', 453);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1527, 'Parroquia', 'Antonio Borjas Romero', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1528, 'Parroquia', 'Bolívar', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1529, 'Parroquia', 'Cacique Mara', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1530, 'Parroquia', 'Carracciolo Parra Pérez', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1531, 'Parroquia', 'Cecilio Acosta', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1532, 'Parroquia', 'Cristo de Aranza', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1533, 'Parroquia', 'Coquivacoa', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1534, 'Parroquia', 'Chiquinquirá', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1535, 'Parroquia', 'Francisco Eugenio Bustamante', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1536, 'Parroquia', 'Idelfonzo Vásquez', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1537, 'Parroquia', 'Juana de Ávila', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1538, 'Parroquia', 'Luis Hurtado Higuera', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1539, 'Parroquia', 'Manuel Dagnino', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1540, 'Parroquia', 'Olegario Villalobos', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1541, 'Parroquia', 'Raúl Leoni', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1542, 'Parroquia', 'Santa Lucía', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1543, 'Parroquia', 'Venancio Pulgar', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1544, 'Parroquia', 'San Isidro', 454);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1545, 'Parroquia', 'Altagracia', 455);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1546, 'Parroquia', 'Faría', 455);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1547, 'Parroquia', 'Ana María Campos', 455);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1548, 'Parroquia', 'San Antonio', 455);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1549, 'Parroquia', 'San José', 455);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1550, 'Parroquia', 'Donaldo García', 456);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1551, 'Parroquia', 'El Rosario', 456);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1552, 'Parroquia', 'Sixto Zambrano', 456);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1553, 'Parroquia', 'San Francisco', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1554, 'Parroquia', 'El Bajo', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1555, 'Parroquia', 'Domitila Flores', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1556, 'Parroquia', 'Francisco Ochoa', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1557, 'Parroquia', 'Los Cortijos', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1558, 'Parroquia', 'Marcial Hernández', 457);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1559, 'Parroquia', 'Santa Rita', 458);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1560, 'Parroquia', 'El Mene', 458);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1561, 'Parroquia', 'Pedro Lucas Urribarrí', 458);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1562, 'Parroquia', 'José Cenobio Urribarrí', 458);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1563, 'Parroquia', 'Rafael Maria Baralt', 459);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1564, 'Parroquia', 'Manuel Manrique', 459);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1565, 'Parroquia', 'Rafael Urdaneta', 459);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1566, 'Parroquia', 'Bobures', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1567, 'Parroquia', 'Gibraltar', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1568, 'Parroquia', 'Heras', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1569, 'Parroquia', 'Monseñor Arturo Álvarez', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1570, 'Parroquia', 'Rómulo Gallegos', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1571, 'Parroquia', 'El Batey', 460);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1572, 'Parroquia', 'Rafael Urdaneta', 461);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1573, 'Parroquia', 'La Victoria', 461);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1574, 'Parroquia', 'Raúl Cuenca', 461);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1575, 'Parroquia', 'Sinamaica', 447);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1576, 'Parroquia', 'Alta Guajira', 447);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1577, 'Parroquia', 'Elías Sánchez Rubio', 447);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1578, 'Parroquia', 'Guajira', 447);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1579, 'Parroquia', 'Altagracia', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1580, 'Parroquia', 'Antímano', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1581, 'Parroquia', 'Caricuao', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1582, 'Parroquia', 'Catedral', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1583, 'Parroquia', 'Coche', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1584, 'Parroquia', 'El Junquito', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1585, 'Parroquia', 'El Paraíso', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1586, 'Parroquia', 'El Recreo', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1587, 'Parroquia', 'El Valle', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1588, 'Parroquia', 'La Candelaria', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1589, 'Parroquia', 'La Pastora', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1590, 'Parroquia', 'La Vega', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1591, 'Parroquia', 'Macarao', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1592, 'Parroquia', 'San Agustín', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1593, 'Parroquia', 'San Bernardino', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1594, 'Parroquia', 'San José', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1595, 'Parroquia', 'San Juan', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1596, 'Parroquia', 'San Pedro', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1597, 'Parroquia', 'Santa Rosalía', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1598, 'Parroquia', 'Santa Teresa', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1599, 'Parroquia', 'Sucre (Catia)', 462);
INSERT INTO public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") VALUES (1600, 'Parroquia', '23 de enero', 462);


--
-- TOC entry 3194 (class 0 OID 21038)
-- Dependencies: 211
-- Data for Name: Mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3195 (class 0 OID 21044)
-- Dependencies: 212
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Marca" ("COD", "Nombre") VALUES (1, 'Isuzu');
INSERT INTO public."Marca" ("COD", "Nombre") VALUES (2, 'Mazda');
INSERT INTO public."Marca" ("COD", "Nombre") VALUES (3, 'Lexus');
INSERT INTO public."Marca" ("COD", "Nombre") VALUES (4, 'Nissan');
INSERT INTO public."Marca" ("COD", "Nombre") VALUES (5, 'Chrysler');


--
-- TOC entry 3196 (class 0 OID 21050)
-- Dependencies: 213
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Modelo" ("COD", "Nombre", "FK-MarcaM") VALUES (1, 'Panamera', 1);
INSERT INTO public."Modelo" ("COD", "Nombre", "FK-MarcaM") VALUES (2, '350Z', 2);
INSERT INTO public."Modelo" ("COD", "Nombre", "FK-MarcaM") VALUES (3, 'Sienna', 3);
INSERT INTO public."Modelo" ("COD", "Nombre", "FK-MarcaM") VALUES (4, 'Civic Si', 4);
INSERT INTO public."Modelo" ("COD", "Nombre", "FK-MarcaM") VALUES (5, 'Sephia', 5);


--
-- TOC entry 3197 (class 0 OID 21056)
-- Dependencies: 214
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3198 (class 0 OID 21059)
-- Dependencies: 215
-- Data for Name: Pago-Metodo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3199 (class 0 OID 21062)
-- Dependencies: 216
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3200 (class 0 OID 21065)
-- Dependencies: 217
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3201 (class 0 OID 21071)
-- Dependencies: 218
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Rol" ("COD", "Nombre") VALUES (1, 'Administrador');
INSERT INTO public."Rol" ("COD", "Nombre") VALUES (10, 'Cliente');


--
-- TOC entry 3202 (class 0 OID 21077)
-- Dependencies: 219
-- Data for Name: Rol-Accion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3203 (class 0 OID 21080)
-- Dependencies: 220
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ruta" ("COD", "FK-Sucursal1", "FK-Sucursal2", "FK-Ruta", "Duracion") VALUES (1, 1, 2, NULL, 1);


--
-- TOC entry 3204 (class 0 OID 21083)
-- Dependencies: 221
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3205 (class 0 OID 21089)
-- Dependencies: 222
-- Data for Name: Sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (2, 'Photolist', 510, 'mshawel1@answers.com', 201, 2, 2501000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (3, 'Realcube', 520, 'tabramowitch2@zdnet.com', 202, 3, 2502000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (4, 'Riffwire', 530, 'rbrader3@soup.io', 203, 4, 2503000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (5, 'Meetz', 540, 'rlanceter4@weibo.com', 204, 5, 2504000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (6, 'Zoombeat', 550, 'opalfrey5@acquirethisname.com', 205, 6, 2505000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (7, 'Dynabox', 560, 'zwimlett6@vimeo.com', 206, 7, 2506000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (8, 'Zoomdog', 570, 'edibble7@msu.edu', 207, 8, 2507000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (9, 'Shuffledrive', 580, 'acourage8@yandex.ru', 208, 9, 2508000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (10, 'Jabbercube', 590, 'raprahamian9@businessinsider.com', 209, 10, 2509000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (11, 'Jabbercube', 600, 'prendlea@redcross.org', 210, 11, 2510000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (12, 'Jaxnation', 610, 'cshoorbrookeb@artisteer.com', 211, 12, 2511000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (13, 'Trupe', 620, 'eatkynsc@dion.ne.jp', 212, 13, 2512000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (14, 'Eamia', 630, 'gworged@lulu.com', 213, 14, 2513000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (15, 'Skibox', 640, 'schoulertone@nasa.gov', 214, 15, 2514000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (16, 'Oyoba', 650, 'esandyfirthf@devhub.com', 215, 16, 2515000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (17, 'Jaloo', 660, 'njahnigg@parallels.com', 216, 17, 2516000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (18, 'Bubblebox', 670, 'cphiloth@state.gov', 217, 18, 2517000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (19, 'Innojam', 680, 'mdutsoni@princeton.edu', 218, 19, 2518000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (20, 'Photofeed', 690, 'mcurleyj@e-recht24.de', 219, 20, 2519000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (21, 'Skalith', 700, 'dlamblotk@japanpost.jp', 220, 21, 2520000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (22, 'Babblestorm', 710, 'hscholerl@reuters.com', 221, 22, 2521000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (23, 'Plambee', 720, 'ibaintonm@oakley.com', 222, 23, 2522000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (24, 'Devbug', 730, 'aanthonn@baidu.com', 223, 24, 2523000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (25, 'Blogtag', 740, 'hgreenroado@canalblog.com', 224, 25, 2524000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (26, 'Vinder', 750, 'askacelp@devhub.com', 225, 26, 2525000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (27, 'Blogtag', 760, 'mbendigq@dropbox.com', 226, 27, 2526000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (28, 'Jaxbean', 770, 'byouingsr@umich.edu', 227, 28, 2527000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (29, 'Skalith', 780, 'pmcivers@bloglovin.com', 228, 29, 2528000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (30, 'Edgewire', 790, 'akuhndelt@bloglines.com', 229, 30, 2529000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (31, 'Innotype', 800, 'rcrossfieldu@ezinearticles.com', 230, 31, 2530000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (32, 'Zoozzy', 509, 'bspellingv@salon.com', 231, 32, 2531000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (33, 'Twitterlist', 519, 'gbarenskyw@redcross.org', 232, 33, 2532000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (34, 'Zazio', 529, 'phamsonx@dot.gov', 233, 34, 2533000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (35, 'Yakidoo', 539, 'ktregeay@reverbnation.com', 234, 35, 2534000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (36, 'Zooveo', 549, 'jhanksz@vistaprint.com', 235, 36, 2535000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (37, 'Fivespan', 559, 'cbosward10@nytimes.com', 236, 37, 2536000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (38, 'Talane', 569, 'nlingard11@51.la', 237, 38, 2537000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (39, 'Oyoyo', 579, 'geacott12@gmpg.org', 238, 39, 2538000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (40, 'Trilith', 589, 'cinkpen13@4shared.com', 239, 40, 2539000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (41, 'Brightdog', 599, 'snoirel14@slashdot.org', 240, 41, 2540000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (42, 'Myworks', 609, 'csherburn15@cisco.com', 241, 42, 2541000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (43, 'Kamba', 619, 'vhubback16@studiopress.com', 242, 43, 2542000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (44, 'Dabfeed', 629, 'hbrodie17@usatoday.com', 243, 44, 2543000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (45, 'Jabberstorm', 639, 'rpagin18@opera.com', 244, 45, 2544000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (46, 'Youbridge', 649, 'wchamney19@fotki.com', 245, 46, 2545000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (47, 'Fivespan', 659, 'edupree1a@deviantart.com', 246, 47, 2546000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (48, 'Skyba', 669, 'acayser1b@gov.uk', 247, 48, 2547000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (49, 'Mycat', 679, 'slesurf1c@imgur.com', 248, 49, 2548000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (50, 'Devbug', 689, 'mnelles1d@fda.gov', 249, 50, 2549000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (51, 'Roomm', 699, 'ftropman1e@deviantart.com', 250, 51, 2550000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (52, 'Oodoo', 709, 'bmurfin1f@ehow.com', 251, 52, 2551000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (53, 'Rhynyx', 719, 'jsheerman1g@dailymail.co.uk', 252, 53, 2552000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (54, 'Trilia', 729, 'famps1h@latimes.com', 253, 54, 2553000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (55, 'Mudo', 739, 'csommerton1i@diigo.com', 254, 55, 2554000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (56, 'Edgepulse', 749, 'lprendiville1j@mac.com', 255, 56, 2555000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (57, 'Tazzy', 759, 'adowne1k@1688.com', 256, 57, 2556000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (58, 'Thoughtbeat', 769, 'lmilne1l@ifeng.com', 257, 58, 2557000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (59, 'Zoomlounge', 779, 'mcrat1m@huffingtonpost.com', 258, 59, 2558000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (60, 'Skiptube', 789, 'spretley1n@marketwatch.com', 259, 60, 2559000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (61, 'Minyx', 799, 'mderrington1o@forbes.com', 260, 61, 2560000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (62, 'Voomm', 508, 'krumbelow1p@fotki.com', 261, 62, 2561000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (63, 'Omba', 518, 'abootton1q@usnews.com', 262, 63, 2562000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (64, 'Voolith', 528, 'bfylan1r@nyu.edu', 263, 64, 2563000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (65, 'Plajo', 538, 'mkenner1s@t.co', 264, 65, 2564000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (66, 'Dabvine', 548, 'omancer1t@blogspot.com', 265, 66, 2565000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (67, 'Viva', 558, 'imerring1u@studiopress.com', 266, 67, 2566000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (68, 'Mita', 568, 'cvidineev1v@wiley.com', 267, 68, 2567000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (69, 'Brightdog', 578, 'lhalsall1w@paginegialle.it', 268, 69, 2568000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (70, 'Thoughtstorm', 588, 'aoconor1x@shop-pro.jp', 269, 70, 2569000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (71, 'Jetpulse', 598, 'dswiers1y@huffingtonpost.com', 270, 71, 2570000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (72, 'Blogpad', 608, 'kjustham1z@whitehouse.gov', 271, 72, 2571000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (73, 'Oyondu', 618, 'sswaysland20@histats.com', 272, 73, 2572000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (74, 'Skyble', 628, 'gleverson21@usgs.gov', 273, 74, 2573000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (75, 'Feedfire', 638, 'menga22@digg.com', 274, 75, 2574000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (76, 'Photobug', 648, 'cisselee23@disqus.com', 275, 76, 2575000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (77, 'LiveZ', 658, 'clammerts24@berkeley.edu', 276, 77, 2576000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (78, 'Tavu', 668, 'lmccrachen25@who.int', 277, 78, 2577000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (79, 'Jetpulse', 678, 'aneads26@reverbnation.com', 278, 79, 2578000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (80, 'Twitterbeat', 688, 'dsweeten27@goo.ne.jp', 279, 80, 2579000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (81, 'Divanoodle', 698, 'jalf28@yellowpages.com', 280, 81, 2580000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (82, 'Digitube', 708, 'astearns29@chicagotribune.com', 281, 82, 2581000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (83, 'Youfeed', 718, 'rtoolin2a@columbia.edu', 282, 83, 2582000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (84, 'Trunyx', 728, 'mturmell2b@ning.com', 283, 84, 2583000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (85, 'Trupe', 738, 'bcottell2c@ask.com', 284, 85, 2584000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (86, 'Jabberbean', 748, 'cstibbs2d@elegantthemes.com', 285, 86, 2585000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (87, 'Yozio', 758, 'jforsdicke2e@ox.ac.uk', 286, 87, 2586000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (88, 'Kayveo', 768, 'hjotcham2f@techcrunch.com', 287, 88, 2587000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (89, 'Ooba', 778, 'khamlyn2g@reddit.com', 288, 89, 2588000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (90, 'Babbleblab', 788, 'eknivett2h@irs.gov', 289, 90, 2589000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (91, 'Yodoo', 798, 'amccarly2i@cargocollective.com', 290, 91, 2590000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (92, 'Wikizz', 507, 'shuffa2j@nsw.gov.au', 291, 92, 2591000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (93, 'Avamba', 517, 'hsheasby2k@netscape.com', 292, 93, 2592000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (94, 'Kare', 527, 'wjaquiss2l@google.ru', 293, 94, 2593000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (95, 'Vipe', 537, 'fkillgus2m@ifeng.com', 294, 95, 2594000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (96, 'Vinder', 547, 'bkarran2n@linkedin.com', 295, 96, 2595000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (97, 'Babbleopia', 557, 'vtitcom2o@slashdot.org', 296, 97, 2596000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (98, 'Dynava', 567, 'lfritter2p@xrea.com', 297, 98, 2597000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (99, 'Dabtype', 577, 'tfullalove2q@lulu.com', 298, 99, 2598000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (100, 'Chatterbridge', 587, 'jkliemke2r@cnbc.com', 299, 100, 2599000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (101, 'Digitube', 597, 'aansett2s@netvibes.com', 300, 101, 2600000);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (102, 'Zooveo', 607, 'icorlett2t@delicious.com', 301, 102, 2500999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (103, 'Kamba', 617, 'aaizikovitz2u@mtv.com', 302, 103, 2501999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (104, 'Vinder', 627, 'amellor2v@friendfeed.com', 303, 104, 2502999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (105, 'Divape', 637, 'jemanueli2w@house.gov', 304, 105, 2503999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (106, 'Tagchat', 647, 'ecarrivick2x@parallels.com', 305, 106, 2504999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (107, 'Shufflebeat', 657, 'khawsby2y@youtu.be', 306, 107, 2505999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (108, 'Camimbo', 667, 'gimlen2z@prlog.org', 307, 108, 2506999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (109, 'Divavu', 677, 'zdanniel30@yandex.ru', 308, 109, 2507999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (110, 'Latz', 687, 'nbarribal31@printfriendly.com', 309, 110, 2508999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (111, 'Realcube', 697, 'tpollok32@eepurl.com', 310, 111, 2509999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (112, 'Realmix', 707, 'rsirman33@netvibes.com', 311, 112, 2510999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (113, 'Avamm', 717, 'ggasperi34@usnews.com', 312, 113, 2511999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (114, 'Buzzshare', 727, 'jtollerfield35@oaic.gov.au', 313, 114, 2512999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (115, 'Chatterbridge', 737, 'shuban36@simplemachines.org', 314, 115, 2513999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (116, 'Eamia', 747, 'mhemmingway37@php.net', 315, 116, 2514999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (117, 'Eimbee', 757, 'hsnowdon38@trellian.com', 316, 117, 2515999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (118, 'Lazzy', 767, 'mhawkridge39@cloudflare.com', 317, 118, 2516999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (119, 'Ntag', 777, 'kgencke3a@list-manage.com', 318, 119, 2517999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (120, 'Gabspot', 787, 'dborman3b@baidu.com', 319, 120, 2518999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (121, 'Oloo', 797, 'rgodfray3c@weather.com', 320, 121, 2519999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (122, 'Meembee', 506, 'tpell3d@icio.us', 321, 122, 2520999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (123, 'Dabshots', 516, 'rhutchens3e@nyu.edu', 322, 123, 2521999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (124, 'Quinu', 526, 'aabrahamson3f@baidu.com', 323, 124, 2522999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (125, 'Gabtune', 536, 'codlin3g@1und1.de', 324, 125, 2523999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (126, 'Skivee', 546, 'ctrouel3h@auda.org.au', 325, 126, 2524999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (127, 'Quaxo', 556, 'vscholer3i@baidu.com', 326, 127, 2525999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (128, 'Voomm', 566, 'mgoozee3j@qq.com', 327, 128, 2526999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (129, 'Wordify', 576, 'czaniolini3k@ocn.ne.jp', 328, 129, 2527999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (130, 'Jaxspan', 586, 'cdallyn3l@phpbb.com', 329, 130, 2528999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (131, 'Topiczoom', 596, 'gmelendez3m@freewebs.com', 330, 131, 2529999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (132, 'Zava', 606, 'hvogele3n@ovh.net', 331, 132, 2530999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (133, 'Voonix', 616, 'gpozzo3o@state.tx.us', 332, 133, 2531999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (134, 'Thoughtbridge', 626, 'sblaxeland3p@freewebs.com', 333, 134, 2532999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (135, 'JumpXS', 636, 'onottle3q@moonfruit.com', 334, 135, 2533999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (136, 'Yodoo', 646, 'rnickoll3r@bizjournals.com', 335, 136, 2534999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (137, 'Demimbu', 656, 'gcove3s@buzzfeed.com', 336, 137, 2535999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (138, 'Demivee', 666, 'igrigorkin3t@plala.or.jp', 337, 138, 2536999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (139, 'Brainlounge', 676, 'smarielle3u@indiegogo.com', 338, 139, 2537999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (140, 'Brainbox', 686, 'hmacconnal3v@npr.org', 339, 140, 2538999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (141, 'Eayo', 696, 'ctrustram3w@ox.ac.uk', 340, 141, 2539999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (142, 'Meevee', 706, 'rickovici3x@linkedin.com', 341, 142, 2540999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (143, 'Dabjam', 716, 'drutter3y@howstuffworks.com', 342, 143, 2541999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (144, 'Zoombeat', 726, 'gshakesby3z@yellowbook.com', 343, 144, 2542999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (145, 'Fivechat', 736, 'pfratson40@networkadvertising.org', 344, 145, 2543999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (146, 'Skippad', 746, 'dadanez41@npr.org', 345, 146, 2544999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (147, 'Jazzy', 756, 'aeakins42@blinklist.com', 346, 147, 2545999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (148, 'Lazzy', 766, 'cchill43@bandcamp.com', 347, 148, 2546999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (149, 'Zava', 776, 'vfieldgate44@amazon.co.uk', 348, 149, 2547999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (150, 'Trudeo', 786, 'aliven45@hatena.ne.jp', 349, 150, 2548999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (151, 'Myworks', 796, 'hboldero46@loc.gov', 350, 151, 2549999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (152, 'Wikizz', 505, 'rorable47@myspace.com', 351, 152, 2550999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (153, 'Quire', 515, 'jritchley48@gravatar.com', 352, 153, 2551999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (154, 'Kwimbee', 525, 'mtrahmel49@technorati.com', 353, 154, 2552999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (155, 'Jetpulse', 535, 'dbenedidick4a@sun.com', 354, 155, 2553999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (156, 'Jaxworks', 545, 'gkaes4b@edublogs.org', 355, 156, 2554999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (157, 'Skippad', 555, 'melletson4c@smugmug.com', 356, 157, 2555999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (158, 'Fadeo', 565, 'tlembke4d@umich.edu', 357, 158, 2556999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (159, 'Dynabox', 575, 'sguilbert4e@goodreads.com', 358, 159, 2557999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (160, 'Oodoo', 585, 'aoneil4f@purevolume.com', 359, 160, 2558999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (161, 'Wordware', 595, 'mlindwasser4g@joomla.org', 360, 161, 2559999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (162, 'Abatz', 605, 'sgriswood4h@cnbc.com', 361, 162, 2560999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (163, 'Lazzy', 615, 'epolon4i@japanpost.jp', 362, 163, 2561999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (164, 'Linkbuzz', 625, 'dshenton4j@themeforest.net', 363, 164, 2562999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (165, 'Topdrive', 635, 'hdanzey4k@sun.com', 364, 165, 2563999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (166, 'Livepath', 645, 'jdurbann4l@umn.edu', 365, 166, 2564999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (167, 'Bluejam', 655, 'norchart4m@upenn.edu', 366, 167, 2565999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (168, 'Yodo', 665, 'twoodroff4n@newyorker.com', 367, 168, 2566999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (169, 'Oyoba', 675, 'abelch4o@meetup.com', 368, 169, 2567999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (170, 'Jabbersphere', 685, 'kkydde4p@umn.edu', 369, 170, 2568999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (171, 'Npath', 695, 'esoldan4q@plala.or.jp', 370, 171, 2569999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (172, 'Eimbee', 705, 'efanning4r@usnews.com', 371, 172, 2570999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (173, 'Wikibox', 715, 'kbraunton4s@com.com', 372, 173, 2571999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (174, 'Thoughtstorm', 725, 'onorgate4t@theatlantic.com', 373, 174, 2572999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (175, 'Latz', 735, 'czaple4u@jugem.jp', 374, 175, 2573999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (176, 'Brightdog', 745, 'gneasam4v@addtoany.com', 375, 176, 2574999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (177, 'Avamba', 755, 'bboissieux4w@joomla.org', 376, 177, 2575999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (178, 'Topdrive', 765, 'omaccoveney4x@biblegateway.com', 377, 178, 2576999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (179, 'Thoughtbridge', 775, 'mshirtliff4y@people.com.cn', 378, 179, 2577999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (180, 'Flipopia', 785, 'kprovost4z@java.com', 379, 180, 2578999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (181, 'Feedspan', 795, 'afeyer50@fema.gov', 380, 181, 2579999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (182, 'Devshare', 504, 'dhanrahan51@cbc.ca', 381, 182, 2580999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (183, 'Tagtune', 514, 'nfranke52@oaic.gov.au', 382, 183, 2581999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (184, 'Zooxo', 524, 'bbelcham53@vimeo.com', 383, 184, 2582999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (185, 'Edgetag', 534, 'tcoughlan54@w3.org', 384, 185, 2583999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (186, 'Rhyloo', 544, 'gride55@senate.gov', 385, 186, 2584999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (187, 'Topiclounge', 554, 'jscrinage56@cocolog-nifty.com', 386, 187, 2585999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (188, 'Dabshots', 564, 'mhymans57@webeden.co.uk', 387, 188, 2586999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (189, 'Lazzy', 574, 'vickowicz58@jalbum.net', 388, 189, 2587999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (190, 'Skippad', 584, 'rharrie59@alibaba.com', 389, 190, 2588999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (191, 'Vitz', 594, 'bjagielski5a@elegantthemes.com', 390, 191, 2589999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (192, 'Zoomdog', 604, 'dlemonnier5b@xing.com', 391, 192, 2590999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (193, 'Edgewire', 614, 'kknightsbridge5c@bluehost.com', 392, 193, 2591999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (194, 'Pixope', 624, 'jsimao5d@hubpages.com', 393, 194, 2592999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (195, 'Ainyx', 634, 'jgathwaite5e@cam.ac.uk', 394, 195, 2593999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (196, 'Meeveo', 644, 'tkaplan5f@imgur.com', 395, 196, 2594999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (197, 'Roomm', 654, 'mseadon5g@dell.com', 396, 197, 2595999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (198, 'Topicware', 664, 'classen5h@imageshack.us', 397, 198, 2596999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (199, 'Thoughtmix', 674, 'rgercken5i@symantec.com', 398, 199, 2597999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (200, 'Yakitri', 684, 'bscoines5j@cbc.ca', 399, 200, 2598999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (201, 'Browsedrive', 694, 'fleach5k@washingtonpost.com', 400, 201, 2599999);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (202, 'Abatz', 704, 'avurley5l@oaic.gov.au', 200, 202, 2500998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (203, 'Zoonoodle', 714, 'lchippin5m@noaa.gov', 201, 203, 2501998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (204, 'Realbridge', 724, 'zhaug5n@forbes.com', 202, 204, 2502998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (205, 'Yamia', 734, 'sboothby5o@ucoz.com', 203, 205, 2503998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (206, 'Yacero', 744, 'mblais5p@businesswire.com', 204, 206, 2504998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (207, 'Gigaclub', 754, 'gdebiaggi5q@issuu.com', 205, 207, 2505998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (208, 'Avamm', 764, 'ljudge5r@facebook.com', 206, 208, 2506998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (209, 'Zoovu', 774, 'cleban5s@weebly.com', 207, 209, 2507998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (210, 'Jaxworks', 784, 'dwillson5t@va.gov', 208, 210, 2508998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (211, 'Eazzy', 794, 'lwallege5u@cbslocal.com', 209, 211, 2509998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (212, 'Buzzdog', 503, 'seseler5v@mapquest.com', 210, 212, 2510998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (213, 'Feedspan', 513, 'fhaines5w@vimeo.com', 211, 213, 2511998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (214, 'Demivee', 523, 'ysumbler5x@arizona.edu', 212, 214, 2512998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (215, 'Skaboo', 533, 'cmoncrefe5y@netscape.com', 213, 215, 2513998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (216, 'Flashpoint', 543, 'jchamberlen5z@bbc.co.uk', 214, 216, 2514998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (217, 'Livetube', 553, 'bcard60@behance.net', 215, 217, 2515998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (218, 'Fanoodle', 563, 'arubenovic61@addtoany.com', 216, 218, 2516998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (219, 'Mydo', 573, 'epalmby62@time.com', 217, 219, 2517998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (220, 'Browsedrive', 583, 'csterzaker63@google.it', 218, 220, 2518998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (221, 'Edgeify', 593, 'tpeacey64@wisc.edu', 219, 221, 2519998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (222, 'Gigabox', 603, 'sdring65@mapquest.com', 220, 222, 2520998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (223, 'Skipstorm', 613, 'dbeiderbecke66@google.co.uk', 221, 223, 2521998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (224, 'Brainlounge', 623, 'adulanty67@fema.gov', 222, 224, 2522998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (225, 'Twimm', 633, 'uvarley68@usgs.gov', 223, 225, 2523998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (226, 'Photobug', 643, 'jkennermann69@netvibes.com', 224, 226, 2524998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (227, 'Devpulse', 653, 'dpillinger6a@yandex.ru', 225, 227, 2525998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (228, 'Blogspan', 663, 'akerry6b@utexas.edu', 226, 228, 2526998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (229, 'Livefish', 673, 'hkopfen6c@stanford.edu', 227, 229, 2527998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (230, 'Topiclounge', 683, 'gredmell6d@ovh.net', 228, 230, 2528998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (231, 'Jetwire', 693, 'ehukins6e@smh.com.au', 229, 231, 2529998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (232, 'Oba', 703, 'cdainter6f@wikia.com', 230, 232, 2530998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (233, 'Edgetag', 713, 'edoddridge6g@irs.gov', 231, 233, 2531998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (234, 'Avaveo', 723, 'zstampfer6h@comcast.net', 232, 234, 2532998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (235, 'Photojam', 733, 'dwedgwood6i@boston.com', 233, 235, 2533998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (236, 'Vidoo', 743, 'cstolle6j@elegantthemes.com', 234, 236, 2534998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (237, 'Youopia', 753, 'msineath6k@tiny.cc', 235, 237, 2535998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (238, 'Abata', 763, 'jwharmby6l@1688.com', 236, 238, 2536998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (239, 'Thoughtmix', 773, 'kpereira6m@prlog.org', 237, 239, 2537998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (240, 'Kayveo', 783, 'ispinley6n@wsj.com', 238, 240, 2538998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (241, 'Devcast', 793, 'bbrookshaw6o@aboutads.info', 239, 241, 2539998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (242, 'Izio', 502, 'enutty6p@exblog.jp', 240, 242, 2540998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (243, 'Brightbean', 512, 'gchander6q@reference.com', 241, 243, 2541998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (244, 'Trunyx', 522, 'lmatzkaitis6r@sun.com', 242, 244, 2542998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (245, 'Meedoo', 532, 'aleason6s@github.io', 243, 245, 2543998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (246, 'Fivebridge', 542, 'rsenecaux6t@mozilla.org', 244, 246, 2544998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (247, 'Wikizz', 552, 'sgreenhead6u@bloglines.com', 245, 247, 2545998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (248, 'Vimbo', 562, 'aipplett6v@marketwatch.com', 246, 248, 2546998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (249, 'Kwimbee', 572, 'jeve6w@over-blog.com', 247, 249, 2547998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (250, 'Trunyx', 582, 'nraeburn6x@barnesandnoble.com', 248, 250, 2548998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (251, 'Flipbug', 592, 'yelstub6y@ucsd.edu', 249, 251, 2549998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (252, 'Abatz', 602, 'lfosdick6z@alibaba.com', 250, 252, 2550998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (253, 'Wikido', 612, 'lbonnet70@loc.gov', 251, 253, 2551998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (254, 'Dynabox', 622, 'fcosans71@oakley.com', 252, 254, 2552998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (255, 'Yodel', 632, 'vsheber72@addtoany.com', 253, 255, 2553998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (256, 'Jaxbean', 642, 'ascotchmur73@1688.com', 254, 256, 2554998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (257, 'Leenti', 652, 'mpaudin74@merriam-webster.com', 255, 257, 2555998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (258, 'Youspan', 662, 'gibotson75@friendfeed.com', 256, 258, 2556998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (259, 'Yombu', 672, 'acomerford76@bravesites.com', 257, 259, 2557998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (260, 'Shufflebeat', 682, 'cdreinan77@chron.com', 258, 260, 2558998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (261, 'Avamm', 692, 'msearch78@ucsd.edu', 259, 261, 2559998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (262, 'Kazio', 702, 'lwolver79@deviantart.com', 260, 262, 2560998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (263, 'Oyoyo', 712, 'ckidsley7a@slate.com', 261, 263, 2561998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (264, 'Jabbertype', 722, 'nsparks7b@si.edu', 262, 264, 2562998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (265, 'Voonder', 732, 'bdamant7c@weather.com', 263, 265, 2563998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (266, 'Gigaclub', 742, 'lhefferon7d@cbsnews.com', 264, 266, 2564998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (267, 'Yakidoo', 752, 'kvolke7e@thetimes.co.uk', 265, 267, 2565998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (268, 'Meedoo', 762, 'ngiovannini7f@networkadvertising.org', 266, 268, 2566998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (269, 'Skajo', 772, 'cpethybridge7g@tamu.edu', 267, 269, 2567998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (270, 'Youspan', 782, 'bbolesworth7h@mediafire.com', 268, 270, 2568998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (271, 'Zoozzy', 792, 'blewzey7i@flickr.com', 269, 271, 2569998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (272, 'Tagopia', 501, 'aroma7j@google.ca', 270, 272, 2570998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (273, 'Bluejam', 511, 'vepgrave7k@domainmarket.com', 271, 273, 2571998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (274, 'Thoughtblab', 521, 'cranstead7l@blogs.com', 272, 274, 2572998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (275, 'Jetpulse', 531, 'ssaxelby7m@techcrunch.com', 273, 275, 2573998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (276, 'Twitterbridge', 541, 'dcowterd7n@nyu.edu', 274, 276, 2574998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (277, 'Skiba', 551, 'swhilder7o@state.gov', 275, 277, 2575998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (278, 'Janyx', 561, 'lmenichini7p@yellowbook.com', 276, 278, 2576998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (279, 'Buzzbean', 571, 'ddiano7q@deliciousdays.com', 277, 279, 2577998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (280, 'Cogilith', 581, 'dkemp7r@godaddy.com', 278, 280, 2578998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (281, 'Oyope', 591, 'mglennon7s@virginia.edu', 279, 281, 2579998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (282, 'Skinix', 601, 'bmatschuk7t@youtu.be', 280, 282, 2580998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (283, 'Skivee', 611, 'gdyet7u@bravesites.com', 281, 283, 2581998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (284, 'Blognation', 621, 'kbarkus7v@yelp.com', 282, 284, 2582998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (285, 'Wordpedia', 631, 'hsinclaire7w@google.com', 283, 285, 2583998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (286, 'Mudo', 641, 'dbertome7x@com.com', 284, 286, 2584998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (287, 'Shuffletag', 651, 'lbarme7y@twitpic.com', 285, 287, 2585998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (288, 'Meejo', 661, 'swedlake7z@list-manage.com', 286, 288, 2586998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (289, 'Tazz', 671, 'pantrim80@xrea.com', 287, 289, 2587998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (290, 'Blogtags', 681, 'nyanin81@godaddy.com', 288, 290, 2588998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (291, 'Rhynyx', 691, 'rcalwell82@chicagotribune.com', 289, 291, 2589998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (292, 'Centimia', 701, 'cbamber83@webnode.com', 290, 292, 2590998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (293, 'Avavee', 711, 'fmcconnel84@mayoclinic.com', 291, 293, 2591998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (294, 'Flashdog', 721, 'jblethin85@time.com', 292, 294, 2592998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (295, 'Skimia', 731, 'tgrimolbie86@booking.com', 293, 295, 2593998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (296, 'Jatri', 741, 'phurtic87@ca.gov', 294, 296, 2594998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (297, 'Trudeo', 751, 'aerskin88@squidoo.com', 295, 297, 2595998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (298, 'Shuffledrive', 761, 'dmacneice89@meetup.com', 296, 298, 2596998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (299, 'Dazzlesphere', 771, 'stipper8a@so-net.ne.jp', 297, 299, 2597998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (300, 'Wikizz', 781, 'tlambkin8b@youtu.be', 298, 300, 2598998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (301, 'Chatterpoint', 791, 'ivelten8c@123-reg.co.uk', 299, 301, 2599998);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (302, 'Lazzy', 500, 'etippell8d@cbc.ca', 300, 302, 2500997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (303, 'Zoomdog', 510, 'sspire8e@csmonitor.com', 301, 303, 2501997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (304, 'Browsebug', 520, 'tboichat8f@imgur.com', 302, 304, 2502997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (305, 'Innotype', 530, 'cquickfall8g@alibaba.com', 303, 305, 2503997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (306, 'Abata', 540, 'dwisdom8h@disqus.com', 304, 306, 2504997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (307, 'Trunyx', 550, 'hsongest8i@quantcast.com', 305, 307, 2505997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (308, 'Thoughtbeat', 560, 'lleyrroyd8j@spotify.com', 306, 308, 2506997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (309, 'Jetwire', 570, 'cgrog8k@hp.com', 307, 309, 2507997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (310, 'Jatri', 580, 'orubens8l@japanpost.jp', 308, 310, 2508997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (311, 'Dynava', 590, 'achadburn8m@tinypic.com', 309, 311, 2509997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (312, 'Twimbo', 600, 'twoodnutt8n@smh.com.au', 310, 312, 2510997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (313, 'Tagchat', 610, 'soleszczak8o@tinypic.com', 311, 313, 2511997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (314, 'Divape', 620, 'hbowlesworth8p@npr.org', 312, 314, 2512997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (315, 'Zoonoodle', 630, 'tbonny8q@nasa.gov', 313, 315, 2513997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (316, 'Voolia', 640, 'dcallendar8r@com.com', 314, 316, 2514997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (317, 'Dabjam', 650, 'ahysom8s@studiopress.com', 315, 317, 2515997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (318, 'Yodoo', 660, 'amccluskey8t@netvibes.com', 316, 318, 2516997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (319, 'Skinder', 670, 'tdafter8u@google.pl', 317, 319, 2517997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (320, 'Leenti', 680, 'cclissett8v@gnu.org', 318, 320, 2518997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (321, 'Skivee', 690, 'bbeckwith8w@thetimes.co.uk', 319, 321, 2519997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (322, 'Twitterbeat', 700, 'forthmann8x@fotki.com', 320, 322, 2520997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (323, 'Camido', 710, 'bkilday8y@lulu.com', 321, 323, 2521997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (324, 'Ooba', 720, 'kburleigh8z@comcast.net', 322, 324, 2522997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (325, 'Meejo', 730, 'oventom90@bigcartel.com', 323, 325, 2523997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (326, 'Yamia', 740, 'felsay91@intel.com', 324, 326, 2524997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (327, 'Bubblebox', 750, 'nverdun92@amazon.co.jp', 325, 327, 2525997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (328, 'Photofeed', 760, 'sbartke93@europa.eu', 326, 328, 2526997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (329, 'Tavu', 770, 'sjollye94@soundcloud.com', 327, 329, 2527997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (330, 'Yombu', 780, 'jklink95@constantcontact.com', 328, 330, 2528997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (331, 'Dabjam', 790, 'tquarrie96@booking.com', 329, 331, 2529997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (332, 'Browseblab', 800, 'wslatter97@home.pl', 330, 332, 2530997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (333, 'Twiyo', 509, 'khaythornthwaite98@wikia.com', 331, 333, 2531997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (334, 'Skimia', 519, 'pandover99@macromedia.com', 332, 334, 2532997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (335, 'Brightdog', 529, 'kadrien9a@wisc.edu', 333, 335, 2533997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (336, 'Abatz', 539, 'dpellamonuten9b@studiopress.com', 334, 336, 2534997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (337, 'Vitz', 549, 'doldred9c@furl.net', 335, 337, 2535997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (338, 'Myworks', 559, 'noshiel9d@businessweek.com', 336, 338, 2536997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (339, 'Feedbug', 569, 'rhaythorne9e@nymag.com', 337, 339, 2537997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (340, 'Edgepulse', 579, 'ehollebon9f@google.cn', 338, 340, 2538997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (341, 'Ntags', 589, 'dbaldetti9g@aol.com', 339, 341, 2539997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (342, 'Twimm', 599, 'cschwanden9h@reverbnation.com', 340, 342, 2540997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (343, 'Realmix', 609, 'rdunbabin9i@bing.com', 341, 343, 2541997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (344, 'Quinu', 619, 'lbalshaw9j@fc2.com', 342, 344, 2542997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (345, 'Realmix', 629, 'pstiell9k@tripadvisor.com', 343, 345, 2543997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (346, 'Dynazzy', 639, 'emacoun9l@state.tx.us', 344, 346, 2544997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (347, 'Skilith', 649, 'jseebert9m@redcross.org', 345, 347, 2545997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (348, 'Feedbug', 659, 'lwalsh9n@cocolog-nifty.com', 346, 348, 2546997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (349, 'Layo', 669, 'doaks9o@etsy.com', 347, 349, 2547997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (350, 'Gigazoom', 679, 'wolivello9p@newyorker.com', 348, 350, 2548997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (351, 'Demivee', 689, 'toldknowe9q@nih.gov', 349, 351, 2549997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (352, 'BlogXS', 699, 'kdobney9r@goo.ne.jp', 350, 352, 2550997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (353, 'Bubblebox', 709, 'iglenister9s@cam.ac.uk', 351, 353, 2551997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (354, 'Livepath', 719, 'kdignon9t@goodreads.com', 352, 354, 2552997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (355, 'Jaxbean', 729, 'emcgilroy9u@miibeian.gov.cn', 353, 355, 2553997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (356, 'Roodel', 739, 'gclail9v@tinypic.com', 354, 356, 2554997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (357, 'Realfire', 749, 'pquare9w@constantcontact.com', 355, 357, 2555997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (358, 'Meemm', 759, 'laylwin9x@paginegialle.it', 356, 358, 2556997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (359, 'Zoombox', 769, 'lhannen9y@youtu.be', 357, 359, 2557997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (360, 'Blogtag', 779, 'fbeatson9z@google.cn', 358, 360, 2558997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (361, 'Twinte', 789, 'sboldisona0@homestead.com', 359, 361, 2559997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (362, 'Dazzlesphere', 799, 'mmacphadena1@buzzfeed.com', 360, 362, 2560997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (363, 'Quaxo', 508, 'mmorlinga2@cbsnews.com', 361, 363, 2561997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (364, 'Gevee', 518, 'bdestoopa3@ycombinator.com', 362, 364, 2562997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (365, 'Eidel', 528, 'khousemana4@europa.eu', 363, 365, 2563997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (366, 'Zoomzone', 538, 'aduggona5@unesco.org', 364, 366, 2564997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (367, 'Photobug', 548, 'gtilzeya6@indiatimes.com', 365, 367, 2565997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (368, 'Leexo', 558, 'folliera7@google.com.hk', 366, 368, 2566997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (369, 'Jazzy', 568, 'fgozarda8@people.com.cn', 367, 369, 2567997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (370, 'Eamia', 578, 'cmaccaughana9@bizjournals.com', 368, 370, 2568997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (371, 'Jaxworks', 588, 'dmaturaaa@deliciousdays.com', 369, 371, 2569997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (372, 'Tazz', 598, 'bgoriniab@dagondesign.com', 370, 372, 2570997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (373, 'Meevee', 608, 'cbodillac@1und1.de', 371, 373, 2571997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (374, 'Demizz', 618, 'asindellad@twitter.com', 372, 374, 2572997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (375, 'Youbridge', 628, 'tlejeanae@feedburner.com', 373, 375, 2573997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (376, 'Vinte', 638, 'mjeannequinaf@barnesandnoble.com', 374, 376, 2574997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (377, 'Zoombox', 648, 'eeganag@go.com', 375, 377, 2575997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (378, 'Wikivu', 658, 'parensonah@t-online.de', 376, 378, 2576997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (379, 'Mydeo', 668, 'kapfelmannai@paginegialle.it', 377, 379, 2577997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (380, 'Wordware', 678, 'erizziaj@tinypic.com', 378, 380, 2578997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (381, 'Youtags', 688, 'ldullinghamak@blogtalkradio.com', 379, 381, 2579997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (382, 'Shufflester', 698, 'mcroutearal@skyrock.com', 380, 382, 2580997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (383, 'Topiczoom', 708, 'ctremblotam@slate.com', 381, 383, 2581997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (384, 'Aimbo', 718, 'dspykingsan@i2i.jp', 382, 384, 2582997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (385, 'Oyondu', 728, 'skoenraadao@paginegialle.it', 383, 385, 2583997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (386, 'Mita', 738, 'sdooreyap@tumblr.com', 384, 386, 2584997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (387, 'Skinder', 748, 'fdamperaq@amazonaws.com', 385, 387, 2585997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (388, 'Twitterbeat', 758, 'fvanear@abc.net.au', 386, 388, 2586997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (389, 'Skinder', 768, 'csaffeas@unicef.org', 387, 389, 2587997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (390, 'Rhycero', 778, 'amourantat@wisc.edu', 388, 390, 2588997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (391, 'Ntags', 788, 'rclinganau@hugedomains.com', 389, 391, 2589997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (392, 'Centidel', 798, 'adockrillav@miibeian.gov.cn', 390, 392, 2590997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (393, 'Skyndu', 507, 'lbalharryaw@census.gov', 391, 393, 2591997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (394, 'Voomm', 517, 'ncoullingax@networksolutions.com', 392, 394, 2592997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (395, 'Meevee', 527, 'sendleay@drupal.org', 393, 395, 2593997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (396, 'Quatz', 537, 'jtippellaz@adobe.com', 394, 396, 2594997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (397, 'Vinder', 547, 'clowersonb0@weebly.com', 395, 397, 2595997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (398, 'Flashspan', 557, 'mfosterb1@soundcloud.com', 396, 398, 2596997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (399, 'Vipe', 567, 'gablesonb2@squidoo.com', 397, 399, 2597997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (400, 'Talane', 577, 'dcumberledgeb3@craigslist.org', 398, 400, 2598997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (401, 'Latz', 587, 'dsinclairb4@reference.com', 399, 401, 2599997);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (402, 'Yacero', 597, 'bhandslipb5@webs.com', 400, 402, 2500996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (403, 'Jabberstorm', 607, 'bwhewayb6@ihg.com', 200, 403, 2501996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (404, 'Eabox', 617, 'zcaulfieldb7@amazonaws.com', 201, 404, 2502996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (405, 'Jabberstorm', 627, 'cmoanb8@com.com', 202, 405, 2503996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (406, 'Twitterbridge', 637, 'eotridgeb9@multiply.com', 203, 406, 2504996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (407, 'Vinder', 647, 'cbartaba@pinterest.com', 204, 407, 2505996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (408, 'Devpulse', 657, 'abentzbb@wired.com', 205, 408, 2506996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (409, 'Roomm', 667, 'cflickerbc@bizjournals.com', 206, 409, 2507996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (410, 'Demivee', 677, 'mhensmansbd@state.gov', 207, 410, 2508996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (411, 'Skinix', 687, 'mcopelandbe@bloglines.com', 208, 411, 2509996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (412, 'Youfeed', 697, 'mstuddebf@goo.ne.jp', 209, 412, 2510996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (413, 'Tazzy', 707, 'kpavelinbg@nsw.gov.au', 210, 413, 2511996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (414, 'Kayveo', 717, 'aklimesbh@ebay.co.uk', 211, 414, 2512996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (415, 'Kazu', 727, 'hprewettbi@over-blog.com', 212, 415, 2513996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (416, 'Kwinu', 737, 'jsymondsbj@nytimes.com', 213, 416, 2514996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (417, 'Dabfeed', 747, 'rnuccitellibk@devhub.com', 214, 417, 2515996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (418, 'Ailane', 757, 'cgeraldobl@rediff.com', 215, 418, 2516996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (419, 'Jatri', 767, 'mravenscraftbm@360.cn', 216, 419, 2517996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (420, 'Latz', 777, 'rramagebn@bandcamp.com', 217, 420, 2518996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (421, 'Trupe', 787, 'lcaslakebo@sbwire.com', 218, 421, 2519996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (422, 'Jamia', 797, 'kbolstridgebp@answers.com', 219, 422, 2520996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (423, 'Youfeed', 506, 'rbitchenobq@ucoz.ru', 220, 423, 2521996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (424, 'Skyvu', 516, 'ddiggonsbr@yahoo.com', 221, 424, 2522996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (425, 'Meetz', 526, 'cstonerbs@archive.org', 222, 425, 2523996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (426, 'Cogibox', 536, 'mwaplebt@facebook.com', 223, 426, 2524996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (427, 'Twinte', 546, 'smcdougallbu@mapquest.com', 224, 427, 2525996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (428, 'Skibox', 556, 'kdunsbv@indiegogo.com', 225, 428, 2526996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (429, 'Skilith', 566, 'jtoraldbw@yellowpages.com', 226, 429, 2527996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (430, 'Avavee', 576, 'ecollardbx@rambler.ru', 227, 430, 2528996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (431, 'Aibox', 586, 'mjewsonby@mail.ru', 228, 431, 2529996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (432, 'Brainbox', 596, 'bchandersbz@wikia.com', 229, 432, 2530996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (433, 'Brainlounge', 606, 'jclowserc0@oakley.com', 230, 433, 2531996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (434, 'Lazz', 616, 'kcappineerc1@prnewswire.com', 231, 434, 2532996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (435, 'Rhynyx', 626, 'jchardc2@youku.com', 232, 435, 2533996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (436, 'Divavu', 636, 'bnewsteadc3@google.es', 233, 436, 2534996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (437, 'Ailane', 646, 'kivanuschkac4@opensource.org', 234, 437, 2535996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (438, 'Skinder', 656, 'fbosomworthc5@cornell.edu', 235, 438, 2536996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (439, 'Yodo', 666, 'icaretc6@facebook.com', 236, 439, 2537996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (440, 'Rooxo', 676, 'eorderc7@hugedomains.com', 237, 440, 2538996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (441, 'Topicblab', 686, 'cpezeyc8@comsenz.com', 238, 441, 2539996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (442, 'Dynabox', 696, 'kmoxsonc9@yale.edu', 239, 442, 2540996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (443, 'Rhynoodle', 706, 'kmeatcherca@hibu.com', 240, 443, 2541996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (444, 'Youtags', 716, 'cattrilcb@facebook.com', 241, 444, 2542996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (445, 'Thoughtstorm', 726, 'ckaufmancc@techcrunch.com', 242, 445, 2543996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (446, 'Thoughtstorm', 736, 'lrotherhamcd@instagram.com', 243, 446, 2544996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (447, 'Twitternation', 746, 'lreachce@nps.gov', 244, 447, 2545996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (448, 'Skyndu', 756, 'cgehrtscf@independent.co.uk', 245, 448, 2546996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (449, 'Voolia', 766, 'wshouldercg@hubpages.com', 246, 449, 2547996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (450, 'Vinte', 776, 'omcgeacheych@youtu.be', 247, 450, 2548996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (451, 'Jabbersphere', 786, 'jlabbci@jimdo.com', 248, 451, 2549996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (452, 'Gabspot', 796, 'cmoncrieffecj@goo.ne.jp', 249, 452, 2550996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (453, 'Divavu', 505, 'rlodevickck@mashable.com', 250, 453, 2551996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (454, 'Dabtype', 515, 'bfollowscl@canalblog.com', 251, 454, 2552996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (455, 'Quaxo', 525, 'hpettefordcm@engadget.com', 252, 455, 2553996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (456, 'Oyoyo', 535, 'hmassycn@baidu.com', 253, 456, 2554996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (457, 'Flashset', 545, 'amustchinco@ask.com', 254, 457, 2555996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (458, 'Skyba', 555, 'sthirstcp@linkedin.com', 255, 458, 2556996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (459, 'Youbridge', 565, 'pjearumcq@wp.com', 256, 459, 2557996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (460, 'Tambee', 575, 'mdeambrosiscr@devhub.com', 257, 460, 2558996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (461, 'Meevee', 585, 'rbenieshcs@a8.net', 258, 461, 2559996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (462, 'Edgeify', 595, 'afilipowiczct@topsy.com', 259, 462, 2560996);
INSERT INTO public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") VALUES (1, 'Izion', 505, 'haleksich0@smh.com.au', 202, 1, 2500000);


--
-- TOC entry 3206 (class 0 OID 21095)
-- Dependencies: 223
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3207 (class 0 OID 21101)
-- Dependencies: 224
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3208 (class 0 OID 21107)
-- Dependencies: 225
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3209 (class 0 OID 21110)
-- Dependencies: 226
-- Data for Name: Terrestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Terrestre" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Tipo", "FK-SucursalT", "FK-ModeloT") VALUES ('N7W289L', 345, 900, 100, '', 98765, '1999-12-11', 'Carro', NULL, NULL);
INSERT INTO public."Terrestre" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Tipo", "FK-SucursalT", "FK-ModeloT") VALUES ('L34P8R7', 345, 900, 100, '', 98765, '1999-12-11', 'Carro', NULL, NULL);
INSERT INTO public."Terrestre" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Tipo", "FK-SucursalT", "FK-ModeloT") VALUES ('12AB234', 345, 900, 100, '', 98765, '1999-12-11', 'Carro', NULL, NULL);


--
-- TOC entry 3210 (class 0 OID 21116)
-- Dependencies: 227
-- Data for Name: TipoPaquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (1, 'Vidrieria');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (2, 'Metales');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (3, 'Alimento');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (4, 'Material de oficina');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (5, 'Electrodomesticos');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (6, 'Articulos de limpieza');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (7, 'Ropa');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (8, 'Video Juegos');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (9, 'Libros');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (10, 'Peliculas');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (11, 'Juguetes');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (12, 'Medicinas');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (13, 'Articulos de cocina');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (14, 'Muebles');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (15, 'Herramientas');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (16, 'Adornos');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (17, 'Software');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (18, 'Computadoras');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (19, 'Industrial y Cientifico');
INSERT INTO public."TipoPaquete" ("COD", "Clasificacion") VALUES (20, 'Suplementos para mascotas');


--
-- TOC entry 3211 (class 0 OID 21122)
-- Dependencies: 228
-- Data for Name: Transferencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3212 (class 0 OID 21128)
-- Dependencies: 229
-- Data for Name: Traslado; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3213 (class 0 OID 21131)
-- Dependencies: 230
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Usuario" ("Nombre", "Contrasena", "FK-RolU", "FK-ClienteU", "FK-EmpleadoU", "COD") VALUES ('Rita.ucab', '123', 1, NULL, 6316457, 3);
INSERT INTO public."Usuario" ("Nombre", "Contrasena", "FK-RolU", "FK-ClienteU", "FK-EmpleadoU", "COD") VALUES ('Rouser4345', '123', 1, 25213842, NULL, 5);
INSERT INTO public."Usuario" ("Nombre", "Contrasena", "FK-RolU", "FK-ClienteU", "FK-EmpleadoU", "COD") VALUES ('Gladys.inlectra', '456', 1, NULL, 4823744, 8);


--
-- TOC entry 3214 (class 0 OID 21137)
-- Dependencies: 231
-- Data for Name: Veh-Rut; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3215 (class 0 OID 21143)
-- Dependencies: 232
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq', 12, true);


--
-- TOC entry 2857 (class 2606 OID 21150)
-- Name: Accion Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accion"
    ADD CONSTRAINT "Accion_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2859 (class 2606 OID 21152)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2863 (class 2606 OID 21154)
-- Name: Asistencia Asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("COD", "CIEmpleado", "CODZona");


--
-- TOC entry 2871 (class 2606 OID 21156)
-- Name: Barco Barco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "Barco_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2875 (class 2606 OID 21158)
-- Name: Cheque Cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "Cheque_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2878 (class 2606 OID 21160)
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2881 (class 2606 OID 21162)
-- Name: Efectivo Efectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "Efectivo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2884 (class 2606 OID 21164)
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2889 (class 2606 OID 21166)
-- Name: Envio Envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2893 (class 2606 OID 21168)
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2895 (class 2606 OID 21170)
-- Name: Gastos Gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gastos"
    ADD CONSTRAINT "Gastos_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2898 (class 2606 OID 21172)
-- Name: Horario Horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT "Horario_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2900 (class 2606 OID 21174)
-- Name: L-VIP L-VIP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "L-VIP_pkey" PRIMARY KEY ("NroCarnet");


--
-- TOC entry 2903 (class 2606 OID 21176)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2912 (class 2606 OID 21178)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2914 (class 2606 OID 21180)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2867 (class 2606 OID 21182)
-- Name: Avion PK-Avion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "PK-Avion" PRIMARY KEY ("Placa");


--
-- TOC entry 2906 (class 2606 OID 21184)
-- Name: Mantenimiento PK-Mantenimiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PK-Mantenimiento" PRIMARY KEY ("COD");


--
-- TOC entry 2982 (class 2606 OID 22338)
-- Name: Usuario PK-Usuario; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "PK-Usuario" PRIMARY KEY ("COD");


--
-- TOC entry 2921 (class 2606 OID 21186)
-- Name: Pago-Metodo Pago-Metodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "Pago-Metodo_pkey" PRIMARY KEY ("COD", "CODPago");


--
-- TOC entry 2917 (class 2606 OID 21188)
-- Name: Pago Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2928 (class 2606 OID 21190)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2935 (class 2606 OID 21192)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2941 (class 2606 OID 21194)
-- Name: Rol-Accion Rol-Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "Rol-Accion_pkey" PRIMARY KEY ("COD", "CODRol", "CODAccion");


--
-- TOC entry 2939 (class 2606 OID 21196)
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2945 (class 2606 OID 21198)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2950 (class 2606 OID 21200)
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2953 (class 2606 OID 21202)
-- Name: Sucursal Sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2957 (class 2606 OID 21204)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2961 (class 2606 OID 21206)
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2964 (class 2606 OID 21208)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2969 (class 2606 OID 21210)
-- Name: Terrestre Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2973 (class 2606 OID 21212)
-- Name: TipoPaquete TipoPaquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoPaquete"
    ADD CONSTRAINT "TipoPaquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2975 (class 2606 OID 21214)
-- Name: Transferencia Transferencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "Transferencia_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2978 (class 2606 OID 21216)
-- Name: Traslado Traslado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "Traslado_pkey" PRIMARY KEY ("COD", "CODVeh-Rut", "CODEnvio");


--
-- TOC entry 2987 (class 2606 OID 21220)
-- Name: Veh-Rut Veh-Rut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "Veh-Rut_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2993 (class 2606 OID 21222)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2864 (class 1259 OID 21223)
-- Name: fki_CIEmpleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CIEmpleado" ON public."Asistencia" USING btree ("CIEmpleado");


--
-- TOC entry 2942 (class 1259 OID 21224)
-- Name: fki_CODAccion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODAccion" ON public."Rol-Accion" USING btree ("CODAccion");


--
-- TOC entry 2922 (class 1259 OID 21225)
-- Name: fki_CODCheque; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODCheque" ON public."Pago-Metodo" USING btree ("CODCheque");


--
-- TOC entry 2923 (class 1259 OID 21226)
-- Name: fki_CODEfect; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEfect" ON public."Pago-Metodo" USING btree ("CODEfect");


--
-- TOC entry 2979 (class 1259 OID 21227)
-- Name: fki_CODEnvio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEnvio" ON public."Traslado" USING btree ("CODEnvio");


--
-- TOC entry 2924 (class 1259 OID 21228)
-- Name: fki_CODPago; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODPago" ON public."Pago-Metodo" USING btree ("CODPago");


--
-- TOC entry 2943 (class 1259 OID 21229)
-- Name: fki_CODRol; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRol" ON public."Rol-Accion" USING btree ("CODRol");


--
-- TOC entry 2988 (class 1259 OID 21230)
-- Name: fki_CODRuta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRuta" ON public."Veh-Rut" USING btree ("CODRuta");


--
-- TOC entry 2907 (class 1259 OID 21231)
-- Name: fki_CODTaller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTaller" ON public."Mantenimiento" USING btree ("CODTaller");


--
-- TOC entry 2925 (class 1259 OID 21232)
-- Name: fki_CODTarjeta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTarjeta" ON public."Pago-Metodo" USING btree ("CODTarjeta");


--
-- TOC entry 2926 (class 1259 OID 21233)
-- Name: fki_CODTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTrans" ON public."Pago-Metodo" USING btree ("CODTrans");


--
-- TOC entry 2980 (class 1259 OID 21234)
-- Name: fki_CODVeh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODVeh-Rut" ON public."Traslado" USING btree ("CODVeh-Rut");


--
-- TOC entry 2865 (class 1259 OID 21235)
-- Name: fki_CODZona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODZona" ON public."Asistencia" USING btree ("CODZona");


--
-- TOC entry 2868 (class 1259 OID 21236)
-- Name: fki_FK-Aeropuerto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Aeropuerto" ON public."Avion" USING btree ("FK-Aeropuerto");


--
-- TOC entry 2901 (class 1259 OID 21237)
-- Name: fki_FK-CLienteL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-CLienteL" ON public."L-VIP" USING btree ("FK-ClienteL");


--
-- TOC entry 2965 (class 1259 OID 21238)
-- Name: fki_FK-Cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente" ON public."Telefono" USING btree ("FK-Cliente");


--
-- TOC entry 2929 (class 1259 OID 21239)
-- Name: fki_FK-Cliente1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente1" ON public."Paquete" USING btree ("FK-Cliente1");


--
-- TOC entry 2930 (class 1259 OID 21240)
-- Name: fki_FK-Cliente2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente2" ON public."Paquete" USING btree ("FK-Cliente2");


--
-- TOC entry 2882 (class 1259 OID 21241)
-- Name: fki_FK-ClienteE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteE" ON public."Efectivo" USING btree ("FK-ClienteE");


--
-- TOC entry 2876 (class 1259 OID 21242)
-- Name: fki_FK-ClienteM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteM" ON public."Cheque" USING btree ("FK-ClienteM");


--
-- TOC entry 2962 (class 1259 OID 21243)
-- Name: fki_FK-ClienteT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteT" ON public."Tarjeta" USING btree ("FK-ClienteT");


--
-- TOC entry 2976 (class 1259 OID 21244)
-- Name: fki_FK-ClienteTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteTrans" ON public."Transferencia" USING btree ("FK-ClienteTrans");


--
-- TOC entry 2983 (class 1259 OID 21245)
-- Name: fki_FK-ClienteU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteU" ON public."Usuario" USING btree ("FK-ClienteU");


--
-- TOC entry 2966 (class 1259 OID 21246)
-- Name: fki_FK-Empleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Empleado" ON public."Telefono" USING btree ("FK-Empleado");


--
-- TOC entry 2890 (class 1259 OID 21247)
-- Name: fki_FK-EmpleadoE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoE" ON public."Envio" USING btree ("FK-EmpleadoE");


--
-- TOC entry 2918 (class 1259 OID 21248)
-- Name: fki_FK-EmpleadoP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoP" ON public."Pago" USING btree ("FK-EmpleadoP");


--
-- TOC entry 2954 (class 1259 OID 21249)
-- Name: fki_FK-EmpleadoS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoS" ON public."Sucursal" USING btree ("FK-EmpleadoS");


--
-- TOC entry 2984 (class 1259 OID 21250)
-- Name: fki_FK-EmpleadoU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoU" ON public."Usuario" USING btree ("FK-EmpleadoU");


--
-- TOC entry 2919 (class 1259 OID 21251)
-- Name: fki_FK-EnvioP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioP" ON public."Pago" USING btree ("FK-EnvioP");


--
-- TOC entry 2931 (class 1259 OID 21252)
-- Name: fki_FK-EnvioPa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioPa" ON public."Paquete" USING btree ("FK-EnvioP");


--
-- TOC entry 2891 (class 1259 OID 21253)
-- Name: fki_FK-EstatusE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EstatusE" ON public."Envio" USING btree ("FK-EstatusE");


--
-- TOC entry 2885 (class 1259 OID 21254)
-- Name: fki_FK-GastosE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosE" ON public."Empleado" USING btree ("FK-GastosE");


--
-- TOC entry 2951 (class 1259 OID 21255)
-- Name: fki_FK-GastosS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosS" ON public."Servicio" USING btree ("FK-GastosS");


--
-- TOC entry 2886 (class 1259 OID 21256)
-- Name: fki_FK-HorarioEmp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-HorarioEmp" ON public."Empleado" USING btree ("FK-HorarioEmp");


--
-- TOC entry 2860 (class 1259 OID 21257)
-- Name: fki_FK-LugarAe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarAe" ON public."Aeropuerto" USING btree ("FK-LugarAe");


--
-- TOC entry 2879 (class 1259 OID 21258)
-- Name: fki_FK-LugarC; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarC" ON public."Cliente" USING btree ("FK-LugarC");


--
-- TOC entry 2904 (class 1259 OID 21259)
-- Name: fki_FK-LugarL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarL" ON public."Lugar" USING btree ("Fk-LugarL");


--
-- TOC entry 2936 (class 1259 OID 21260)
-- Name: fki_FK-LugarP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarP" ON public."Puerto" USING btree ("FK-LugarP");


--
-- TOC entry 2955 (class 1259 OID 21261)
-- Name: fki_FK-LugarS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarS" ON public."Sucursal" USING btree ("FK-LugarS");


--
-- TOC entry 2958 (class 1259 OID 21262)
-- Name: fki_FK-LugarT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarT" ON public."Taller" USING btree ("FK-LugarT");


--
-- TOC entry 2915 (class 1259 OID 21263)
-- Name: fki_FK-MarcaM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-MarcaM" ON public."Modelo" USING btree ("FK-MarcaM");


--
-- TOC entry 2869 (class 1259 OID 21264)
-- Name: fki_FK-ModeloA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloA" ON public."Avion" USING btree ("FK-ModeloA");


--
-- TOC entry 2872 (class 1259 OID 21265)
-- Name: fki_FK-ModeloB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloB" ON public."Barco" USING btree ("FK-ModeloB");


--
-- TOC entry 2970 (class 1259 OID 21266)
-- Name: fki_FK-ModeloT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloT" ON public."Terrestre" USING btree ("FK-ModeloT");


--
-- TOC entry 2873 (class 1259 OID 21267)
-- Name: fki_FK-PuertoB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-PuertoB" ON public."Barco" USING btree ("FK-PuertoB");


--
-- TOC entry 2985 (class 1259 OID 21268)
-- Name: fki_FK-RolU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-RolU" ON public."Usuario" USING btree ("FK-RolU");


--
-- TOC entry 2946 (class 1259 OID 21269)
-- Name: fki_FK-Ruta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Ruta" ON public."Ruta" USING btree ("FK-Ruta");


--
-- TOC entry 2932 (class 1259 OID 21270)
-- Name: fki_FK-Sucursal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal" ON public."Paquete" USING btree ("FK-Sucursal");


--
-- TOC entry 2947 (class 1259 OID 21271)
-- Name: fki_FK-Sucursal1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal1" ON public."Ruta" USING btree ("FK-Sucursal1");


--
-- TOC entry 2948 (class 1259 OID 21272)
-- Name: fki_FK-Sucursal2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal2" ON public."Ruta" USING btree ("FK-Sucursal2");


--
-- TOC entry 2861 (class 1259 OID 21273)
-- Name: fki_FK-SucursalA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalA" ON public."Aeropuerto" USING btree ("FK-SucursalA");


--
-- TOC entry 2887 (class 1259 OID 21274)
-- Name: fki_FK-SucursalEmp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalEmp" ON public."Empleado" USING btree ("FK-SucursalEmp");


--
-- TOC entry 2896 (class 1259 OID 21275)
-- Name: fki_FK-SucursalG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalG" ON public."Gastos" USING btree ("FK-SucursalG");


--
-- TOC entry 2937 (class 1259 OID 21276)
-- Name: fki_FK-SucursalPu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalPu" ON public."Puerto" USING btree ("FK-Sucursal");


--
-- TOC entry 2967 (class 1259 OID 21277)
-- Name: fki_FK-SucursalT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalT" ON public."Telefono" USING btree ("FK-SucursalT");


--
-- TOC entry 2971 (class 1259 OID 21278)
-- Name: fki_FK-SucursalTe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalTe" ON public."Terrestre" USING btree ("FK-SucursalT");


--
-- TOC entry 2994 (class 1259 OID 21279)
-- Name: fki_FK-SucursalZ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalZ" ON public."Zona" USING btree ("FK-SucursalZ");


--
-- TOC entry 2959 (class 1259 OID 21280)
-- Name: fki_FK-TelefonoT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TelefonoT" ON public."Taller" USING btree ("FK-TelefonoT");


--
-- TOC entry 2933 (class 1259 OID 21281)
-- Name: fki_FK-TipoPaquete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TipoPaquete" ON public."Paquete" USING btree ("FK-TipoPaquete");


--
-- TOC entry 2908 (class 1259 OID 21282)
-- Name: fki_PlacaA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA" ON public."Mantenimiento" USING btree ("PlacaA");


--
-- TOC entry 2989 (class 1259 OID 21283)
-- Name: fki_PlacaA-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaA");


--
-- TOC entry 2909 (class 1259 OID 21284)
-- Name: fki_PlacaB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB" ON public."Mantenimiento" USING btree ("PlacaB");


--
-- TOC entry 2990 (class 1259 OID 21285)
-- Name: fki_PlacaB-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaB");


--
-- TOC entry 2910 (class 1259 OID 21286)
-- Name: fki_PlacaT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT" ON public."Mantenimiento" USING btree ("PlacaT");


--
-- TOC entry 2991 (class 1259 OID 21287)
-- Name: fki_PlacaT-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaT");


--
-- TOC entry 3031 (class 2606 OID 21293)
-- Name: Rol-Accion CODAccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODAccion" FOREIGN KEY ("CODAccion") REFERENCES public."Accion"("COD");


--
-- TOC entry 3017 (class 2606 OID 21298)
-- Name: Pago-Metodo CODCheque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODCheque" FOREIGN KEY ("CODCheque") REFERENCES public."Cheque"("COD");


--
-- TOC entry 3018 (class 2606 OID 21303)
-- Name: Pago-Metodo CODEfect; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODEfect" FOREIGN KEY ("CODEfect") REFERENCES public."Efectivo"("COD");


--
-- TOC entry 3048 (class 2606 OID 21308)
-- Name: Traslado CODEnvio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODEnvio" FOREIGN KEY ("CODEnvio") REFERENCES public."Envio"("COD");


--
-- TOC entry 3019 (class 2606 OID 21313)
-- Name: Pago-Metodo CODPago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODPago" FOREIGN KEY ("CODPago") REFERENCES public."Pago"("COD");


--
-- TOC entry 3032 (class 2606 OID 21318)
-- Name: Rol-Accion CODRol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODRol" FOREIGN KEY ("CODRol") REFERENCES public."Rol"("COD");


--
-- TOC entry 3053 (class 2606 OID 21323)
-- Name: Veh-Rut CODRuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "CODRuta" FOREIGN KEY ("CODRuta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 3011 (class 2606 OID 21328)
-- Name: Mantenimiento CODTaller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "CODTaller" FOREIGN KEY ("CODTaller") REFERENCES public."Taller"("COD");


--
-- TOC entry 3020 (class 2606 OID 21333)
-- Name: Pago-Metodo CODTarjeta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTarjeta" FOREIGN KEY ("CODTarjeta") REFERENCES public."Tarjeta"("COD");


--
-- TOC entry 3021 (class 2606 OID 21338)
-- Name: Pago-Metodo CODTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTrans" FOREIGN KEY ("CODTrans") REFERENCES public."Transferencia"("COD");


--
-- TOC entry 3049 (class 2606 OID 21343)
-- Name: Traslado CODVeh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODVeh-Rut" FOREIGN KEY ("CODVeh-Rut") REFERENCES public."Veh-Rut"("COD");


--
-- TOC entry 2997 (class 2606 OID 21353)
-- Name: Avion FK-Aeropuerto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-Aeropuerto" FOREIGN KEY ("FK-Aeropuerto") REFERENCES public."Aeropuerto"("COD");


--
-- TOC entry 3009 (class 2606 OID 21358)
-- Name: L-VIP FK-CLienteL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "FK-CLienteL" FOREIGN KEY ("FK-ClienteL") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3041 (class 2606 OID 21363)
-- Name: Telefono FK-Cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Cliente" FOREIGN KEY ("FK-Cliente") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3022 (class 2606 OID 21368)
-- Name: Paquete FK-Cliente1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente1" FOREIGN KEY ("FK-Cliente1") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3023 (class 2606 OID 21373)
-- Name: Paquete FK-Cliente2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente2" FOREIGN KEY ("FK-Cliente2") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3003 (class 2606 OID 21378)
-- Name: Efectivo FK-ClienteE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "FK-ClienteE" FOREIGN KEY ("FK-ClienteE") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3001 (class 2606 OID 21383)
-- Name: Cheque FK-ClienteM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "FK-ClienteM" FOREIGN KEY ("FK-ClienteM") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3040 (class 2606 OID 21388)
-- Name: Tarjeta FK-ClienteT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "FK-ClienteT" FOREIGN KEY ("FK-ClienteT") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3047 (class 2606 OID 21393)
-- Name: Transferencia FK-ClienteTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "FK-ClienteTrans" FOREIGN KEY ("FK-ClienteTrans") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3050 (class 2606 OID 21398)
-- Name: Usuario FK-ClienteU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-ClienteU" FOREIGN KEY ("FK-ClienteU") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3042 (class 2606 OID 21403)
-- Name: Telefono FK-Empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Empleado" FOREIGN KEY ("FK-Empleado") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3007 (class 2606 OID 21408)
-- Name: Envio FK-EmpleadoE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EmpleadoE" FOREIGN KEY ("FK-EmpleadoE") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3015 (class 2606 OID 21413)
-- Name: Pago FK-EmpleadoP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EmpleadoP" FOREIGN KEY ("FK-EmpleadoP") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3051 (class 2606 OID 21423)
-- Name: Usuario FK-EmpleadoU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-EmpleadoU" FOREIGN KEY ("FK-EmpleadoU") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3016 (class 2606 OID 21428)
-- Name: Pago FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3024 (class 2606 OID 21433)
-- Name: Paquete FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3025 (class 2606 OID 21438)
-- Name: Paquete FK-EnvioPa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioPa" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3008 (class 2606 OID 21443)
-- Name: Envio FK-EstatusE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EstatusE" FOREIGN KEY ("FK-EstatusE") REFERENCES public."Estatus"("COD");


--
-- TOC entry 3004 (class 2606 OID 21448)
-- Name: Empleado FK-GastosE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-GastosE" FOREIGN KEY ("FK-GastosE") REFERENCES public."Gastos"("COD");


--
-- TOC entry 3036 (class 2606 OID 21453)
-- Name: Servicio FK-GastosS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "FK-GastosS" FOREIGN KEY ("FK-GastosS") REFERENCES public."Gastos"("COD");


--
-- TOC entry 3005 (class 2606 OID 21458)
-- Name: Empleado FK-HorarioEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-HorarioEmp" FOREIGN KEY ("FK-HorarioEmp") REFERENCES public."Horario"("COD");


--
-- TOC entry 2995 (class 2606 OID 21463)
-- Name: Aeropuerto FK-LugarAe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-LugarAe" FOREIGN KEY ("FK-LugarAe") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3002 (class 2606 OID 21468)
-- Name: Cliente FK-LugarC; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "FK-LugarC" FOREIGN KEY ("FK-LugarC") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3010 (class 2606 OID 21473)
-- Name: Lugar FK-LugarL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "FK-LugarL" FOREIGN KEY ("Fk-LugarL") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3028 (class 2606 OID 21478)
-- Name: Puerto FK-LugarP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-LugarP" FOREIGN KEY ("FK-LugarP") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3037 (class 2606 OID 21483)
-- Name: Sucursal FK-LugarS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "FK-LugarS" FOREIGN KEY ("FK-LugarS") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3038 (class 2606 OID 21488)
-- Name: Taller FK-LugarT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-LugarT" FOREIGN KEY ("FK-LugarT") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2998 (class 2606 OID 21498)
-- Name: Avion FK-ModeloA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-ModeloA" FOREIGN KEY ("FK-ModeloA") REFERENCES public."Modelo"("COD");


--
-- TOC entry 2999 (class 2606 OID 21503)
-- Name: Barco FK-ModeloB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-ModeloB" FOREIGN KEY ("FK-ModeloB") REFERENCES public."Modelo"("COD");


--
-- TOC entry 3044 (class 2606 OID 21508)
-- Name: Terrestre FK-ModeloT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-ModeloT" FOREIGN KEY ("FK-ModeloT") REFERENCES public."Modelo"("COD");


--
-- TOC entry 3000 (class 2606 OID 21513)
-- Name: Barco FK-PuertoB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-PuertoB" FOREIGN KEY ("FK-PuertoB") REFERENCES public."Puerto"("COD");


--
-- TOC entry 3052 (class 2606 OID 21518)
-- Name: Usuario FK-RolU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-RolU" FOREIGN KEY ("FK-RolU") REFERENCES public."Rol"("COD");


--
-- TOC entry 3033 (class 2606 OID 21523)
-- Name: Ruta FK-Ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Ruta" FOREIGN KEY ("FK-Ruta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 3026 (class 2606 OID 21528)
-- Name: Paquete FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3029 (class 2606 OID 21533)
-- Name: Puerto FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3034 (class 2606 OID 21538)
-- Name: Ruta FK-Sucursal1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal1" FOREIGN KEY ("FK-Sucursal1") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3035 (class 2606 OID 21543)
-- Name: Ruta FK-Sucursal2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal2" FOREIGN KEY ("FK-Sucursal2") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2996 (class 2606 OID 21548)
-- Name: Aeropuerto FK-SucursalA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-SucursalA" FOREIGN KEY ("FK-SucursalA") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3006 (class 2606 OID 21553)
-- Name: Empleado FK-SucursalEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-SucursalEmp" FOREIGN KEY ("FK-SucursalEmp") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3030 (class 2606 OID 21563)
-- Name: Puerto FK-SucursalPu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-SucursalPu" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3043 (class 2606 OID 21568)
-- Name: Telefono FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3045 (class 2606 OID 21573)
-- Name: Terrestre FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3046 (class 2606 OID 21578)
-- Name: Terrestre FK-SucursalTe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalTe" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3057 (class 2606 OID 21583)
-- Name: Zona FK-SucursalZ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "FK-SucursalZ" FOREIGN KEY ("FK-SucursalZ") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3039 (class 2606 OID 21588)
-- Name: Taller FK-TelefonoT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-TelefonoT" FOREIGN KEY ("FK-TelefonoT") REFERENCES public."Telefono"("COD");


--
-- TOC entry 3027 (class 2606 OID 21593)
-- Name: Paquete FK-TipoPaquete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-TipoPaquete" FOREIGN KEY ("FK-TipoPaquete") REFERENCES public."TipoPaquete"("COD");


--
-- TOC entry 3012 (class 2606 OID 21598)
-- Name: Mantenimiento PlacaA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaA" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 3054 (class 2606 OID 21603)
-- Name: Veh-Rut PlacaA-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaA-Veh-Rut" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 3013 (class 2606 OID 21608)
-- Name: Mantenimiento PlacaB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaB" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 3055 (class 2606 OID 21613)
-- Name: Veh-Rut PlacaB-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaB-Veh-Rut" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 3014 (class 2606 OID 21618)
-- Name: Mantenimiento PlacaT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaT" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


--
-- TOC entry 3056 (class 2606 OID 21623)
-- Name: Veh-Rut PlacaT-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaT-Veh-Rut" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


-- Completed on 2018-12-13 18:29:34

--
-- PostgreSQL database dump complete
--

