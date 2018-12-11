--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-11 00:00:10

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
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3201 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 17111)
-- Name: Accion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Accion" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Accion" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17119)
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
-- TOC entry 198 (class 1259 OID 17124)
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
-- TOC entry 199 (class 1259 OID 17130)
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
    "FK-ModeloA" integer NOT NULL,
    "FK-Aeropuerto" integer NOT NULL,
    "Placa" character varying NOT NULL
);


ALTER TABLE public."Avion" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17140)
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
    "FK-ModeloB" integer NOT NULL,
    "FK-PuertoB" integer NOT NULL
);


ALTER TABLE public."Barco" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17148)
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
-- TOC entry 202 (class 1259 OID 17156)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cliente" (
    "CI" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "Apellido" character varying NOT NULL,
    "FechaNac" date NOT NULL,
    "EstadoCivil" character varying NOT NULL,
    "Trabajo" character varying NOT NULL,
    "FK-LugarC" integer NOT NULL
);


ALTER TABLE public."Cliente" OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17369)
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
-- TOC entry 203 (class 1259 OID 17164)
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
    "HorarioAsig" character varying NOT NULL,
    "SalarioAsig" integer NOT NULL,
    "FechaContratado" date,
    "FechaFinal" date,
    "FK-GastosE" integer NOT NULL,
    "FK-SucursalEmp" integer NOT NULL
);


ALTER TABLE public."Empleado" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17172)
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
-- TOC entry 205 (class 1259 OID 17180)
-- Name: Estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estatus" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Estatus" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17188)
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
-- TOC entry 207 (class 1259 OID 17197)
-- Name: L-VIP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."L-VIP" (
    "NroCarnet" integer NOT NULL,
    "FK-ClienteL" integer NOT NULL
);


ALTER TABLE public."L-VIP" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17202)
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
-- TOC entry 209 (class 1259 OID 17210)
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
-- TOC entry 210 (class 1259 OID 17218)
-- Name: Marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marca" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Marca" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 17226)
-- Name: Modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Modelo" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-MarcaM" integer NOT NULL
);


ALTER TABLE public."Modelo" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 17241)
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
-- TOC entry 212 (class 1259 OID 17236)
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
-- TOC entry 214 (class 1259 OID 17246)
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
-- TOC entry 215 (class 1259 OID 17252)
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
-- TOC entry 216 (class 1259 OID 17260)
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17268)
-- Name: Rol-Accion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol-Accion" (
    "COD" integer NOT NULL,
    "CODRol" integer NOT NULL,
    "CODAccion" integer NOT NULL
);


ALTER TABLE public."Rol-Accion" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17273)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ruta" (
    "COD" integer NOT NULL,
    "FK-Sucursal1" integer NOT NULL,
    "Fk-Sucursal2" integer NOT NULL,
    "FK-Ruta" integer
);


ALTER TABLE public."Ruta" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17278)
-- Name: Servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Servicio" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-GastosS" integer NOT NULL
);


ALTER TABLE public."Servicio" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17286)
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
-- TOC entry 221 (class 1259 OID 17294)
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
-- TOC entry 222 (class 1259 OID 17302)
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
-- TOC entry 223 (class 1259 OID 17310)
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
-- TOC entry 224 (class 1259 OID 17316)
-- Name: Terrestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Terrestre" (
    "Placa" character varying NOT NULL,
    "SerialMotor" integer NOT NULL,
    "Capacidad" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Descripcion" character varying NOT NULL,
    "SerialCarroceria" integer NOT NULL,
    "FechaCreacion" date NOT NULL,
    "Tipo" character varying NOT NULL,
    "FK-SucursalT" integer NOT NULL,
    "FK-ModeloT" integer NOT NULL
);


ALTER TABLE public."Terrestre" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17324)
-- Name: TipoPaquete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoPaquete" (
    "COD" integer NOT NULL,
    "Clasificacion" character varying NOT NULL
);


ALTER TABLE public."TipoPaquete" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17332)
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
-- TOC entry 227 (class 1259 OID 17340)
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
-- TOC entry 228 (class 1259 OID 17345)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "Nombre" character varying NOT NULL,
    "Contrasena" character varying NOT NULL,
    "FK-RolU" integer NOT NULL,
    "FK-ClienteU" integer NOT NULL,
    "FK-EmpleadoU" integer NOT NULL
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17353)
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
-- TOC entry 230 (class 1259 OID 17361)
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
-- TOC entry 3158 (class 0 OID 17111)
-- Dependencies: 196
-- Data for Name: Accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Accion" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 17119)
-- Dependencies: 197
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Aeropuerto" ("COD", "CantTerminales", "CantPistas", "Capacidad", "FK-SucursalA", "FK-LugarAe") FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 17124)
-- Dependencies: 198
-- Data for Name: Asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Asistencia" ("COD", "CIEmpleado", "CODZona", "HoraEntrada", "HoraSalida") FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 17130)
-- Dependencies: 199
-- Data for Name: Avion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Avion" ("SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Longitud", "PesoVacio", "Envergadura", "PesoMax", "Altura", "AnchoCabina", "CapacidadCombustible", "CarreraDespegue", "DiametroFuselaje", "FK-ModeloA", "FK-Aeropuerto", "Placa") FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 17140)
-- Dependencies: 200
-- Data for Name: Barco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Barco" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Nombre", "FK-ModeloB", "FK-PuertoB") FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 17148)
-- Dependencies: 201
-- Data for Name: Cheque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cheque" ("COD", "Banco", "NroCuenta", "Fecha", "Monto", "FK-ClienteM", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 17156)
-- Dependencies: 202
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cliente" ("CI", "Nombre", "Apellido", "FechaNac", "EstadoCivil", "Trabajo", "FK-LugarC") FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 17369)
-- Dependencies: 231
-- Data for Name: Efectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Efectivo" ("COD", "Descripcion", "Moneda", "FK-ClienteE") FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 17164)
-- Dependencies: 203
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Empleado" ("CI", "Nombre", "Apellido", "FechaNac", "Correo", "NivelAca", "Profesion", "EstadoCivil", "CantHijos", "CorreoEmpresa", "HorarioAsig", "SalarioAsig", "FechaContratado", "FechaFinal", "FK-GastosE", "FK-SucursalEmp") FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 17172)
-- Dependencies: 204
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Envio" ("COD", "FechaInicio", "FechaLlegada", "Origen", "Destino", "Monto", "FK-EmpleadoE", "FK-EstatusE") FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 17180)
-- Dependencies: 205
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estatus" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 17188)
-- Dependencies: 206
-- Data for Name: Gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 17197)
-- Dependencies: 207
-- Data for Name: L-VIP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."L-VIP" ("NroCarnet", "FK-ClienteL") FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 17202)
-- Dependencies: 208
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Lugar" ("COD", "Tipo", "Nombre", "Fk-LugarL") FROM stdin;
1601	Estado	Amazonas	\N
1602	Estado	Anzoátegui	\N
1603	Estado	Apure	\N
1604	Estado	Aragua	\N
1605	Estado	Barinas	\N
1606	Estado	Bolívar	\N
1607	Estado	Carabobo	\N
1608	Estado	Cojedes	\N
1609	Estado	Delta Amacuro	\N
1610	Estado	Falcón	\N
1611	Estado	Guárico	\N
1612	Estado	Lara	\N
1613	Estado	Mérida	\N
1614	Estado	Miranda	\N
1615	Estado	Monagas	\N
1616	Estado	Nueva Esparta	\N
1617	Estado	Portuguesa	\N
1618	Estado	Sucre	\N
1619	Estado	Táchira	\N
1620	Estado	Trujillo	\N
1621	Estado	Vargas	\N
1622	Estado	Yaracuy	\N
1623	Estado	Zulia	\N
1624	Estado	Distrito Capital	\N
1625	Estado	Dependencias Federales	\N
1	Municipio	Alto Orinoco	1601
2	Municipio	Atabapo	1601
3	Municipio	Atures	1601
4	Municipio	Autana	1601
5	Municipio	Manapiare	1601
6	Municipio	Maroa	1601
7	Municipio	Río Negro	1601
8	Municipio	Anaco	1602
9	Municipio	Aragua	1602
10	Municipio	Manuel Ezequiel Bruzual	1602
11	Municipio	Diego Bautista Urbaneja	1602
12	Municipio	Fernando Peñalver	1602
13	Municipio	Francisco Del Carmen Carvajal	1602
14	Municipio	General Sir Arthur McGregor	1602
15	Municipio	Guanta	1602
16	Municipio	Independencia	1602
17	Municipio	José Gregorio Monagas	1602
18	Municipio	Juan Antonio Sotillo	1602
19	Municipio	Juan Manuel Cajigal	1602
20	Municipio	Libertad	1602
21	Municipio	Francisco de Miranda	1602
22	Municipio	Pedro María Freites	1602
23	Municipio	Píritu	1602
24	Municipio	San José de Guanipa	1602
25	Municipio	San Juan de Capistrano	1602
26	Municipio	Santa Ana	1602
27	Municipio	Simón Bolívar	1602
28	Municipio	Simón Rodríguez	1602
29	Municipio	Achaguas	1603
30	Municipio	Biruaca	1603
31	Municipio	Muñóz	1603
32	Municipio	Páez	1603
33	Municipio	Pedro Camejo	1603
34	Municipio	Rómulo Gallegos	1603
35	Municipio	San Fernando	1603
36	Municipio	Atanasio Girardot	1604
37	Municipio	Bolívar	1604
38	Municipio	Camatagua	1604
39	Municipio	Francisco Linares Alcántara	1604
40	Municipio	José Ángel Lamas	1604
41	Municipio	José Félix Ribas	1604
42	Municipio	José Rafael Revenga	1604
43	Municipio	Libertador	1604
44	Municipio	Mario Briceño Iragorry	1604
45	Municipio	Ocumare de la Costa de Oro	1604
46	Municipio	San Casimiro	1604
47	Municipio	San Sebastián	1604
48	Municipio	Santiago Mariño	1604
49	Municipio	Santos Michelena	1604
50	Municipio	Sucre	1604
51	Municipio	Tovar	1604
52	Municipio	Urdaneta	1604
53	Municipio	Zamora	1604
54	Municipio	Alberto Arvelo Torrealba	1605
55	Municipio	Andrés Eloy Blanco	1605
56	Municipio	Antonio José de Sucre	1605
57	Municipio	Arismendi	1605
58	Municipio	Barinas	1605
59	Municipio	Bolívar	1605
60	Municipio	Cruz Paredes	1605
61	Municipio	Ezequiel Zamora	1605
62	Municipio	Obispos	1605
63	Municipio	Pedraza	1605
64	Municipio	Rojas	1605
65	Municipio	Sosa	1605
66	Municipio	Caroní	1606
67	Municipio	Cedeño	1606
68	Municipio	El Callao	1606
69	Municipio	Gran Sabana	1606
70	Municipio	Heres	1606
71	Municipio	Piar	1606
72	Municipio	Angostura (Raúl Leoni)	1606
73	Municipio	Roscio	1606
74	Municipio	Sifontes	1606
75	Municipio	Sucre	1606
76	Municipio	Padre Pedro Chien	1606
77	Municipio	Bejuma	1607
78	Municipio	Carlos Arvelo	1607
79	Municipio	Diego Ibarra	1607
80	Municipio	Guacara	1607
81	Municipio	Juan José Mora	1607
82	Municipio	Libertador	1607
83	Municipio	Los Guayos	1607
84	Municipio	Miranda	1607
85	Municipio	Montalbán	1607
86	Municipio	Naguanagua	1607
87	Municipio	Puerto Cabello	1607
88	Municipio	San Diego	1607
89	Municipio	San Joaquín	1607
90	Municipio	Valencia	1607
91	Municipio	Anzoátegui	1608
92	Municipio	Tinaquillo	1608
93	Municipio	Girardot	1608
94	Municipio	Lima Blanco	1608
95	Municipio	Pao de San Juan Bautista	1608
96	Municipio	Ricaurte	1608
97	Municipio	Rómulo Gallegos	1608
98	Municipio	San Carlos	1608
99	Municipio	Tinaco	1608
100	Municipio	Antonio Díaz	1609
101	Municipio	Casacoima	1609
102	Municipio	Pedernales	1609
103	Municipio	Tucupita	1609
104	Municipio	Acosta	1610
105	Municipio	Bolívar	1610
106	Municipio	Buchivacoa	1610
107	Municipio	Cacique Manaure	1610
108	Municipio	Carirubana	1610
109	Municipio	Colina	1610
110	Municipio	Dabajuro	1610
111	Municipio	Democracia	1610
112	Municipio	Falcón	1610
113	Municipio	Federación	1610
114	Municipio	Jacura	1610
115	Municipio	José Laurencio Silva	1610
116	Municipio	Los Taques	1610
117	Municipio	Mauroa	1610
118	Municipio	Miranda	1610
119	Municipio	Monseñor Iturriza	1610
120	Municipio	Palmasola	1610
121	Municipio	Petit	1610
122	Municipio	Píritu	1610
123	Municipio	San Francisco	1610
124	Municipio	Sucre	1610
125	Municipio	Tocópero	1610
126	Municipio	Unión	1610
127	Municipio	Urumaco	1610
128	Municipio	Zamora	1610
129	Municipio	Camaguán	1611
130	Municipio	Chaguaramas	1611
131	Municipio	El Socorro	1611
132	Municipio	José Félix Ribas	1611
133	Municipio	José Tadeo Monagas	1611
134	Municipio	Juan Germán Roscio	1611
135	Municipio	Julián Mellado	1611
136	Municipio	Las Mercedes	1611
137	Municipio	Leonardo Infante	1611
138	Municipio	Pedro Zaraza	1611
139	Municipio	Ortíz	1611
140	Municipio	San Gerónimo de Guayabal	1611
141	Municipio	San José de Guaribe	1611
142	Municipio	Santa María de Ipire	1611
143	Municipio	Sebastián Francisco de Miranda	1611
144	Municipio	Andrés Eloy Blanco	1612
145	Municipio	Crespo	1612
146	Municipio	Iribarren	1612
147	Municipio	Jiménez	1612
148	Municipio	Morán	1612
149	Municipio	Palavecino	1612
150	Municipio	Simón Planas	1612
151	Municipio	Torres	1612
152	Municipio	Urdaneta	1612
179	Municipio	Alberto Adriani	1613
180	Municipio	Andrés Bello	1613
181	Municipio	Antonio Pinto Salinas	1613
182	Municipio	Aricagua	1613
183	Municipio	Arzobispo Chacón	1613
184	Municipio	Campo Elías	1613
185	Municipio	Caracciolo Parra Olmedo	1613
186	Municipio	Cardenal Quintero	1613
187	Municipio	Guaraque	1613
188	Municipio	Julio César Salas	1613
189	Municipio	Justo Briceño	1613
190	Municipio	Libertador	1613
191	Municipio	Miranda	1613
192	Municipio	Obispo Ramos de Lora	1613
193	Municipio	Padre Noguera	1613
194	Municipio	Pueblo Llano	1613
195	Municipio	Rangel	1613
196	Municipio	Rivas Dávila	1613
197	Municipio	Santos Marquina	1613
198	Municipio	Sucre	1613
199	Municipio	Tovar	1613
200	Municipio	Tulio Febres Cordero	1613
201	Municipio	Zea	1613
223	Municipio	Acevedo	1614
224	Municipio	Andrés Bello	1614
225	Municipio	Baruta	1614
226	Municipio	Brión	1614
227	Municipio	Buroz	1614
228	Municipio	Carrizal	1614
229	Municipio	Chacao	1614
230	Municipio	Cristóbal Rojas	1614
231	Municipio	El Hatillo	1614
232	Municipio	Guaicaipuro	1614
233	Municipio	Independencia	1614
234	Municipio	Lander	1614
235	Municipio	Los Salias	1614
236	Municipio	Páez	1614
237	Municipio	Paz Castillo	1614
238	Municipio	Pedro Gual	1614
239	Municipio	Plaza	1614
240	Municipio	Simón Bolívar	1614
241	Municipio	Sucre	1614
242	Municipio	Urdaneta	1614
243	Municipio	Zamora	1614
258	Municipio	Acosta	1615
259	Municipio	Aguasay	1615
260	Municipio	Bolívar	1615
261	Municipio	Caripe	1615
262	Municipio	Cedeño	1615
263	Municipio	Ezequiel Zamora	1615
264	Municipio	Libertador	1615
265	Municipio	Maturín	1615
266	Municipio	Piar	1615
267	Municipio	Punceres	1615
268	Municipio	Santa Bárbara	1615
269	Municipio	Sotillo	1615
270	Municipio	Uracoa	1615
271	Municipio	Antolín del Campo	1616
272	Municipio	Arismendi	1616
273	Municipio	García	1616
274	Municipio	Gómez	1616
275	Municipio	Maneiro	1616
276	Municipio	Marcano	1616
277	Municipio	Mariño	1616
278	Municipio	Península de Macanao	1616
279	Municipio	Tubores	1616
280	Municipio	Villalba	1616
281	Municipio	Díaz	1616
282	Municipio	Agua Blanca	1617
283	Municipio	Araure	1617
284	Municipio	Esteller	1617
285	Municipio	Guanare	1617
286	Municipio	Guanarito	1617
287	Municipio	Monseñor José Vicente de Unda	1617
288	Municipio	Ospino	1617
289	Municipio	Páez	1617
290	Municipio	Papelón	1617
291	Municipio	San Genaro de Boconoíto	1617
292	Municipio	San Rafael de Onoto	1617
293	Municipio	Santa Rosalía	1617
294	Municipio	Sucre	1617
295	Municipio	Turén	1617
296	Municipio	Andrés Eloy Blanco	1618
297	Municipio	Andrés Mata	1618
298	Municipio	Arismendi	1618
299	Municipio	Benítez	1618
300	Municipio	Bermúdez	1618
301	Municipio	Bolívar	1618
302	Municipio	Cajigal	1618
303	Municipio	Cruz Salmerón Acosta	1618
304	Municipio	Libertador	1618
305	Municipio	Mariño	1618
306	Municipio	Mejía	1618
307	Municipio	Montes	1618
308	Municipio	Ribero	1618
309	Municipio	Sucre	1618
310	Municipio	Valdéz	1618
341	Municipio	Andrés Bello	1619
342	Municipio	Antonio Rómulo Costa	1619
343	Municipio	Ayacucho	1619
344	Municipio	Bolívar	1619
345	Municipio	Cárdenas	1619
346	Municipio	Córdoba	1619
347	Municipio	Fernández Feo	1619
348	Municipio	Francisco de Miranda	1619
349	Municipio	García de Hevia	1619
350	Municipio	Guásimos	1619
351	Municipio	Independencia	1619
352	Municipio	Jáuregui	1619
353	Municipio	José María Vargas	1619
354	Municipio	Junín	1619
355	Municipio	Libertad	1619
356	Municipio	Libertador	1619
357	Municipio	Lobatera	1619
358	Municipio	Michelena	1619
359	Municipio	Panamericano	1619
360	Municipio	Pedro María Ureña	1619
361	Municipio	Rafael Urdaneta	1619
362	Municipio	Samuel Darío Maldonado	1619
363	Municipio	San Cristóbal	1619
364	Municipio	Seboruco	1619
365	Municipio	Simón Rodríguez	1619
366	Municipio	Sucre	1619
367	Municipio	Torbes	1619
368	Municipio	Uribante	1619
369	Municipio	San Judas Tadeo	1619
370	Municipio	Andrés Bello	1620
371	Municipio	Boconó	1620
372	Municipio	Bolívar	1620
373	Municipio	Candelaria	1620
374	Municipio	Carache	1620
375	Municipio	Escuque	1620
376	Municipio	José Felipe Márquez Cañizalez	1620
377	Municipio	Juan Vicente Campos Elías	1620
378	Municipio	La Ceiba	1620
379	Municipio	Miranda	1620
380	Municipio	Monte Carmelo	1620
381	Municipio	Motatán	1620
382	Municipio	Pampán	1620
383	Municipio	Pampanito	1620
384	Municipio	Rafael Rangel	1620
385	Municipio	San Rafael de Carvajal	1620
386	Municipio	Sucre	1620
387	Municipio	Trujillo	1620
388	Municipio	Urdaneta	1620
389	Municipio	Valera	1620
390	Municipio	Vargas	1621
391	Municipio	Arístides Bastidas	1622
392	Municipio	Bolívar	1622
407	Municipio	Bruzual	1622
408	Municipio	Cocorote	1622
409	Municipio	Independencia	1622
410	Municipio	José Antonio Páez	1622
411	Municipio	La Trinidad	1622
412	Municipio	Manuel Monge	1622
413	Municipio	Nirgua	1622
414	Municipio	Peña	1622
415	Municipio	San Felipe	1622
416	Municipio	Sucre	1622
417	Municipio	Urachiche	1622
418	Municipio	José Joaquín Veroes	1622
441	Municipio	Almirante Padilla	1623
442	Municipio	Baralt	1623
443	Municipio	Cabimas	1623
444	Municipio	Catatumbo	1623
445	Municipio	Colón	1623
446	Municipio	Francisco Javier Pulgar	1623
447	Municipio	Páez	1623
448	Municipio	Jesús Enrique Losada	1623
449	Municipio	Jesús María Semprún	1623
450	Municipio	La Cañada de Urdaneta	1623
451	Municipio	Lagunillas	1623
452	Municipio	Machiques de Perijá	1623
453	Municipio	Mara	1623
454	Municipio	Maracaibo	1623
455	Municipio	Miranda	1623
456	Municipio	Rosario de Perijá	1623
457	Municipio	San Francisco	1623
458	Municipio	Santa Rita	1623
459	Municipio	Simón Bolívar	1623
460	Municipio	Sucre	1623
461	Municipio	Valmore Rodríguez	1623
462	Municipio	Libertador	1624
463	Parroquia	Alto Orinoco	1
464	Parroquia	Huachamacare Acanaña	1
465	Parroquia	Marawaka Toky Shamanaña	1
466	Parroquia	Mavaka Mavaka	1
467	Parroquia	Sierra Parima Parimabé	1
468	Parroquia	Ucata Laja Lisa	2
469	Parroquia	Yapacana Macuruco	2
470	Parroquia	Caname Guarinuma	2
471	Parroquia	Fernando Girón Tovar	3
472	Parroquia	Luis Alberto Gómez	3
473	Parroquia	Pahueña Limón de Parhueña	3
474	Parroquia	Platanillal Platanillal	3
475	Parroquia	Samariapo	4
476	Parroquia	Sipapo	4
477	Parroquia	Munduapo	4
478	Parroquia	Guayapo	4
479	Parroquia	Alto Ventuari	5
480	Parroquia	Medio Ventuari	5
481	Parroquia	Bajo Ventuari	5
482	Parroquia	Victorino	6
483	Parroquia	Comunidad	6
484	Parroquia	Casiquiare	7
485	Parroquia	Cocuy	7
486	Parroquia	San Carlos de Río Negro	7
487	Parroquia	Solano	7
488	Parroquia	Anaco	8
489	Parroquia	San Joaquín	8
490	Parroquia	Cachipo	9
491	Parroquia	Aragua de Barcelona	9
492	Parroquia	Lechería	11
493	Parroquia	El Morro	11
494	Parroquia	Puerto Píritu	12
495	Parroquia	San Miguel	12
496	Parroquia	Sucre	12
497	Parroquia	Valle de Guanape	13
498	Parroquia	Santa Bárbara	13
499	Parroquia	El Chaparro	14
500	Parroquia	Tomás Alfaro	14
501	Parroquia	Calatrava	14
502	Parroquia	Guanta	15
503	Parroquia	Chorrerón	15
504	Parroquia	Mamo	16
505	Parroquia	Soledad	16
506	Parroquia	Mapire	17
507	Parroquia	Piar	17
508	Parroquia	Santa Clara	17
509	Parroquia	San Diego de Cabrutica	17
510	Parroquia	Uverito	17
511	Parroquia	Zuata	17
512	Parroquia	Puerto La Cruz	18
513	Parroquia	Pozuelos	18
514	Parroquia	Onoto	19
515	Parroquia	San Pablo	19
516	Parroquia	San Mateo	20
517	Parroquia	El Carito	20
518	Parroquia	Santa Inés	20
519	Parroquia	La Romereña	20
520	Parroquia	Atapirire	21
521	Parroquia	Boca del Pao	21
522	Parroquia	El Pao	21
523	Parroquia	Pariaguán	21
524	Parroquia	Cantaura	22
525	Parroquia	Libertador	22
526	Parroquia	Santa Rosa	22
527	Parroquia	Urica	22
528	Parroquia	Píritu	23
529	Parroquia	San Francisco	23
530	Parroquia	San José de Guanipa	24
531	Parroquia	Boca de Uchire	25
532	Parroquia	Boca de Chávez	25
533	Parroquia	Pueblo Nuevo	26
534	Parroquia	Santa Ana	26
535	Parroquia	Bergantín	27
536	Parroquia	Caigua	27
537	Parroquia	El Carmen	27
538	Parroquia	El Pilar	27
539	Parroquia	Naricual	27
540	Parroquia	San Crsitóbal	27
541	Parroquia	Edmundo Barrios	28
542	Parroquia	Miguel Otero Silva	28
543	Parroquia	Achaguas	29
544	Parroquia	Apurito	29
545	Parroquia	El Yagual	29
546	Parroquia	Guachara	29
547	Parroquia	Mucuritas	29
548	Parroquia	Queseras del medio	29
549	Parroquia	Biruaca	30
550	Parroquia	Bruzual	31
551	Parroquia	Mantecal	31
552	Parroquia	Quintero	31
553	Parroquia	Rincón Hondo	31
554	Parroquia	San Vicente	31
555	Parroquia	Guasdualito	32
556	Parroquia	Aramendi	32
557	Parroquia	El Amparo	32
558	Parroquia	San Camilo	32
559	Parroquia	Urdaneta	32
560	Parroquia	San Juan de Payara	33
561	Parroquia	Codazzi	33
562	Parroquia	Cunaviche	33
563	Parroquia	Elorza	34
564	Parroquia	La Trinidad	34
565	Parroquia	San Fernando	35
566	Parroquia	El Recreo	35
567	Parroquia	Peñalver	35
568	Parroquia	San Rafael de Atamaica	35
569	Parroquia	Pedro José Ovalles	36
570	Parroquia	Joaquín Crespo	36
571	Parroquia	José Casanova Godoy	36
572	Parroquia	Madre María de San José	36
573	Parroquia	Andrés Eloy Blanco	36
574	Parroquia	Los Tacarigua	36
575	Parroquia	Las Delicias	36
576	Parroquia	Choroní	36
577	Parroquia	Bolívar	37
578	Parroquia	Camatagua	38
579	Parroquia	Carmen de Cura	38
580	Parroquia	Santa Rita	39
581	Parroquia	Francisco de Miranda	39
582	Parroquia	Moseñor Feliciano González	39
583	Parroquia	Santa Cruz	40
584	Parroquia	José Félix Ribas	41
585	Parroquia	Castor Nieves Ríos	41
586	Parroquia	Las Guacamayas	41
587	Parroquia	Pao de Zárate	41
588	Parroquia	Zuata	41
589	Parroquia	José Rafael Revenga	42
590	Parroquia	Palo Negro	43
591	Parroquia	San Martín de Porres	43
592	Parroquia	El Limón	44
593	Parroquia	Caña de Azúcar	44
594	Parroquia	Ocumare de la Costa	45
595	Parroquia	San Casimiro	46
596	Parroquia	Güiripa	46
597	Parroquia	Ollas de Caramacate	46
598	Parroquia	Valle Morín	46
599	Parroquia	San Sebastían	47
600	Parroquia	Turmero	48
601	Parroquia	Arevalo Aponte	48
602	Parroquia	Chuao	48
603	Parroquia	Samán de Güere	48
604	Parroquia	Alfredo Pacheco Miranda	48
605	Parroquia	Santos Michelena	49
606	Parroquia	Tiara	49
607	Parroquia	Cagua	50
608	Parroquia	Bella Vista	50
609	Parroquia	Tovar	51
610	Parroquia	Urdaneta	52
611	Parroquia	Las Peñitas	52
612	Parroquia	San Francisco de Cara	52
613	Parroquia	Taguay	52
614	Parroquia	Zamora	53
615	Parroquia	Magdaleno	53
616	Parroquia	San Francisco de Asís	53
617	Parroquia	Valles de Tucutunemo	53
618	Parroquia	Augusto Mijares	53
619	Parroquia	Sabaneta	54
620	Parroquia	Juan Antonio Rodríguez Domínguez	54
621	Parroquia	El Cantón	55
622	Parroquia	Santa Cruz de Guacas	55
623	Parroquia	Puerto Vivas	55
624	Parroquia	Ticoporo	56
625	Parroquia	Nicolás Pulido	56
626	Parroquia	Andrés Bello	56
627	Parroquia	Arismendi	57
628	Parroquia	Guadarrama	57
629	Parroquia	La Unión	57
630	Parroquia	San Antonio	57
631	Parroquia	Barinas	58
632	Parroquia	Alberto Arvelo Larriva	58
633	Parroquia	San Silvestre	58
634	Parroquia	Santa Inés	58
635	Parroquia	Santa Lucía	58
636	Parroquia	Torumos	58
637	Parroquia	El Carmen	58
638	Parroquia	Rómulo Betancourt	58
639	Parroquia	Corazón de Jesús	58
640	Parroquia	Ramón Ignacio Méndez	58
641	Parroquia	Alto Barinas	58
642	Parroquia	Manuel Palacio Fajardo	58
643	Parroquia	Juan Antonio Rodríguez Domínguez	58
644	Parroquia	Dominga Ortiz de Páez	58
645	Parroquia	Barinitas	59
646	Parroquia	Altamira de Cáceres	59
647	Parroquia	Calderas	59
648	Parroquia	Barrancas	60
649	Parroquia	El Socorro	60
650	Parroquia	Mazparrito	60
651	Parroquia	Santa Bárbara	61
652	Parroquia	Pedro Briceño Méndez	61
653	Parroquia	Ramón Ignacio Méndez	61
654	Parroquia	José Ignacio del Pumar	61
655	Parroquia	Obispos	62
656	Parroquia	Guasimitos	62
657	Parroquia	El Real	62
658	Parroquia	La Luz	62
659	Parroquia	Ciudad Bolívia	63
660	Parroquia	José Ignacio Briceño	63
661	Parroquia	José Félix Ribas	63
662	Parroquia	Páez	63
663	Parroquia	Libertad	64
664	Parroquia	Dolores	64
665	Parroquia	Santa Rosa	64
666	Parroquia	Palacio Fajardo	64
667	Parroquia	Ciudad de Nutrias	65
668	Parroquia	El Regalo	65
669	Parroquia	Puerto Nutrias	65
670	Parroquia	Santa Catalina	65
671	Parroquia	Cachamay	66
672	Parroquia	Chirica	66
673	Parroquia	Dalla Costa	66
674	Parroquia	Once de Abril	66
675	Parroquia	Simón Bolívar	66
676	Parroquia	Unare	66
677	Parroquia	Universidad	66
678	Parroquia	Vista al Sol	66
679	Parroquia	Pozo Verde	66
680	Parroquia	Yocoima	66
681	Parroquia	5 de Julio	66
682	Parroquia	Cedeño	67
683	Parroquia	Altagracia	67
684	Parroquia	Ascensión Farreras	67
685	Parroquia	Guaniamo	67
686	Parroquia	La Urbana	67
687	Parroquia	Pijiguaos	67
688	Parroquia	El Callao	68
689	Parroquia	Gran Sabana	69
690	Parroquia	Ikabarú	69
691	Parroquia	Catedral	70
692	Parroquia	Zea	70
693	Parroquia	Orinoco	70
694	Parroquia	José Antonio Páez	70
695	Parroquia	Marhuanta	70
696	Parroquia	Agua Salada	70
697	Parroquia	Vista Hermosa	70
698	Parroquia	La Sabanita	70
699	Parroquia	Panapana	70
700	Parroquia	Andrés Eloy Blanco	71
701	Parroquia	Pedro Cova	71
702	Parroquia	Raúl Leoni	72
703	Parroquia	Barceloneta	72
704	Parroquia	Santa Bárbara	72
705	Parroquia	San Francisco	72
706	Parroquia	Roscio	73
707	Parroquia	Salóm	73
708	Parroquia	Sifontes	74
709	Parroquia	Dalla Costa	74
710	Parroquia	San Isidro	74
711	Parroquia	Sucre	75
712	Parroquia	Aripao	75
713	Parroquia	Guarataro	75
714	Parroquia	Las Majadas	75
715	Parroquia	Moitaco	75
716	Parroquia	Padre Pedro Chien	76
717	Parroquia	Río Grande	76
718	Parroquia	Bejuma	77
719	Parroquia	Canoabo	77
720	Parroquia	Simón Bolívar	77
721	Parroquia	Güigüe	78
722	Parroquia	Carabobo	78
723	Parroquia	Tacarigua	78
724	Parroquia	Mariara	79
725	Parroquia	Aguas Calientes	79
726	Parroquia	Ciudad Alianza	80
727	Parroquia	Guacara	80
728	Parroquia	Yagua	80
729	Parroquia	Morón	81
730	Parroquia	Yagua	81
731	Parroquia	Tocuyito	82
732	Parroquia	Independencia	82
733	Parroquia	Los Guayos	83
734	Parroquia	Miranda	84
735	Parroquia	Montalbán	85
736	Parroquia	Naguanagua	86
737	Parroquia	Bartolomé Salóm	87
738	Parroquia	Democracia	87
739	Parroquia	Fraternidad	87
740	Parroquia	Goaigoaza	87
741	Parroquia	Juan José Flores	87
742	Parroquia	Unión	87
743	Parroquia	Borburata	87
744	Parroquia	Patanemo	87
745	Parroquia	San Diego	88
746	Parroquia	San Joaquín	89
747	Parroquia	Candelaria	90
748	Parroquia	Catedral	90
749	Parroquia	El Socorro	90
750	Parroquia	Miguel Peña	90
751	Parroquia	Rafael Urdaneta	90
752	Parroquia	San Blas	90
753	Parroquia	San José	90
754	Parroquia	Santa Rosa	90
755	Parroquia	Negro Primero	90
756	Parroquia	Cojedes	91
757	Parroquia	Juan de Mata Suárez	91
758	Parroquia	Tinaquillo	92
759	Parroquia	El Baúl	93
760	Parroquia	Sucre	93
761	Parroquia	La Aguadita	94
762	Parroquia	Macapo	94
763	Parroquia	El Pao	95
764	Parroquia	El Amparo	96
765	Parroquia	Libertad de Cojedes	96
766	Parroquia	Rómulo Gallegos	97
767	Parroquia	San Carlos de Austria	98
768	Parroquia	Juan Ángel Bravo	98
769	Parroquia	Manuel Manrique	98
770	Parroquia	General en Jefe José Laurencio Silva	99
771	Parroquia	Curiapo	100
772	Parroquia	Almirante Luis Brión	100
773	Parroquia	Francisco Aniceto Lugo	100
774	Parroquia	Manuel Renaud	100
775	Parroquia	Padre Barral	100
776	Parroquia	Santos de Abelgas	100
777	Parroquia	Imataca	101
778	Parroquia	Cinco de Julio	101
779	Parroquia	Juan Bautista Arismendi	101
780	Parroquia	Manuel Piar	101
781	Parroquia	Rómulo Gallegos	101
782	Parroquia	Pedernales	102
783	Parroquia	Luis Beltrán Prieto Figueroa	102
784	Parroquia	San José (Delta Amacuro)	103
785	Parroquia	José Vidal Marcano	103
786	Parroquia	Juan Millán	103
787	Parroquia	Leonardo Ruíz Pineda	103
788	Parroquia	Mariscal Antonio José de Sucre	103
789	Parroquia	Monseñor Argimiro García	103
790	Parroquia	San Rafael (Delta Amacuro)	103
791	Parroquia	Virgen del Valle	103
792	Parroquia	Clarines	10
793	Parroquia	Guanape	10
794	Parroquia	Sabana de Uchire	10
795	Parroquia	Capadare	104
796	Parroquia	La Pastora	104
797	Parroquia	Libertador	104
798	Parroquia	San Juan de los Cayos	104
799	Parroquia	Aracua	105
800	Parroquia	La Peña	105
801	Parroquia	San Luis	105
802	Parroquia	Bariro	106
803	Parroquia	Borojó	106
804	Parroquia	Capatárida	106
805	Parroquia	Guajiro	106
806	Parroquia	Seque	106
807	Parroquia	Zazárida	106
808	Parroquia	Valle de Eroa	106
809	Parroquia	Cacique Manaure	107
810	Parroquia	Norte	108
811	Parroquia	Carirubana	108
812	Parroquia	Santa Ana	108
813	Parroquia	Urbana Punta Cardón	108
814	Parroquia	La Vela de Coro	109
815	Parroquia	Acurigua	109
816	Parroquia	Guaibacoa	109
817	Parroquia	Las Calderas	109
818	Parroquia	Macoruca	109
819	Parroquia	Dabajuro	110
820	Parroquia	Agua Clara	111
821	Parroquia	Avaria	111
822	Parroquia	Pedregal	111
823	Parroquia	Piedra Grande	111
824	Parroquia	Purureche	111
825	Parroquia	Adaure	112
826	Parroquia	Adícora	112
827	Parroquia	Baraived	112
828	Parroquia	Buena Vista	112
829	Parroquia	Jadacaquiva	112
830	Parroquia	El Vínculo	112
831	Parroquia	El Hato	112
832	Parroquia	Moruy	112
833	Parroquia	Pueblo Nuevo	112
834	Parroquia	Agua Larga	113
835	Parroquia	El Paují	113
836	Parroquia	Independencia	113
837	Parroquia	Mapararí	113
838	Parroquia	Agua Linda	114
839	Parroquia	Araurima	114
840	Parroquia	Jacura	114
841	Parroquia	Tucacas	115
842	Parroquia	Boca de Aroa	115
843	Parroquia	Los Taques	116
844	Parroquia	Judibana	116
845	Parroquia	Mene de Mauroa	117
846	Parroquia	San Félix	117
847	Parroquia	Casigua	117
848	Parroquia	Guzmán Guillermo	118
849	Parroquia	Mitare	118
850	Parroquia	Río Seco	118
851	Parroquia	Sabaneta	118
852	Parroquia	San Antonio	118
853	Parroquia	San Gabriel	118
854	Parroquia	Santa Ana	118
855	Parroquia	Boca del Tocuyo	119
856	Parroquia	Chichiriviche	119
857	Parroquia	Tocuyo de la Costa	119
858	Parroquia	Palmasola	120
859	Parroquia	Cabure	121
860	Parroquia	Colina	121
861	Parroquia	Curimagua	121
862	Parroquia	San José de la Costa	122
863	Parroquia	Píritu	122
864	Parroquia	San Francisco	123
865	Parroquia	Sucre	124
866	Parroquia	Pecaya	124
867	Parroquia	Tocópero	125
868	Parroquia	El Charal	126
869	Parroquia	Las Vegas del Tuy	126
870	Parroquia	Santa Cruz de Bucaral	126
871	Parroquia	Bruzual	127
872	Parroquia	Urumaco	127
873	Parroquia	Puerto Cumarebo	128
874	Parroquia	La Ciénaga	128
875	Parroquia	La Soledad	128
876	Parroquia	Pueblo Cumarebo	128
877	Parroquia	Zazárida	128
878	Parroquia	Churuguara	113
879	Parroquia	Camaguán	129
880	Parroquia	Puerto Miranda	129
881	Parroquia	Uverito	129
882	Parroquia	Chaguaramas	130
883	Parroquia	El Socorro	131
884	Parroquia	Tucupido	132
885	Parroquia	San Rafael de Laya	132
886	Parroquia	Altagracia de Orituco	133
887	Parroquia	San Rafael de Orituco	133
888	Parroquia	San Francisco Javier de Lezama	133
889	Parroquia	Paso Real de Macaira	133
890	Parroquia	Carlos Soublette	133
891	Parroquia	San Francisco de Macaira	133
892	Parroquia	Libertad de Orituco	133
893	Parroquia	Cantaclaro	134
894	Parroquia	San Juan de los Morros	134
895	Parroquia	Parapara	134
896	Parroquia	El Sombrero	135
897	Parroquia	Sosa	135
898	Parroquia	Las Mercedes	136
899	Parroquia	Cabruta	136
900	Parroquia	Santa Rita de Manapire	136
901	Parroquia	Valle de la Pascua	137
902	Parroquia	Espino	137
903	Parroquia	San José de Unare	138
904	Parroquia	Zaraza	138
905	Parroquia	San José de Tiznados	139
906	Parroquia	San Francisco de Tiznados	139
907	Parroquia	San Lorenzo de Tiznados	139
908	Parroquia	Ortiz	139
909	Parroquia	Guayabal	140
910	Parroquia	Cazorla	140
911	Parroquia	San José de Guaribe	141
912	Parroquia	Uveral	141
913	Parroquia	Santa María de Ipire	142
914	Parroquia	Altamira	142
915	Parroquia	El Calvario	143
916	Parroquia	El Rastro	143
917	Parroquia	Guardatinajas	143
918	Parroquia	Capital Urbana Calabozo	143
919	Parroquia	Quebrada Honda de Guache	144
920	Parroquia	Pío Tamayo	144
921	Parroquia	Yacambú	144
922	Parroquia	Fréitez	145
923	Parroquia	José María Blanco	145
924	Parroquia	Catedral	146
925	Parroquia	Concepción	146
926	Parroquia	El Cují	146
927	Parroquia	Juan de Villegas	146
928	Parroquia	Santa Rosa	146
929	Parroquia	Tamaca	146
930	Parroquia	Unión	146
931	Parroquia	Aguedo Felipe Alvarado	146
932	Parroquia	Buena Vista	146
933	Parroquia	Juárez	146
934	Parroquia	Juan Bautista Rodríguez	147
935	Parroquia	Cuara	147
936	Parroquia	Diego de Lozada	147
937	Parroquia	Paraíso de San José	147
938	Parroquia	San Miguel	147
939	Parroquia	Tintorero	147
940	Parroquia	José Bernardo Dorante	147
941	Parroquia	Coronel Mariano Peraza 	147
942	Parroquia	Bolívar	148
943	Parroquia	Anzoátegui	148
944	Parroquia	Guarico	148
945	Parroquia	Hilario Luna y Luna	148
946	Parroquia	Humocaro Alto	148
947	Parroquia	Humocaro Bajo	148
948	Parroquia	La Candelaria	148
949	Parroquia	Morán	148
950	Parroquia	Cabudare	149
951	Parroquia	José Gregorio Bastidas	149
952	Parroquia	Agua Viva	149
953	Parroquia	Sarare	150
954	Parroquia	Buría	150
955	Parroquia	Gustavo Vegas León	150
956	Parroquia	Trinidad Samuel	151
957	Parroquia	Antonio Díaz	151
958	Parroquia	Camacaro	151
959	Parroquia	Castañeda	151
960	Parroquia	Cecilio Zubillaga	151
961	Parroquia	Chiquinquirá	151
962	Parroquia	El Blanco	151
963	Parroquia	Espinoza de los Monteros	151
964	Parroquia	Lara	151
965	Parroquia	Las Mercedes	151
966	Parroquia	Manuel Morillo	151
967	Parroquia	Montaña Verde	151
968	Parroquia	Montes de Oca	151
969	Parroquia	Torres	151
970	Parroquia	Heriberto Arroyo	151
971	Parroquia	Reyes Vargas	151
972	Parroquia	Altagracia	151
973	Parroquia	Siquisique	152
974	Parroquia	Moroturo	152
975	Parroquia	San Miguel	152
976	Parroquia	Xaguas	152
977	Parroquia	Presidente Betancourt	179
978	Parroquia	Presidente Páez	179
979	Parroquia	Presidente Rómulo Gallegos	179
980	Parroquia	Gabriel Picón González	179
981	Parroquia	Héctor Amable Mora	179
982	Parroquia	José Nucete Sardi	179
983	Parroquia	Pulido Méndez	179
984	Parroquia	La Azulita	180
985	Parroquia	Santa Cruz de Mora	181
986	Parroquia	Mesa Bolívar	181
987	Parroquia	Mesa de Las Palmas	181
988	Parroquia	Aricagua	182
989	Parroquia	San Antonio	182
990	Parroquia	Canagua	183
991	Parroquia	Capurí	183
992	Parroquia	Chacantá	183
993	Parroquia	El Molino	183
994	Parroquia	Guaimaral	183
995	Parroquia	Mucutuy	183
996	Parroquia	Mucuchachí	183
997	Parroquia	Fernández Peña	184
998	Parroquia	Matriz	184
999	Parroquia	Montalbán	184
1000	Parroquia	Acequias	184
1001	Parroquia	Jají	184
1002	Parroquia	La Mesa	184
1003	Parroquia	San José del Sur	184
1004	Parroquia	Tucaní	185
1005	Parroquia	Florencio Ramírez	185
1006	Parroquia	Santo Domingo	186
1007	Parroquia	Las Piedras	186
1008	Parroquia	Guaraque	187
1009	Parroquia	Mesa de Quintero	187
1010	Parroquia	Río Negro	187
1011	Parroquia	Arapuey	188
1012	Parroquia	Palmira	188
1013	Parroquia	San Cristóbal de Torondoy	189
1014	Parroquia	Torondoy	189
1015	Parroquia	Antonio Spinetti Dini	190
1016	Parroquia	Arias	190
1017	Parroquia	Caracciolo Parra Pérez	190
1018	Parroquia	Domingo Peña	190
1019	Parroquia	El Llano	190
1020	Parroquia	Gonzalo Picón Febres	190
1021	Parroquia	Jacinto Plaza	190
1022	Parroquia	Juan Rodríguez Suárez	190
1023	Parroquia	Lasso de la Vega	190
1024	Parroquia	Mariano Picón Salas	190
1025	Parroquia	Milla	190
1026	Parroquia	Osuna Rodríguez	190
1027	Parroquia	Sagrario	190
1028	Parroquia	El Morro	190
1029	Parroquia	Los Nevados	190
1030	Parroquia	Andrés Eloy Blanco	191
1031	Parroquia	La Venta	191
1032	Parroquia	Piñango	191
1033	Parroquia	Timotes	191
1034	Parroquia	Eloy Paredes	192
1035	Parroquia	San Rafael de Alcázar	192
1036	Parroquia	Santa Elena de Arenales	192
1037	Parroquia	Santa María de Caparo	193
1038	Parroquia	Pueblo Llano	194
1039	Parroquia	Cacute	195
1040	Parroquia	La Toma	195
1041	Parroquia	Mucuchíes	195
1042	Parroquia	Mucurubá	195
1043	Parroquia	San Rafael	195
1044	Parroquia	Gerónimo Maldonado	196
1045	Parroquia	Bailadores	196
1046	Parroquia	Tabay	197
1047	Parroquia	Chiguará	198
1048	Parroquia	Estánquez	198
1049	Parroquia	Lagunillas	198
1050	Parroquia	La Trampa	198
1051	Parroquia	Pueblo Nuevo del Sur	198
1052	Parroquia	San Juan	198
1053	Parroquia	El Amparo	199
1054	Parroquia	El Llano	199
1055	Parroquia	San Francisco	199
1056	Parroquia	Tovar	199
1057	Parroquia	Independencia	200
1058	Parroquia	María de la Concepción Palacios Blanco	200
1059	Parroquia	Nueva Bolivia	200
1060	Parroquia	Santa Apolonia	200
1061	Parroquia	Caño El Tigre	201
1062	Parroquia	Zea	201
1063	Parroquia	Aragüita	223
1064	Parroquia	Arévalo González	223
1065	Parroquia	Capaya	223
1066	Parroquia	Caucagua	223
1067	Parroquia	Panaquire	223
1068	Parroquia	Ribas	223
1069	Parroquia	El Café	223
1070	Parroquia	Marizapa	223
1071	Parroquia	Cumbo	224
1072	Parroquia	San José de Barlovento	224
1073	Parroquia	El Cafetal	225
1074	Parroquia	Las Minas	225
1075	Parroquia	Nuestra Señora del Rosario	225
1076	Parroquia	Higuerote	226
1077	Parroquia	Curiepe	226
1078	Parroquia	Tacarigua de Brión	226
1079	Parroquia	Mamporal	227
1080	Parroquia	Carrizal	228
1081	Parroquia	Chacao	229
1082	Parroquia	Charallave	230
1083	Parroquia	Las Brisas	230
1084	Parroquia	El Hatillo	231
1085	Parroquia	Altagracia de la Montaña	232
1086	Parroquia	Cecilio Acosta	232
1087	Parroquia	Los Teques	232
1088	Parroquia	El Jarillo	232
1089	Parroquia	San Pedro	232
1090	Parroquia	Tácata	232
1091	Parroquia	Paracotos	232
1092	Parroquia	Cartanal	233
1093	Parroquia	Santa Teresa del Tuy	233
1094	Parroquia	La Democracia	234
1095	Parroquia	Ocumare del Tuy	234
1096	Parroquia	Santa Bárbara	234
1097	Parroquia	San Antonio de los Altos	235
1098	Parroquia	Río Chico	236
1099	Parroquia	El Guapo	236
1100	Parroquia	Tacarigua de la Laguna	236
1101	Parroquia	Paparo	236
1102	Parroquia	San Fernando del Guapo	236
1103	Parroquia	Santa Lucía del Tuy	237
1104	Parroquia	Cúpira	238
1105	Parroquia	Machurucuto	238
1106	Parroquia	Guarenas	239
1107	Parroquia	San Antonio de Yare	240
1108	Parroquia	San Francisco de Yare	240
1109	Parroquia	Leoncio Martínez	241
1110	Parroquia	Petare	241
1111	Parroquia	Caucagüita	241
1112	Parroquia	Filas de Mariche	241
1113	Parroquia	La Dolorita	241
1114	Parroquia	Cúa	242
1115	Parroquia	Nueva Cúa	242
1116	Parroquia	Guatire	243
1117	Parroquia	Bolívar	243
1118	Parroquia	San Antonio de Maturín	258
1119	Parroquia	San Francisco de Maturín	258
1120	Parroquia	Aguasay	259
1121	Parroquia	Caripito	260
1122	Parroquia	El Guácharo	261
1123	Parroquia	La Guanota	261
1124	Parroquia	Sabana de Piedra	261
1125	Parroquia	San Agustín	261
1126	Parroquia	Teresen	261
1127	Parroquia	Caripe	261
1128	Parroquia	Areo	262
1129	Parroquia	Capital Cedeño	262
1130	Parroquia	San Félix de Cantalicio	262
1131	Parroquia	Viento Fresco	262
1132	Parroquia	El Tejero	263
1133	Parroquia	Punta de Mata	263
1134	Parroquia	Chaguaramas	264
1135	Parroquia	Las Alhuacas	264
1136	Parroquia	Tabasca	264
1137	Parroquia	Temblador	264
1138	Parroquia	Alto de los Godos	265
1139	Parroquia	Boquerón	265
1140	Parroquia	Las Cocuizas	265
1141	Parroquia	La Cruz	265
1142	Parroquia	San Simón	265
1143	Parroquia	El Corozo	265
1144	Parroquia	El Furrial	265
1145	Parroquia	Jusepín	265
1146	Parroquia	La Pica	265
1147	Parroquia	San Vicente	265
1148	Parroquia	Aparicio	266
1149	Parroquia	Aragua de Maturín	266
1150	Parroquia	Chaguamal	266
1151	Parroquia	El Pinto	266
1152	Parroquia	Guanaguana	266
1153	Parroquia	La Toscana	266
1154	Parroquia	Taguaya	266
1155	Parroquia	Cachipo	267
1156	Parroquia	Quiriquire	267
1157	Parroquia	Santa Bárbara	268
1158	Parroquia	Barrancas	269
1159	Parroquia	Los Barrancos de Fajardo	269
1160	Parroquia	Uracoa	270
1161	Parroquia	Antolín del Campo	271
1162	Parroquia	Arismendi	272
1163	Parroquia	García	273
1164	Parroquia	Francisco Fajardo	273
1165	Parroquia	Bolívar	274
1166	Parroquia	Guevara	274
1167	Parroquia	Matasiete	274
1168	Parroquia	Santa Ana	274
1169	Parroquia	Sucre	274
1170	Parroquia	Aguirre	275
1171	Parroquia	Maneiro	275
1172	Parroquia	Adrián	276
1173	Parroquia	Juan Griego	276
1174	Parroquia	Yaguaraparo	276
1175	Parroquia	Porlamar	277
1176	Parroquia	San Francisco de Macanao	278
1177	Parroquia	Boca de Río	278
1178	Parroquia	Tubores	279
1179	Parroquia	Los Baleales	279
1180	Parroquia	Vicente Fuentes	280
1181	Parroquia	Villalba	280
1182	Parroquia	San Juan Bautista	281
1183	Parroquia	Zabala	281
1184	Parroquia	Capital Araure	283
1185	Parroquia	Río Acarigua	283
1186	Parroquia	Capital Esteller	284
1187	Parroquia	Uveral	284
1188	Parroquia	Guanare	285
1189	Parroquia	Córdoba	285
1190	Parroquia	San José de la Montaña	285
1191	Parroquia	San Juan de Guanaguanare	285
1192	Parroquia	Virgen de la Coromoto	285
1193	Parroquia	Guanarito	286
1194	Parroquia	Trinidad de la Capilla	286
1195	Parroquia	Divina Pastora	286
1196	Parroquia	Monseñor José Vicente de Unda	287
1197	Parroquia	Peña Blanca	287
1198	Parroquia	Capital Ospino	288
1199	Parroquia	Aparición	288
1200	Parroquia	La Estación	288
1201	Parroquia	Páez	289
1202	Parroquia	Payara	289
1203	Parroquia	Pimpinela	289
1204	Parroquia	Ramón Peraza	289
1205	Parroquia	Papelón	290
1206	Parroquia	Caño Delgadito	290
1207	Parroquia	San Genaro de Boconoito	291
1208	Parroquia	Antolín Tovar	291
1209	Parroquia	San Rafael de Onoto	292
1210	Parroquia	Santa Fe	292
1211	Parroquia	Thermo Morles	292
1212	Parroquia	Santa Rosalía	293
1213	Parroquia	Florida	293
1214	Parroquia	Sucre	294
1215	Parroquia	Concepción	294
1216	Parroquia	San Rafael de Palo Alzado	294
1217	Parroquia	Uvencio Antonio Velásquez	294
1218	Parroquia	San José de Saguaz	294
1219	Parroquia	Villa Rosa	294
1220	Parroquia	Turén	295
1221	Parroquia	Canelones	295
1222	Parroquia	Santa Cruz	295
1223	Parroquia	San Isidro Labrador	295
1224	Parroquia	Mariño	296
1225	Parroquia	Rómulo Gallegos	296
1226	Parroquia	San José de Aerocuar	297
1227	Parroquia	Tavera Acosta	297
1228	Parroquia	Río Caribe	298
1229	Parroquia	Antonio José de Sucre	298
1230	Parroquia	El Morro de Puerto Santo	298
1231	Parroquia	Puerto Santo	298
1232	Parroquia	San Juan de las Galdonas	298
1233	Parroquia	El Pilar	299
1234	Parroquia	El Rincón	299
1235	Parroquia	General Francisco Antonio Váquez	299
1236	Parroquia	Guaraúnos	299
1237	Parroquia	Tunapuicito	299
1238	Parroquia	Unión	299
1239	Parroquia	Santa Catalina	300
1240	Parroquia	Santa Rosa	300
1241	Parroquia	Santa Teresa	300
1242	Parroquia	Bolívar	300
1243	Parroquia	Maracapana	300
1244	Parroquia	Libertad	302
1245	Parroquia	El Paujil	302
1246	Parroquia	Yaguaraparo	302
1247	Parroquia	Cruz Salmerón Acosta	303
1248	Parroquia	Chacopata	303
1249	Parroquia	Manicuare	303
1250	Parroquia	Tunapuy	304
1251	Parroquia	Campo Elías	304
1252	Parroquia	Irapa	305
1253	Parroquia	Campo Claro	305
1254	Parroquia	Maraval	305
1255	Parroquia	San Antonio de Irapa	305
1256	Parroquia	Soro	305
1257	Parroquia	Mejía	306
1258	Parroquia	Cumanacoa	307
1259	Parroquia	Arenas	307
1260	Parroquia	Aricagua	307
1261	Parroquia	Cogollar	307
1262	Parroquia	San Fernando	307
1263	Parroquia	San Lorenzo	307
1264	Parroquia	Villa Frontado (Muelle de Cariaco)	308
1265	Parroquia	Catuaro	308
1266	Parroquia	Rendón	308
1267	Parroquia	San Cruz	308
1268	Parroquia	Santa María	308
1269	Parroquia	Altagracia	309
1270	Parroquia	Santa Inés	309
1271	Parroquia	Valentín Valiente	309
1272	Parroquia	Ayacucho	309
1273	Parroquia	San Juan	309
1274	Parroquia	Raúl Leoni	309
1275	Parroquia	Gran Mariscal	309
1276	Parroquia	Cristóbal Colón	310
1277	Parroquia	Bideau	310
1278	Parroquia	Punta de Piedras	310
1279	Parroquia	Güiria	310
1280	Parroquia	Andrés Bello	341
1281	Parroquia	Antonio Rómulo Costa	342
1282	Parroquia	Ayacucho	343
1283	Parroquia	Rivas Berti	343
1284	Parroquia	San Pedro del Río	343
1285	Parroquia	Bolívar	344
1286	Parroquia	Palotal	344
1287	Parroquia	General Juan Vicente Gómez	344
1288	Parroquia	Isaías Medina Angarita	344
1289	Parroquia	Cárdenas	345
1290	Parroquia	Amenodoro Ángel Lamus	345
1291	Parroquia	La Florida	345
1292	Parroquia	Córdoba	346
1293	Parroquia	Fernández Feo	347
1294	Parroquia	Alberto Adriani	347
1295	Parroquia	Santo Domingo	347
1296	Parroquia	Francisco de Miranda	348
1297	Parroquia	García de Hevia	349
1298	Parroquia	Boca de Grita	349
1299	Parroquia	José Antonio Páez	349
1300	Parroquia	Guásimos	350
1301	Parroquia	Independencia	351
1302	Parroquia	Juan Germán Roscio	351
1303	Parroquia	Román Cárdenas	351
1304	Parroquia	Jáuregui	352
1305	Parroquia	Emilio Constantino Guerrero	352
1306	Parroquia	Monseñor Miguel Antonio Salas	352
1307	Parroquia	José María Vargas	353
1308	Parroquia	Junín	354
1309	Parroquia	La Petrólea	354
1310	Parroquia	Quinimarí	354
1311	Parroquia	Bramón	354
1312	Parroquia	Libertad	355
1313	Parroquia	Cipriano Castro	355
1314	Parroquia	Manuel Felipe Rugeles	355
1315	Parroquia	Libertador	356
1316	Parroquia	Doradas	356
1317	Parroquia	Emeterio Ochoa	356
1318	Parroquia	San Joaquín de Navay	356
1319	Parroquia	Lobatera	357
1320	Parroquia	Constitución	357
1321	Parroquia	Michelena	358
1322	Parroquia	Panamericano	359
1323	Parroquia	La Palmita	359
1324	Parroquia	Pedro María Ureña	360
1325	Parroquia	Nueva Arcadia	360
1326	Parroquia	Delicias	361
1327	Parroquia	Pecaya	361
1328	Parroquia	Samuel Darío Maldonado	362
1329	Parroquia	Boconó	362
1330	Parroquia	Hernández	362
1331	Parroquia	La Concordia	363
1332	Parroquia	San Juan Bautista	363
1333	Parroquia	Pedro María Morantes	363
1334	Parroquia	San Sebastián	363
1335	Parroquia	Dr. Francisco Romero Lobo	363
1336	Parroquia	Seboruco	364
1337	Parroquia	Simón Rodríguez	365
1338	Parroquia	Sucre	366
1339	Parroquia	Eleazar López Contreras	366
1340	Parroquia	San Pablo	366
1341	Parroquia	Torbes	367
1342	Parroquia	Uribante	368
1343	Parroquia	Cárdenas	368
1344	Parroquia	Juan Pablo Peñalosa	368
1345	Parroquia	Potosí	368
1346	Parroquia	San Judas Tadeo	369
1347	Parroquia	Araguaney	370
1348	Parroquia	El Jaguito	370
1349	Parroquia	La Esperanza	370
1350	Parroquia	Santa Isabel	370
1351	Parroquia	Boconó	371
1352	Parroquia	El Carmen	371
1353	Parroquia	Mosquey	371
1354	Parroquia	Ayacucho	371
1355	Parroquia	Burbusay	371
1356	Parroquia	General Ribas	371
1357	Parroquia	Guaramacal	371
1358	Parroquia	Vega de Guaramacal	371
1359	Parroquia	Monseñor Jáuregui	371
1360	Parroquia	Rafael Rangel	371
1361	Parroquia	San Miguel	371
1362	Parroquia	San José	371
1363	Parroquia	Sabana Grande	372
1364	Parroquia	Cheregüé	372
1365	Parroquia	Granados	372
1366	Parroquia	Arnoldo Gabaldón	373
1367	Parroquia	Bolivia	373
1368	Parroquia	Carrillo	373
1369	Parroquia	Cegarra	373
1370	Parroquia	Chejendé	373
1371	Parroquia	Manuel Salvador Ulloa	373
1372	Parroquia	San José	373
1373	Parroquia	Carache	374
1374	Parroquia	La Concepción	374
1375	Parroquia	Cuicas	374
1376	Parroquia	Panamericana	374
1377	Parroquia	Santa Cruz	374
1378	Parroquia	Escuque	375
1379	Parroquia	La Unión	375
1380	Parroquia	Santa Rita	375
1381	Parroquia	Sabana Libre	375
1382	Parroquia	El Socorro	376
1383	Parroquia	Los Caprichos	376
1384	Parroquia	Antonio José de Sucre	376
1385	Parroquia	Campo Elías	377
1386	Parroquia	Arnoldo Gabaldón	377
1387	Parroquia	Santa Apolonia	378
1388	Parroquia	El Progreso	378
1389	Parroquia	La Ceiba	378
1390	Parroquia	Tres de Febrero	378
1391	Parroquia	El Dividive	379
1392	Parroquia	Agua Santa	379
1393	Parroquia	Agua Caliente	379
1394	Parroquia	El Cenizo	379
1395	Parroquia	Valerita	379
1396	Parroquia	Monte Carmelo	380
1397	Parroquia	Buena Vista	380
1398	Parroquia	Santa María del Horcón	380
1399	Parroquia	Motatán	381
1400	Parroquia	El Baño	381
1401	Parroquia	Jalisco	381
1402	Parroquia	Pampán	382
1403	Parroquia	Flor de Patria	382
1404	Parroquia	La Paz	382
1405	Parroquia	Santa Ana	382
1406	Parroquia	Pampanito	383
1407	Parroquia	La Concepción	383
1408	Parroquia	Pampanito II	383
1409	Parroquia	Betijoque	384
1410	Parroquia	José Gregorio Hernández	384
1411	Parroquia	La Pueblita	384
1412	Parroquia	Los Cedros	384
1413	Parroquia	Carvajal	385
1414	Parroquia	Campo Alegre	385
1415	Parroquia	Antonio Nicolás Briceño	385
1416	Parroquia	José Leonardo Suárez	385
1417	Parroquia	Sabana de Mendoza	386
1418	Parroquia	Junín	386
1419	Parroquia	Valmore Rodríguez	386
1420	Parroquia	El Paraíso	386
1421	Parroquia	Andrés Linares	387
1422	Parroquia	Chiquinquirá	387
1423	Parroquia	Cristóbal Mendoza	387
1424	Parroquia	Cruz Carrillo	387
1425	Parroquia	Matriz	387
1426	Parroquia	Monseñor Carrillo	387
1427	Parroquia	Tres Esquinas	387
1428	Parroquia	Cabimbú	388
1429	Parroquia	Jajó	388
1430	Parroquia	La Mesa de Esnujaque	388
1431	Parroquia	Santiago	388
1432	Parroquia	Tuñame	388
1433	Parroquia	La Quebrada	388
1434	Parroquia	Juan Ignacio Montilla	389
1435	Parroquia	La Beatriz	389
1436	Parroquia	La Puerta	389
1437	Parroquia	Mendoza del Valle de Momboy	389
1438	Parroquia	Mercedes Díaz	389
1439	Parroquia	San Luis	389
1440	Parroquia	Caraballeda	390
1441	Parroquia	Carayaca	390
1442	Parroquia	Carlos Soublette	390
1443	Parroquia	Caruao Chuspa	390
1444	Parroquia	Catia La Mar	390
1445	Parroquia	El Junko	390
1446	Parroquia	La Guaira	390
1447	Parroquia	Macuto	390
1448	Parroquia	Maiquetía	390
1449	Parroquia	Naiguatá	390
1450	Parroquia	Urimare	390
1451	Parroquia	Arístides Bastidas	391
1452	Parroquia	Bolívar	392
1453	Parroquia	Chivacoa	407
1454	Parroquia	Campo Elías	407
1455	Parroquia	Cocorote	408
1456	Parroquia	Independencia	409
1457	Parroquia	José Antonio Páez	410
1458	Parroquia	La Trinidad	411
1459	Parroquia	Manuel Monge	412
1460	Parroquia	Salóm	413
1461	Parroquia	Temerla	413
1462	Parroquia	Nirgua	413
1463	Parroquia	San Andrés	414
1464	Parroquia	Yaritagua	414
1465	Parroquia	San Javier	415
1466	Parroquia	Albarico	415
1467	Parroquia	San Felipe	415
1468	Parroquia	Sucre	416
1469	Parroquia	Urachiche	417
1470	Parroquia	El Guayabo	418
1471	Parroquia	Farriar	418
1472	Parroquia	Isla de Toas	441
1473	Parroquia	Monagas	441
1474	Parroquia	San Timoteo	442
1475	Parroquia	General Urdaneta	442
1476	Parroquia	Libertador	442
1477	Parroquia	Marcelino Briceño	442
1478	Parroquia	Pueblo Nuevo	442
1479	Parroquia	Manuel Guanipa Matos	442
1480	Parroquia	Ambrosio	443
1481	Parroquia	Carmen Herrera	443
1482	Parroquia	La Rosa	443
1483	Parroquia	Germán Ríos Linares	443
1484	Parroquia	San Benito	443
1485	Parroquia	Rómulo Betancourt	443
1486	Parroquia	Jorge Hernández	443
1487	Parroquia	Punta Gorda	443
1488	Parroquia	Arístides Calvani	443
1489	Parroquia	Encontrados	444
1490	Parroquia	Udón Pérez	444
1491	Parroquia	Moralito	445
1492	Parroquia	San Carlos del Zulia	445
1493	Parroquia	Santa Cruz del Zulia	445
1494	Parroquia	Santa Bárbara	445
1495	Parroquia	Urribarrí	445
1496	Parroquia	Carlos Quevedo	446
1497	Parroquia	Francisco Javier Pulgar	446
1498	Parroquia	Simón Rodríguez	446
1499	Parroquia	Guamo-Gavilanes	446
1500	Parroquia	La Concepción	448
1501	Parroquia	San José	448
1502	Parroquia	Mariano Parra León	448
1503	Parroquia	José Ramón Yépez	448
1504	Parroquia	Jesús María Semprún	449
1505	Parroquia	Barí	449
1506	Parroquia	Concepción	450
1507	Parroquia	Andrés Bello	450
1508	Parroquia	Chiquinquirá	450
1509	Parroquia	El Carmelo	450
1510	Parroquia	Potreritos	450
1511	Parroquia	Libertad	451
1512	Parroquia	Alonso de Ojeda	451
1513	Parroquia	Venezuela	451
1514	Parroquia	Eleazar López Contreras	451
1515	Parroquia	Campo Lara	451
1516	Parroquia	Bartolomé de las Casas	452
1517	Parroquia	Libertad	452
1518	Parroquia	Río Negro	452
1519	Parroquia	San José de Perijá	452
1520	Parroquia	San Rafael	453
1521	Parroquia	La Sierrita	453
1522	Parroquia	Las Parcelas	453
1523	Parroquia	Luis de Vicente	453
1524	Parroquia	Monseñor Marcos Sergio Godoy	453
1525	Parroquia	Ricaurte	453
1526	Parroquia	Tamare	453
1527	Parroquia	Antonio Borjas Romero	454
1528	Parroquia	Bolívar	454
1529	Parroquia	Cacique Mara	454
1530	Parroquia	Carracciolo Parra Pérez	454
1531	Parroquia	Cecilio Acosta	454
1532	Parroquia	Cristo de Aranza	454
1533	Parroquia	Coquivacoa	454
1534	Parroquia	Chiquinquirá	454
1535	Parroquia	Francisco Eugenio Bustamante	454
1536	Parroquia	Idelfonzo Vásquez	454
1537	Parroquia	Juana de Ávila	454
1538	Parroquia	Luis Hurtado Higuera	454
1539	Parroquia	Manuel Dagnino	454
1540	Parroquia	Olegario Villalobos	454
1541	Parroquia	Raúl Leoni	454
1542	Parroquia	Santa Lucía	454
1543	Parroquia	Venancio Pulgar	454
1544	Parroquia	San Isidro	454
1545	Parroquia	Altagracia	455
1546	Parroquia	Faría	455
1547	Parroquia	Ana María Campos	455
1548	Parroquia	San Antonio	455
1549	Parroquia	San José	455
1550	Parroquia	Donaldo García	456
1551	Parroquia	El Rosario	456
1552	Parroquia	Sixto Zambrano	456
1553	Parroquia	San Francisco	457
1554	Parroquia	El Bajo	457
1555	Parroquia	Domitila Flores	457
1556	Parroquia	Francisco Ochoa	457
1557	Parroquia	Los Cortijos	457
1558	Parroquia	Marcial Hernández	457
1559	Parroquia	Santa Rita	458
1560	Parroquia	El Mene	458
1561	Parroquia	Pedro Lucas Urribarrí	458
1562	Parroquia	José Cenobio Urribarrí	458
1563	Parroquia	Rafael Maria Baralt	459
1564	Parroquia	Manuel Manrique	459
1565	Parroquia	Rafael Urdaneta	459
1566	Parroquia	Bobures	460
1567	Parroquia	Gibraltar	460
1568	Parroquia	Heras	460
1569	Parroquia	Monseñor Arturo Álvarez	460
1570	Parroquia	Rómulo Gallegos	460
1571	Parroquia	El Batey	460
1572	Parroquia	Rafael Urdaneta	461
1573	Parroquia	La Victoria	461
1574	Parroquia	Raúl Cuenca	461
1575	Parroquia	Sinamaica	447
1576	Parroquia	Alta Guajira	447
1577	Parroquia	Elías Sánchez Rubio	447
1578	Parroquia	Guajira	447
1579	Parroquia	Altagracia	462
1580	Parroquia	Antímano	462
1581	Parroquia	Caricuao	462
1582	Parroquia	Catedral	462
1583	Parroquia	Coche	462
1584	Parroquia	El Junquito	462
1585	Parroquia	El Paraíso	462
1586	Parroquia	El Recreo	462
1587	Parroquia	El Valle	462
1588	Parroquia	La Candelaria	462
1589	Parroquia	La Pastora	462
1590	Parroquia	La Vega	462
1591	Parroquia	Macarao	462
1592	Parroquia	San Agustín	462
1593	Parroquia	San Bernardino	462
1594	Parroquia	San José	462
1595	Parroquia	San Juan	462
1596	Parroquia	San Pedro	462
1597	Parroquia	Santa Rosalía	462
1598	Parroquia	Santa Teresa	462
1599	Parroquia	Sucre (Catia)	462
1600	Parroquia	23 de enero	462
\.


--
-- TOC entry 3171 (class 0 OID 17210)
-- Dependencies: 209
-- Data for Name: Mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 17218)
-- Dependencies: 210
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Marca" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 17226)
-- Dependencies: 211
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Modelo" ("COD", "Nombre", "FK-MarcaM") FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 17241)
-- Dependencies: 213
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pago" ("COD", "MontoTotal", "Fecha", "PagoDest", "FK-EmpleadoP", "FK-EnvioP") FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 17236)
-- Dependencies: 212
-- Data for Name: Pago-Metodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pago-Metodo" ("COD", "CODPago", "CODTarjeta", "CODCheque", "CODTrans", "CODEfect") FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 17246)
-- Dependencies: 214
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Paquete" ("COD", "Peso", "Volumen", "CostoxPesoxVolumen", "FK-TipoPaquete", "FK-Sucursal", "FK-EnvioP", "FK-Cliente1", "FK-Cliente2") FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 17252)
-- Dependencies: 215
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Puerto" ("COD", "Puestos", "Calado", "TotalMuelles", "Uso", "Longitud", "Ancho", "FK-LugarP", "FK-Sucursal") FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 17260)
-- Dependencies: 216
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 17268)
-- Dependencies: 217
-- Data for Name: Rol-Accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol-Accion" ("COD", "CODRol", "CODAccion") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 17273)
-- Dependencies: 218
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ruta" ("COD", "FK-Sucursal1", "Fk-Sucursal2", "FK-Ruta") FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 17278)
-- Dependencies: 219
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Servicio" ("COD", "Nombre", "FK-GastosS") FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 17286)
-- Dependencies: 220
-- Data for Name: Sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 17294)
-- Dependencies: 221
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Taller" ("COD", "Nombre", "PaginaWeb", "Contacto", "Correo", "FK-LugarT", "FK-TelefonoT") FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 17302)
-- Dependencies: 222
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarjeta" ("COD", "Descripcion", "Tipo", "FechaVen", "Marca", "NroCuenta", "Banco", "FK-ClienteT") FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 17310)
-- Dependencies: 223
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Telefono" ("COD", "Numero", "FK-SucursalT", "FK-Empleado", "FK-Cliente") FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 17316)
-- Dependencies: 224
-- Data for Name: Terrestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Terrestre" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Tipo", "FK-SucursalT", "FK-ModeloT") FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 17324)
-- Dependencies: 225
-- Data for Name: TipoPaquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoPaquete" ("COD", "Clasificacion") FROM stdin;
\.


--
-- TOC entry 3188 (class 0 OID 17332)
-- Dependencies: 226
-- Data for Name: Transferencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transferencia" ("COD", "Descripcion", "NroCuenta", "Banco", "Correo", "FK-ClienteTrans") FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 17340)
-- Dependencies: 227
-- Data for Name: Traslado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Traslado" ("COD", "CODVeh-Rut", "CODEnvio", "PrecioVeh", "PrecioRuta") FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 17345)
-- Dependencies: 228
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("Nombre", "Contrasena", "FK-RolU", "FK-ClienteU", "FK-EmpleadoU") FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 17353)
-- Dependencies: 229
-- Data for Name: Veh-Rut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Veh-Rut" ("COD", "PlacaA", "PlacaB", "PlacaT", "CODRuta", "Duracion") FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 17361)
-- Dependencies: 230
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Zona" ("COD", "Nombre", "TamanoDep", "Descripcion", "Dimension", "CapacidadEmp", "FK-SucursalZ") FROM stdin;
\.


--
-- TOC entry 2835 (class 2606 OID 17118)
-- Name: Accion Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accion"
    ADD CONSTRAINT "Accion_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2837 (class 2606 OID 17123)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2841 (class 2606 OID 17128)
-- Name: Asistencia Asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("COD", "CIEmpleado", "CODZona");


--
-- TOC entry 2849 (class 2606 OID 17147)
-- Name: Barco Barco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "Barco_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2853 (class 2606 OID 17155)
-- Name: Cheque Cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "Cheque_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2856 (class 2606 OID 17163)
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2968 (class 2606 OID 17376)
-- Name: Efectivo Efectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "Efectivo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2859 (class 2606 OID 17171)
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2863 (class 2606 OID 17179)
-- Name: Envio Envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2867 (class 2606 OID 17187)
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2869 (class 2606 OID 17195)
-- Name: Gastos Gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gastos"
    ADD CONSTRAINT "Gastos_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2872 (class 2606 OID 17201)
-- Name: L-VIP L-VIP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "L-VIP_pkey" PRIMARY KEY ("NroCarnet");


--
-- TOC entry 2875 (class 2606 OID 17209)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2884 (class 2606 OID 17225)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2886 (class 2606 OID 17233)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2845 (class 2606 OID 17139)
-- Name: Avion PK-Avion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "PK-Avion" PRIMARY KEY ("Placa");


--
-- TOC entry 2878 (class 2606 OID 17378)
-- Name: Mantenimiento PK-Mantenimiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PK-Mantenimiento" PRIMARY KEY ("COD");


--
-- TOC entry 2889 (class 2606 OID 17240)
-- Name: Pago-Metodo Pago-Metodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "Pago-Metodo_pkey" PRIMARY KEY ("COD", "CODPago");


--
-- TOC entry 2896 (class 2606 OID 17245)
-- Name: Pago Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2900 (class 2606 OID 17250)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2907 (class 2606 OID 17259)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2913 (class 2606 OID 17272)
-- Name: Rol-Accion Rol-Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "Rol-Accion_pkey" PRIMARY KEY ("COD", "CODRol", "CODAccion");


--
-- TOC entry 2911 (class 2606 OID 17267)
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2917 (class 2606 OID 17277)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2922 (class 2606 OID 17285)
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2925 (class 2606 OID 17293)
-- Name: Sucursal Sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2929 (class 2606 OID 17301)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2933 (class 2606 OID 17309)
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2936 (class 2606 OID 17314)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2941 (class 2606 OID 17323)
-- Name: Terrestre Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2945 (class 2606 OID 17331)
-- Name: TipoPaquete TipoPaquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoPaquete"
    ADD CONSTRAINT "TipoPaquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2947 (class 2606 OID 17339)
-- Name: Transferencia Transferencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "Transferencia_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2950 (class 2606 OID 17344)
-- Name: Traslado Traslado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "Traslado_pkey" PRIMARY KEY ("COD", "CODVeh-Rut", "CODEnvio");


--
-- TOC entry 2954 (class 2606 OID 17352)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 2959 (class 2606 OID 17360)
-- Name: Veh-Rut Veh-Rut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "Veh-Rut_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2965 (class 2606 OID 17368)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2842 (class 1259 OID 17396)
-- Name: fki_CIEmpleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CIEmpleado" ON public."Asistencia" USING btree ("CIEmpleado");


--
-- TOC entry 2914 (class 1259 OID 17616)
-- Name: fki_CODAccion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODAccion" ON public."Rol-Accion" USING btree ("CODAccion");


--
-- TOC entry 2890 (class 1259 OID 17540)
-- Name: fki_CODCheque; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODCheque" ON public."Pago-Metodo" USING btree ("CODCheque");


--
-- TOC entry 2891 (class 1259 OID 17552)
-- Name: fki_CODEfect; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEfect" ON public."Pago-Metodo" USING btree ("CODEfect");


--
-- TOC entry 2951 (class 1259 OID 17724)
-- Name: fki_CODEnvio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEnvio" ON public."Traslado" USING btree ("CODEnvio");


--
-- TOC entry 2892 (class 1259 OID 17528)
-- Name: fki_CODPago; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODPago" ON public."Pago-Metodo" USING btree ("CODPago");


--
-- TOC entry 2915 (class 1259 OID 17610)
-- Name: fki_CODRol; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRol" ON public."Rol-Accion" USING btree ("CODRol");


--
-- TOC entry 2960 (class 1259 OID 17748)
-- Name: fki_CODRuta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRuta" ON public."Veh-Rut" USING btree ("CODRuta");


--
-- TOC entry 2879 (class 1259 OID 17486)
-- Name: fki_CODTaller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTaller" ON public."Mantenimiento" USING btree ("CODTaller");


--
-- TOC entry 2893 (class 1259 OID 17534)
-- Name: fki_CODTarjeta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTarjeta" ON public."Pago-Metodo" USING btree ("CODTarjeta");


--
-- TOC entry 2894 (class 1259 OID 17546)
-- Name: fki_CODTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTrans" ON public."Pago-Metodo" USING btree ("CODTrans");


--
-- TOC entry 2952 (class 1259 OID 17718)
-- Name: fki_CODVeh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODVeh-Rut" ON public."Traslado" USING btree ("CODVeh-Rut");


--
-- TOC entry 2843 (class 1259 OID 17402)
-- Name: fki_CODZona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODZona" ON public."Asistencia" USING btree ("CODZona");


--
-- TOC entry 2846 (class 1259 OID 17414)
-- Name: fki_FK-Aeropuerto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Aeropuerto" ON public."Avion" USING btree ("FK-Aeropuerto");


--
-- TOC entry 2873 (class 1259 OID 17474)
-- Name: fki_FK-CLienteL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-CLienteL" ON public."L-VIP" USING btree ("FK-ClienteL");


--
-- TOC entry 2937 (class 1259 OID 17689)
-- Name: fki_FK-Cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente" ON public."Telefono" USING btree ("FK-Cliente");


--
-- TOC entry 2901 (class 1259 OID 17581)
-- Name: fki_FK-Cliente1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente1" ON public."Paquete" USING btree ("FK-Cliente1");


--
-- TOC entry 2902 (class 1259 OID 17587)
-- Name: fki_FK-Cliente2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente2" ON public."Paquete" USING btree ("FK-Cliente2");


--
-- TOC entry 2969 (class 1259 OID 17444)
-- Name: fki_FK-ClienteE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteE" ON public."Efectivo" USING btree ("FK-ClienteE");


--
-- TOC entry 2854 (class 1259 OID 17432)
-- Name: fki_FK-ClienteM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteM" ON public."Cheque" USING btree ("FK-ClienteM");


--
-- TOC entry 2934 (class 1259 OID 17671)
-- Name: fki_FK-ClienteT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteT" ON public."Tarjeta" USING btree ("FK-ClienteT");


--
-- TOC entry 2948 (class 1259 OID 17712)
-- Name: fki_FK-ClienteTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteTrans" ON public."Transferencia" USING btree ("FK-ClienteTrans");


--
-- TOC entry 2955 (class 1259 OID 17766)
-- Name: fki_FK-ClienteU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteU" ON public."Usuario" USING btree ("FK-ClienteU");


--
-- TOC entry 2938 (class 1259 OID 17683)
-- Name: fki_FK-Empleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Empleado" ON public."Telefono" USING btree ("FK-Empleado");


--
-- TOC entry 2864 (class 1259 OID 17456)
-- Name: fki_FK-EmpleadoE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoE" ON public."Envio" USING btree ("FK-EmpleadoE");


--
-- TOC entry 2897 (class 1259 OID 17516)
-- Name: fki_FK-EmpleadoP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoP" ON public."Pago" USING btree ("FK-EmpleadoP");


--
-- TOC entry 2926 (class 1259 OID 17653)
-- Name: fki_FK-EmpleadoS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoS" ON public."Sucursal" USING btree ("FK-EmpleadoS");


--
-- TOC entry 2956 (class 1259 OID 17772)
-- Name: fki_FK-EmpleadoU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoU" ON public."Usuario" USING btree ("FK-EmpleadoU");


--
-- TOC entry 2898 (class 1259 OID 17522)
-- Name: fki_FK-EnvioP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioP" ON public."Pago" USING btree ("FK-EnvioP");


--
-- TOC entry 2903 (class 1259 OID 17575)
-- Name: fki_FK-EnvioPa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioPa" ON public."Paquete" USING btree ("FK-EnvioP");


--
-- TOC entry 2865 (class 1259 OID 17462)
-- Name: fki_FK-EstatusE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EstatusE" ON public."Envio" USING btree ("FK-EstatusE");


--
-- TOC entry 2860 (class 1259 OID 17450)
-- Name: fki_FK-GastosE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosE" ON public."Empleado" USING btree ("FK-GastosE");


--
-- TOC entry 2923 (class 1259 OID 17641)
-- Name: fki_FK-GastosS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosS" ON public."Servicio" USING btree ("FK-GastosS");


--
-- TOC entry 2838 (class 1259 OID 17390)
-- Name: fki_FK-LugarAe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarAe" ON public."Aeropuerto" USING btree ("FK-LugarAe");


--
-- TOC entry 2857 (class 1259 OID 17438)
-- Name: fki_FK-LugarC; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarC" ON public."Cliente" USING btree ("FK-LugarC");


--
-- TOC entry 2876 (class 1259 OID 17480)
-- Name: fki_FK-LugarL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarL" ON public."Lugar" USING btree ("Fk-LugarL");


--
-- TOC entry 2908 (class 1259 OID 17593)
-- Name: fki_FK-LugarP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarP" ON public."Puerto" USING btree ("FK-LugarP");


--
-- TOC entry 2927 (class 1259 OID 17647)
-- Name: fki_FK-LugarS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarS" ON public."Sucursal" USING btree ("FK-LugarS");


--
-- TOC entry 2930 (class 1259 OID 17659)
-- Name: fki_FK-LugarT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarT" ON public."Taller" USING btree ("FK-LugarT");


--
-- TOC entry 2887 (class 1259 OID 17510)
-- Name: fki_FK-MarcaM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-MarcaM" ON public."Modelo" USING btree ("FK-MarcaM");


--
-- TOC entry 2847 (class 1259 OID 17408)
-- Name: fki_FK-ModeloA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloA" ON public."Avion" USING btree ("FK-ModeloA");


--
-- TOC entry 2850 (class 1259 OID 17420)
-- Name: fki_FK-ModeloB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloB" ON public."Barco" USING btree ("FK-ModeloB");


--
-- TOC entry 2942 (class 1259 OID 17706)
-- Name: fki_FK-ModeloT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloT" ON public."Terrestre" USING btree ("FK-ModeloT");


--
-- TOC entry 2851 (class 1259 OID 17426)
-- Name: fki_FK-PuertoB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-PuertoB" ON public."Barco" USING btree ("FK-PuertoB");


--
-- TOC entry 2957 (class 1259 OID 17760)
-- Name: fki_FK-RolU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-RolU" ON public."Usuario" USING btree ("FK-RolU");


--
-- TOC entry 2918 (class 1259 OID 17635)
-- Name: fki_FK-Ruta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Ruta" ON public."Ruta" USING btree ("FK-Ruta");


--
-- TOC entry 2904 (class 1259 OID 17564)
-- Name: fki_FK-Sucursal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal" ON public."Paquete" USING btree ("FK-Sucursal");


--
-- TOC entry 2919 (class 1259 OID 17623)
-- Name: fki_FK-Sucursal1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal1" ON public."Ruta" USING btree ("FK-Sucursal1");


--
-- TOC entry 2920 (class 1259 OID 17629)
-- Name: fki_FK-Sucursal2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal2" ON public."Ruta" USING btree ("Fk-Sucursal2");


--
-- TOC entry 2839 (class 1259 OID 17384)
-- Name: fki_FK-SucursalA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalA" ON public."Aeropuerto" USING btree ("FK-SucursalA");


--
-- TOC entry 2861 (class 1259 OID 17779)
-- Name: fki_FK-SucursalEmp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalEmp" ON public."Empleado" USING btree ("FK-SucursalEmp");


--
-- TOC entry 2870 (class 1259 OID 17468)
-- Name: fki_FK-SucursalG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalG" ON public."Gastos" USING btree ("FK-SucursalG");


--
-- TOC entry 2909 (class 1259 OID 17604)
-- Name: fki_FK-SucursalPu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalPu" ON public."Puerto" USING btree ("FK-Sucursal");


--
-- TOC entry 2939 (class 1259 OID 17677)
-- Name: fki_FK-SucursalT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalT" ON public."Telefono" USING btree ("FK-SucursalT");


--
-- TOC entry 2943 (class 1259 OID 17700)
-- Name: fki_FK-SucursalTe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalTe" ON public."Terrestre" USING btree ("FK-SucursalT");


--
-- TOC entry 2966 (class 1259 OID 17754)
-- Name: fki_FK-SucursalZ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalZ" ON public."Zona" USING btree ("FK-SucursalZ");


--
-- TOC entry 2931 (class 1259 OID 17665)
-- Name: fki_FK-TelefonoT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TelefonoT" ON public."Taller" USING btree ("FK-TelefonoT");


--
-- TOC entry 2905 (class 1259 OID 17558)
-- Name: fki_FK-TipoPaquete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TipoPaquete" ON public."Paquete" USING btree ("FK-TipoPaquete");


--
-- TOC entry 2880 (class 1259 OID 17492)
-- Name: fki_PlacaA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA" ON public."Mantenimiento" USING btree ("PlacaA");


--
-- TOC entry 2961 (class 1259 OID 17730)
-- Name: fki_PlacaA-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaA");


--
-- TOC entry 2881 (class 1259 OID 17498)
-- Name: fki_PlacaB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB" ON public."Mantenimiento" USING btree ("PlacaB");


--
-- TOC entry 2962 (class 1259 OID 17736)
-- Name: fki_PlacaB-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaB");


--
-- TOC entry 2882 (class 1259 OID 17504)
-- Name: fki_PlacaT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT" ON public."Mantenimiento" USING btree ("PlacaT");


--
-- TOC entry 2963 (class 1259 OID 17742)
-- Name: fki_PlacaT-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaT");


--
-- TOC entry 2972 (class 2606 OID 17391)
-- Name: Asistencia CIEmpleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "CIEmpleado" FOREIGN KEY ("CIEmpleado") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3009 (class 2606 OID 17611)
-- Name: Rol-Accion CODAccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODAccion" FOREIGN KEY ("CODAccion") REFERENCES public."Accion"("COD");


--
-- TOC entry 2994 (class 2606 OID 17535)
-- Name: Pago-Metodo CODCheque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODCheque" FOREIGN KEY ("CODCheque") REFERENCES public."Cheque"("COD");


--
-- TOC entry 2996 (class 2606 OID 17547)
-- Name: Pago-Metodo CODEfect; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODEfect" FOREIGN KEY ("CODEfect") REFERENCES public."Efectivo"("COD");


--
-- TOC entry 3027 (class 2606 OID 17719)
-- Name: Traslado CODEnvio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODEnvio" FOREIGN KEY ("CODEnvio") REFERENCES public."Envio"("COD");


--
-- TOC entry 2992 (class 2606 OID 17523)
-- Name: Pago-Metodo CODPago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODPago" FOREIGN KEY ("CODPago") REFERENCES public."Pago"("COD");


--
-- TOC entry 3008 (class 2606 OID 17605)
-- Name: Rol-Accion CODRol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODRol" FOREIGN KEY ("CODRol") REFERENCES public."Rol"("COD");


--
-- TOC entry 3034 (class 2606 OID 17743)
-- Name: Veh-Rut CODRuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "CODRuta" FOREIGN KEY ("CODRuta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 2987 (class 2606 OID 17481)
-- Name: Mantenimiento CODTaller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "CODTaller" FOREIGN KEY ("CODTaller") REFERENCES public."Taller"("COD");


--
-- TOC entry 2993 (class 2606 OID 17529)
-- Name: Pago-Metodo CODTarjeta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTarjeta" FOREIGN KEY ("CODTarjeta") REFERENCES public."Tarjeta"("COD");


--
-- TOC entry 2995 (class 2606 OID 17541)
-- Name: Pago-Metodo CODTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTrans" FOREIGN KEY ("CODTrans") REFERENCES public."Transferencia"("COD");


--
-- TOC entry 3026 (class 2606 OID 17713)
-- Name: Traslado CODVeh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODVeh-Rut" FOREIGN KEY ("CODVeh-Rut") REFERENCES public."Veh-Rut"("COD");


--
-- TOC entry 2973 (class 2606 OID 17397)
-- Name: Asistencia CODZona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "CODZona" FOREIGN KEY ("CODZona") REFERENCES public."Zona"("COD");


--
-- TOC entry 2975 (class 2606 OID 17409)
-- Name: Avion FK-Aeropuerto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-Aeropuerto" FOREIGN KEY ("FK-Aeropuerto") REFERENCES public."Aeropuerto"("COD");


--
-- TOC entry 2985 (class 2606 OID 17469)
-- Name: L-VIP FK-CLienteL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "FK-CLienteL" FOREIGN KEY ("FK-ClienteL") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3021 (class 2606 OID 17684)
-- Name: Telefono FK-Cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Cliente" FOREIGN KEY ("FK-Cliente") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3000 (class 2606 OID 17576)
-- Name: Paquete FK-Cliente1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente1" FOREIGN KEY ("FK-Cliente1") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3001 (class 2606 OID 17582)
-- Name: Paquete FK-Cliente2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente2" FOREIGN KEY ("FK-Cliente2") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3036 (class 2606 OID 17439)
-- Name: Efectivo FK-ClienteE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "FK-ClienteE" FOREIGN KEY ("FK-ClienteE") REFERENCES public."Cliente"("CI");


--
-- TOC entry 2978 (class 2606 OID 17427)
-- Name: Cheque FK-ClienteM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "FK-ClienteM" FOREIGN KEY ("FK-ClienteM") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3018 (class 2606 OID 17666)
-- Name: Tarjeta FK-ClienteT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "FK-ClienteT" FOREIGN KEY ("FK-ClienteT") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3025 (class 2606 OID 17707)
-- Name: Transferencia FK-ClienteTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "FK-ClienteTrans" FOREIGN KEY ("FK-ClienteTrans") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3029 (class 2606 OID 17761)
-- Name: Usuario FK-ClienteU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-ClienteU" FOREIGN KEY ("FK-ClienteU") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3020 (class 2606 OID 17678)
-- Name: Telefono FK-Empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Empleado" FOREIGN KEY ("FK-Empleado") REFERENCES public."Empleado"("CI");


--
-- TOC entry 2982 (class 2606 OID 17451)
-- Name: Envio FK-EmpleadoE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EmpleadoE" FOREIGN KEY ("FK-EmpleadoE") REFERENCES public."Empleado"("CI");


--
-- TOC entry 2997 (class 2606 OID 17511)
-- Name: Pago FK-EmpleadoP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EmpleadoP" FOREIGN KEY ("FK-EmpleadoP") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3015 (class 2606 OID 17648)
-- Name: Sucursal FK-EmpleadoS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "FK-EmpleadoS" FOREIGN KEY ("FK-EmpleadoS") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3030 (class 2606 OID 17767)
-- Name: Usuario FK-EmpleadoU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-EmpleadoU" FOREIGN KEY ("FK-EmpleadoU") REFERENCES public."Empleado"("CI");


--
-- TOC entry 2998 (class 2606 OID 17517)
-- Name: Pago FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3004 (class 2606 OID 17565)
-- Name: Paquete FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 2999 (class 2606 OID 17570)
-- Name: Paquete FK-EnvioPa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioPa" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 2983 (class 2606 OID 17457)
-- Name: Envio FK-EstatusE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EstatusE" FOREIGN KEY ("FK-EstatusE") REFERENCES public."Estatus"("COD");


--
-- TOC entry 2980 (class 2606 OID 17445)
-- Name: Empleado FK-GastosE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-GastosE" FOREIGN KEY ("FK-GastosE") REFERENCES public."Gastos"("COD");


--
-- TOC entry 3013 (class 2606 OID 17636)
-- Name: Servicio FK-GastosS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "FK-GastosS" FOREIGN KEY ("FK-GastosS") REFERENCES public."Gastos"("COD");


--
-- TOC entry 2971 (class 2606 OID 17385)
-- Name: Aeropuerto FK-LugarAe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-LugarAe" FOREIGN KEY ("FK-LugarAe") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2979 (class 2606 OID 17433)
-- Name: Cliente FK-LugarC; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "FK-LugarC" FOREIGN KEY ("FK-LugarC") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2986 (class 2606 OID 17475)
-- Name: Lugar FK-LugarL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "FK-LugarL" FOREIGN KEY ("Fk-LugarL") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3005 (class 2606 OID 17588)
-- Name: Puerto FK-LugarP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-LugarP" FOREIGN KEY ("FK-LugarP") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3014 (class 2606 OID 17642)
-- Name: Sucursal FK-LugarS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "FK-LugarS" FOREIGN KEY ("FK-LugarS") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3016 (class 2606 OID 17654)
-- Name: Taller FK-LugarT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-LugarT" FOREIGN KEY ("FK-LugarT") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2991 (class 2606 OID 17505)
-- Name: Modelo FK-MarcaM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "FK-MarcaM" FOREIGN KEY ("FK-MarcaM") REFERENCES public."Marca"("COD");


--
-- TOC entry 2974 (class 2606 OID 17403)
-- Name: Avion FK-ModeloA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-ModeloA" FOREIGN KEY ("FK-ModeloA") REFERENCES public."Modelo"("COD");


--
-- TOC entry 2976 (class 2606 OID 17415)
-- Name: Barco FK-ModeloB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-ModeloB" FOREIGN KEY ("FK-ModeloB") REFERENCES public."Modelo"("COD");


--
-- TOC entry 3024 (class 2606 OID 17701)
-- Name: Terrestre FK-ModeloT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-ModeloT" FOREIGN KEY ("FK-ModeloT") REFERENCES public."Modelo"("COD");


--
-- TOC entry 2977 (class 2606 OID 17421)
-- Name: Barco FK-PuertoB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-PuertoB" FOREIGN KEY ("FK-PuertoB") REFERENCES public."Puerto"("COD");


--
-- TOC entry 3028 (class 2606 OID 17755)
-- Name: Usuario FK-RolU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-RolU" FOREIGN KEY ("FK-RolU") REFERENCES public."Rol"("COD");


--
-- TOC entry 3012 (class 2606 OID 17630)
-- Name: Ruta FK-Ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Ruta" FOREIGN KEY ("FK-Ruta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 3003 (class 2606 OID 17559)
-- Name: Paquete FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3006 (class 2606 OID 17594)
-- Name: Puerto FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3010 (class 2606 OID 17618)
-- Name: Ruta FK-Sucursal1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal1" FOREIGN KEY ("FK-Sucursal1") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3011 (class 2606 OID 17624)
-- Name: Ruta FK-Sucursal2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal2" FOREIGN KEY ("Fk-Sucursal2") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2970 (class 2606 OID 17379)
-- Name: Aeropuerto FK-SucursalA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-SucursalA" FOREIGN KEY ("FK-SucursalA") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2981 (class 2606 OID 17774)
-- Name: Empleado FK-SucursalEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-SucursalEmp" FOREIGN KEY ("FK-SucursalEmp") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2984 (class 2606 OID 17463)
-- Name: Gastos FK-SucursalG; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gastos"
    ADD CONSTRAINT "FK-SucursalG" FOREIGN KEY ("FK-SucursalG") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3007 (class 2606 OID 17599)
-- Name: Puerto FK-SucursalPu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-SucursalPu" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3019 (class 2606 OID 17672)
-- Name: Telefono FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3022 (class 2606 OID 17690)
-- Name: Terrestre FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3023 (class 2606 OID 17695)
-- Name: Terrestre FK-SucursalTe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalTe" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3035 (class 2606 OID 17749)
-- Name: Zona FK-SucursalZ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "FK-SucursalZ" FOREIGN KEY ("FK-SucursalZ") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3017 (class 2606 OID 17660)
-- Name: Taller FK-TelefonoT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-TelefonoT" FOREIGN KEY ("FK-TelefonoT") REFERENCES public."Telefono"("COD");


--
-- TOC entry 3002 (class 2606 OID 17553)
-- Name: Paquete FK-TipoPaquete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-TipoPaquete" FOREIGN KEY ("FK-TipoPaquete") REFERENCES public."TipoPaquete"("COD");


--
-- TOC entry 2988 (class 2606 OID 17487)
-- Name: Mantenimiento PlacaA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaA" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 3031 (class 2606 OID 17725)
-- Name: Veh-Rut PlacaA-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaA-Veh-Rut" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 2989 (class 2606 OID 17493)
-- Name: Mantenimiento PlacaB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaB" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 3032 (class 2606 OID 17731)
-- Name: Veh-Rut PlacaB-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaB-Veh-Rut" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 2990 (class 2606 OID 17499)
-- Name: Mantenimiento PlacaT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaT" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


--
-- TOC entry 3033 (class 2606 OID 17737)
-- Name: Veh-Rut PlacaT-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaT-Veh-Rut" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


-- Completed on 2018-12-11 00:00:11

--
-- PostgreSQL database dump complete
--

