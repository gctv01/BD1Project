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

COPY public."Accion" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 20966)
-- Dependencies: 197
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Aeropuerto" ("COD", "CantTerminales", "CantPistas", "Capacidad", "FK-SucursalA", "FK-LugarAe") FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 20969)
-- Dependencies: 198
-- Data for Name: Asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Asistencia" ("COD", "CIEmpleado", "CODZona", "HoraEntrada", "HoraSalida") FROM stdin;
\.


--
-- TOC entry 3182 (class 0 OID 20972)
-- Dependencies: 199
-- Data for Name: Avion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Avion" ("SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Longitud", "PesoVacio", "Envergadura", "PesoMax", "Altura", "AnchoCabina", "CapacidadCombustible", "CarreraDespegue", "DiametroFuselaje", "FK-ModeloA", "FK-Aeropuerto", "Placa") FROM stdin;
980	5000	500000		98765	2018-11-30	4000	499999	15000	6000000	1000000	10000	543	0	876	\N	\N	456DEF
\.


--
-- TOC entry 3183 (class 0 OID 20978)
-- Dependencies: 200
-- Data for Name: Barco; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Barco" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Nombre", "FK-ModeloB", "FK-PuertoB") FROM stdin;
123ABC	980	100	1000		456	1999-01-01	Elena	\N	\N
\.


--
-- TOC entry 3184 (class 0 OID 20984)
-- Dependencies: 201
-- Data for Name: Cheque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cheque" ("COD", "Banco", "NroCuenta", "Fecha", "Monto", "FK-ClienteM", "Descripcion") FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 20990)
-- Dependencies: 202
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cliente" ("CI", "Nombre", "Apellido", "FechaNac", "EstadoCivil", "Trabajo", "FK-LugarC") FROM stdin;
45678	Gladys	Moreno	1990-01-13	Soltero	Ingeniero en procesos	\N
25213842	Brian	Moreno	1998-10-17	Soltero	Entrenador Pokemon	\N
26726082	Rafael	Jimenez	1998-11-02	Casado		\N
\.


--
-- TOC entry 3186 (class 0 OID 20996)
-- Dependencies: 203
-- Data for Name: Efectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Efectivo" ("COD", "Descripcion", "Moneda", "FK-ClienteE") FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 21002)
-- Dependencies: 204
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Empleado" ("CI", "Nombre", "Apellido", "FechaNac", "Correo", "NivelAca", "Profesion", "EstadoCivil", "CantHijos", "CorreoEmpresa", "SalarioAsig", "FechaContratado", "FechaFinal", "FK-GastosE", "FK-SucursalEmp", "FK-HorarioEmp") FROM stdin;
6316457	Elena	Moreno	0001-01-01 BC	Rita@gmail.com	Profesional	Abogado	Soltero	2	Rita2@LogUCAB.com	2000	1967-12-13	0001-01-01 BC	\N	\N	\N
4823744	Gladys	Moreno	0001-01-01 BC	Gladista@gmail.com	Profesional	Ingeniero	Soltero	1	Gladys	3500	1998-12-13	0001-01-01 BC	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 21008)
-- Dependencies: 205
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Envio" ("COD", "FechaInicio", "FechaLlegada", "Origen", "Destino", "Monto", "FK-EmpleadoE", "FK-EstatusE") FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 21014)
-- Dependencies: 206
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estatus" ("COD", "Nombre") FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 21020)
-- Dependencies: 207
-- Data for Name: Gastos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gastos" ("COD", "Nombre", "MontoTotal", "Pagado", "FK-SucursalG") FROM stdin;
1	Luz	2000	t	1
2	Agua	2100	t	2
3	Gas	2200	t	3
4	Salarios	2300	f	4
5	Comida	2400	t	5
\.


--
-- TOC entry 3191 (class 0 OID 21026)
-- Dependencies: 208
-- Data for Name: Horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Horario" ("COD", "HorarioInicio", "HorarioFinal") FROM stdin;
\.


--
-- TOC entry 3192 (class 0 OID 21029)
-- Dependencies: 209
-- Data for Name: L-VIP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."L-VIP" ("NroCarnet", "FK-ClienteL") FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 21032)
-- Dependencies: 210
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
-- TOC entry 3194 (class 0 OID 21038)
-- Dependencies: 211
-- Data for Name: Mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 21044)
-- Dependencies: 212
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Marca" ("COD", "Nombre") FROM stdin;
1	Isuzu
2	Mazda
3	Lexus
4	Nissan
5	Chrysler
\.


--
-- TOC entry 3196 (class 0 OID 21050)
-- Dependencies: 213
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Modelo" ("COD", "Nombre", "FK-MarcaM") FROM stdin;
1	Panamera	1
2	350Z	2
3	Sienna	3
4	Civic Si	4
5	Sephia	5
\.


--
-- TOC entry 3197 (class 0 OID 21056)
-- Dependencies: 214
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pago" ("COD", "MontoTotal", "Fecha", "PagoDest", "FK-EmpleadoP", "FK-EnvioP") FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 21059)
-- Dependencies: 215
-- Data for Name: Pago-Metodo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pago-Metodo" ("COD", "CODPago", "CODTarjeta", "CODCheque", "CODTrans", "CODEfect") FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 21062)
-- Dependencies: 216
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Paquete" ("COD", "Peso", "Volumen", "CostoxPesoxVolumen", "FK-TipoPaquete", "FK-Sucursal", "FK-EnvioP", "FK-Cliente1", "FK-Cliente2") FROM stdin;
\.


--
-- TOC entry 3200 (class 0 OID 21065)
-- Dependencies: 217
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Puerto" ("COD", "Puestos", "Calado", "TotalMuelles", "Uso", "Longitud", "Ancho", "FK-LugarP", "FK-Sucursal") FROM stdin;
\.


--
-- TOC entry 3201 (class 0 OID 21071)
-- Dependencies: 218
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol" ("COD", "Nombre") FROM stdin;
1	Administrador
10	Cliente
\.


--
-- TOC entry 3202 (class 0 OID 21077)
-- Dependencies: 219
-- Data for Name: Rol-Accion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol-Accion" ("COD", "CODRol", "CODAccion") FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 21080)
-- Dependencies: 220
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ruta" ("COD", "FK-Sucursal1", "FK-Sucursal2", "FK-Ruta", "Duracion") FROM stdin;
1	1	2	\N	1
11	35	38	\N	50
\.


--
-- TOC entry 3204 (class 0 OID 21083)
-- Dependencies: 221
-- Data for Name: Servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Servicio" ("COD", "Nombre", "FK-GastosS") FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 21089)
-- Dependencies: 222
-- Data for Name: Sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Sucursal" ("COD", "Nombre", "Capacidad", "Correo", "Almacenamiento", "FK-LugarS", "FK-EmpleadoS") FROM stdin;
2	Photolist	510	mshawel1@answers.com	201	2	2501000
3	Realcube	520	tabramowitch2@zdnet.com	202	3	2502000
4	Riffwire	530	rbrader3@soup.io	203	4	2503000
5	Meetz	540	rlanceter4@weibo.com	204	5	2504000
6	Zoombeat	550	opalfrey5@acquirethisname.com	205	6	2505000
7	Dynabox	560	zwimlett6@vimeo.com	206	7	2506000
8	Zoomdog	570	edibble7@msu.edu	207	8	2507000
9	Shuffledrive	580	acourage8@yandex.ru	208	9	2508000
10	Jabbercube	590	raprahamian9@businessinsider.com	209	10	2509000
11	Jabbercube	600	prendlea@redcross.org	210	11	2510000
12	Jaxnation	610	cshoorbrookeb@artisteer.com	211	12	2511000
13	Trupe	620	eatkynsc@dion.ne.jp	212	13	2512000
14	Eamia	630	gworged@lulu.com	213	14	2513000
15	Skibox	640	schoulertone@nasa.gov	214	15	2514000
16	Oyoba	650	esandyfirthf@devhub.com	215	16	2515000
17	Jaloo	660	njahnigg@parallels.com	216	17	2516000
18	Bubblebox	670	cphiloth@state.gov	217	18	2517000
19	Innojam	680	mdutsoni@princeton.edu	218	19	2518000
20	Photofeed	690	mcurleyj@e-recht24.de	219	20	2519000
21	Skalith	700	dlamblotk@japanpost.jp	220	21	2520000
22	Babblestorm	710	hscholerl@reuters.com	221	22	2521000
23	Plambee	720	ibaintonm@oakley.com	222	23	2522000
24	Devbug	730	aanthonn@baidu.com	223	24	2523000
25	Blogtag	740	hgreenroado@canalblog.com	224	25	2524000
26	Vinder	750	askacelp@devhub.com	225	26	2525000
27	Blogtag	760	mbendigq@dropbox.com	226	27	2526000
28	Jaxbean	770	byouingsr@umich.edu	227	28	2527000
29	Skalith	780	pmcivers@bloglovin.com	228	29	2528000
30	Edgewire	790	akuhndelt@bloglines.com	229	30	2529000
31	Innotype	800	rcrossfieldu@ezinearticles.com	230	31	2530000
32	Zoozzy	509	bspellingv@salon.com	231	32	2531000
33	Twitterlist	519	gbarenskyw@redcross.org	232	33	2532000
34	Zazio	529	phamsonx@dot.gov	233	34	2533000
35	Yakidoo	539	ktregeay@reverbnation.com	234	35	2534000
36	Zooveo	549	jhanksz@vistaprint.com	235	36	2535000
37	Fivespan	559	cbosward10@nytimes.com	236	37	2536000
38	Talane	569	nlingard11@51.la	237	38	2537000
39	Oyoyo	579	geacott12@gmpg.org	238	39	2538000
40	Trilith	589	cinkpen13@4shared.com	239	40	2539000
41	Brightdog	599	snoirel14@slashdot.org	240	41	2540000
42	Myworks	609	csherburn15@cisco.com	241	42	2541000
43	Kamba	619	vhubback16@studiopress.com	242	43	2542000
44	Dabfeed	629	hbrodie17@usatoday.com	243	44	2543000
45	Jabberstorm	639	rpagin18@opera.com	244	45	2544000
46	Youbridge	649	wchamney19@fotki.com	245	46	2545000
47	Fivespan	659	edupree1a@deviantart.com	246	47	2546000
48	Skyba	669	acayser1b@gov.uk	247	48	2547000
49	Mycat	679	slesurf1c@imgur.com	248	49	2548000
50	Devbug	689	mnelles1d@fda.gov	249	50	2549000
51	Roomm	699	ftropman1e@deviantart.com	250	51	2550000
52	Oodoo	709	bmurfin1f@ehow.com	251	52	2551000
53	Rhynyx	719	jsheerman1g@dailymail.co.uk	252	53	2552000
54	Trilia	729	famps1h@latimes.com	253	54	2553000
55	Mudo	739	csommerton1i@diigo.com	254	55	2554000
56	Edgepulse	749	lprendiville1j@mac.com	255	56	2555000
57	Tazzy	759	adowne1k@1688.com	256	57	2556000
58	Thoughtbeat	769	lmilne1l@ifeng.com	257	58	2557000
59	Zoomlounge	779	mcrat1m@huffingtonpost.com	258	59	2558000
60	Skiptube	789	spretley1n@marketwatch.com	259	60	2559000
61	Minyx	799	mderrington1o@forbes.com	260	61	2560000
62	Voomm	508	krumbelow1p@fotki.com	261	62	2561000
63	Omba	518	abootton1q@usnews.com	262	63	2562000
64	Voolith	528	bfylan1r@nyu.edu	263	64	2563000
65	Plajo	538	mkenner1s@t.co	264	65	2564000
66	Dabvine	548	omancer1t@blogspot.com	265	66	2565000
67	Viva	558	imerring1u@studiopress.com	266	67	2566000
68	Mita	568	cvidineev1v@wiley.com	267	68	2567000
69	Brightdog	578	lhalsall1w@paginegialle.it	268	69	2568000
70	Thoughtstorm	588	aoconor1x@shop-pro.jp	269	70	2569000
71	Jetpulse	598	dswiers1y@huffingtonpost.com	270	71	2570000
72	Blogpad	608	kjustham1z@whitehouse.gov	271	72	2571000
73	Oyondu	618	sswaysland20@histats.com	272	73	2572000
74	Skyble	628	gleverson21@usgs.gov	273	74	2573000
75	Feedfire	638	menga22@digg.com	274	75	2574000
76	Photobug	648	cisselee23@disqus.com	275	76	2575000
77	LiveZ	658	clammerts24@berkeley.edu	276	77	2576000
78	Tavu	668	lmccrachen25@who.int	277	78	2577000
79	Jetpulse	678	aneads26@reverbnation.com	278	79	2578000
80	Twitterbeat	688	dsweeten27@goo.ne.jp	279	80	2579000
81	Divanoodle	698	jalf28@yellowpages.com	280	81	2580000
82	Digitube	708	astearns29@chicagotribune.com	281	82	2581000
83	Youfeed	718	rtoolin2a@columbia.edu	282	83	2582000
84	Trunyx	728	mturmell2b@ning.com	283	84	2583000
85	Trupe	738	bcottell2c@ask.com	284	85	2584000
86	Jabberbean	748	cstibbs2d@elegantthemes.com	285	86	2585000
87	Yozio	758	jforsdicke2e@ox.ac.uk	286	87	2586000
88	Kayveo	768	hjotcham2f@techcrunch.com	287	88	2587000
89	Ooba	778	khamlyn2g@reddit.com	288	89	2588000
90	Babbleblab	788	eknivett2h@irs.gov	289	90	2589000
91	Yodoo	798	amccarly2i@cargocollective.com	290	91	2590000
92	Wikizz	507	shuffa2j@nsw.gov.au	291	92	2591000
93	Avamba	517	hsheasby2k@netscape.com	292	93	2592000
94	Kare	527	wjaquiss2l@google.ru	293	94	2593000
95	Vipe	537	fkillgus2m@ifeng.com	294	95	2594000
96	Vinder	547	bkarran2n@linkedin.com	295	96	2595000
97	Babbleopia	557	vtitcom2o@slashdot.org	296	97	2596000
98	Dynava	567	lfritter2p@xrea.com	297	98	2597000
99	Dabtype	577	tfullalove2q@lulu.com	298	99	2598000
100	Chatterbridge	587	jkliemke2r@cnbc.com	299	100	2599000
101	Digitube	597	aansett2s@netvibes.com	300	101	2600000
102	Zooveo	607	icorlett2t@delicious.com	301	102	2500999
103	Kamba	617	aaizikovitz2u@mtv.com	302	103	2501999
104	Vinder	627	amellor2v@friendfeed.com	303	104	2502999
105	Divape	637	jemanueli2w@house.gov	304	105	2503999
106	Tagchat	647	ecarrivick2x@parallels.com	305	106	2504999
107	Shufflebeat	657	khawsby2y@youtu.be	306	107	2505999
108	Camimbo	667	gimlen2z@prlog.org	307	108	2506999
109	Divavu	677	zdanniel30@yandex.ru	308	109	2507999
110	Latz	687	nbarribal31@printfriendly.com	309	110	2508999
111	Realcube	697	tpollok32@eepurl.com	310	111	2509999
112	Realmix	707	rsirman33@netvibes.com	311	112	2510999
113	Avamm	717	ggasperi34@usnews.com	312	113	2511999
114	Buzzshare	727	jtollerfield35@oaic.gov.au	313	114	2512999
115	Chatterbridge	737	shuban36@simplemachines.org	314	115	2513999
116	Eamia	747	mhemmingway37@php.net	315	116	2514999
117	Eimbee	757	hsnowdon38@trellian.com	316	117	2515999
118	Lazzy	767	mhawkridge39@cloudflare.com	317	118	2516999
119	Ntag	777	kgencke3a@list-manage.com	318	119	2517999
120	Gabspot	787	dborman3b@baidu.com	319	120	2518999
121	Oloo	797	rgodfray3c@weather.com	320	121	2519999
122	Meembee	506	tpell3d@icio.us	321	122	2520999
123	Dabshots	516	rhutchens3e@nyu.edu	322	123	2521999
124	Quinu	526	aabrahamson3f@baidu.com	323	124	2522999
125	Gabtune	536	codlin3g@1und1.de	324	125	2523999
126	Skivee	546	ctrouel3h@auda.org.au	325	126	2524999
127	Quaxo	556	vscholer3i@baidu.com	326	127	2525999
128	Voomm	566	mgoozee3j@qq.com	327	128	2526999
129	Wordify	576	czaniolini3k@ocn.ne.jp	328	129	2527999
130	Jaxspan	586	cdallyn3l@phpbb.com	329	130	2528999
131	Topiczoom	596	gmelendez3m@freewebs.com	330	131	2529999
132	Zava	606	hvogele3n@ovh.net	331	132	2530999
133	Voonix	616	gpozzo3o@state.tx.us	332	133	2531999
134	Thoughtbridge	626	sblaxeland3p@freewebs.com	333	134	2532999
135	JumpXS	636	onottle3q@moonfruit.com	334	135	2533999
136	Yodoo	646	rnickoll3r@bizjournals.com	335	136	2534999
137	Demimbu	656	gcove3s@buzzfeed.com	336	137	2535999
138	Demivee	666	igrigorkin3t@plala.or.jp	337	138	2536999
139	Brainlounge	676	smarielle3u@indiegogo.com	338	139	2537999
140	Brainbox	686	hmacconnal3v@npr.org	339	140	2538999
141	Eayo	696	ctrustram3w@ox.ac.uk	340	141	2539999
142	Meevee	706	rickovici3x@linkedin.com	341	142	2540999
143	Dabjam	716	drutter3y@howstuffworks.com	342	143	2541999
144	Zoombeat	726	gshakesby3z@yellowbook.com	343	144	2542999
145	Fivechat	736	pfratson40@networkadvertising.org	344	145	2543999
146	Skippad	746	dadanez41@npr.org	345	146	2544999
147	Jazzy	756	aeakins42@blinklist.com	346	147	2545999
148	Lazzy	766	cchill43@bandcamp.com	347	148	2546999
149	Zava	776	vfieldgate44@amazon.co.uk	348	149	2547999
150	Trudeo	786	aliven45@hatena.ne.jp	349	150	2548999
151	Myworks	796	hboldero46@loc.gov	350	151	2549999
152	Wikizz	505	rorable47@myspace.com	351	152	2550999
153	Quire	515	jritchley48@gravatar.com	352	153	2551999
154	Kwimbee	525	mtrahmel49@technorati.com	353	154	2552999
155	Jetpulse	535	dbenedidick4a@sun.com	354	155	2553999
156	Jaxworks	545	gkaes4b@edublogs.org	355	156	2554999
157	Skippad	555	melletson4c@smugmug.com	356	157	2555999
158	Fadeo	565	tlembke4d@umich.edu	357	158	2556999
159	Dynabox	575	sguilbert4e@goodreads.com	358	159	2557999
160	Oodoo	585	aoneil4f@purevolume.com	359	160	2558999
161	Wordware	595	mlindwasser4g@joomla.org	360	161	2559999
162	Abatz	605	sgriswood4h@cnbc.com	361	162	2560999
163	Lazzy	615	epolon4i@japanpost.jp	362	163	2561999
164	Linkbuzz	625	dshenton4j@themeforest.net	363	164	2562999
165	Topdrive	635	hdanzey4k@sun.com	364	165	2563999
166	Livepath	645	jdurbann4l@umn.edu	365	166	2564999
167	Bluejam	655	norchart4m@upenn.edu	366	167	2565999
168	Yodo	665	twoodroff4n@newyorker.com	367	168	2566999
169	Oyoba	675	abelch4o@meetup.com	368	169	2567999
170	Jabbersphere	685	kkydde4p@umn.edu	369	170	2568999
171	Npath	695	esoldan4q@plala.or.jp	370	171	2569999
172	Eimbee	705	efanning4r@usnews.com	371	172	2570999
173	Wikibox	715	kbraunton4s@com.com	372	173	2571999
174	Thoughtstorm	725	onorgate4t@theatlantic.com	373	174	2572999
175	Latz	735	czaple4u@jugem.jp	374	175	2573999
176	Brightdog	745	gneasam4v@addtoany.com	375	176	2574999
177	Avamba	755	bboissieux4w@joomla.org	376	177	2575999
178	Topdrive	765	omaccoveney4x@biblegateway.com	377	178	2576999
179	Thoughtbridge	775	mshirtliff4y@people.com.cn	378	179	2577999
180	Flipopia	785	kprovost4z@java.com	379	180	2578999
181	Feedspan	795	afeyer50@fema.gov	380	181	2579999
182	Devshare	504	dhanrahan51@cbc.ca	381	182	2580999
183	Tagtune	514	nfranke52@oaic.gov.au	382	183	2581999
184	Zooxo	524	bbelcham53@vimeo.com	383	184	2582999
185	Edgetag	534	tcoughlan54@w3.org	384	185	2583999
186	Rhyloo	544	gride55@senate.gov	385	186	2584999
187	Topiclounge	554	jscrinage56@cocolog-nifty.com	386	187	2585999
188	Dabshots	564	mhymans57@webeden.co.uk	387	188	2586999
189	Lazzy	574	vickowicz58@jalbum.net	388	189	2587999
190	Skippad	584	rharrie59@alibaba.com	389	190	2588999
191	Vitz	594	bjagielski5a@elegantthemes.com	390	191	2589999
192	Zoomdog	604	dlemonnier5b@xing.com	391	192	2590999
193	Edgewire	614	kknightsbridge5c@bluehost.com	392	193	2591999
194	Pixope	624	jsimao5d@hubpages.com	393	194	2592999
195	Ainyx	634	jgathwaite5e@cam.ac.uk	394	195	2593999
196	Meeveo	644	tkaplan5f@imgur.com	395	196	2594999
197	Roomm	654	mseadon5g@dell.com	396	197	2595999
198	Topicware	664	classen5h@imageshack.us	397	198	2596999
199	Thoughtmix	674	rgercken5i@symantec.com	398	199	2597999
200	Yakitri	684	bscoines5j@cbc.ca	399	200	2598999
201	Browsedrive	694	fleach5k@washingtonpost.com	400	201	2599999
202	Abatz	704	avurley5l@oaic.gov.au	200	202	2500998
203	Zoonoodle	714	lchippin5m@noaa.gov	201	203	2501998
204	Realbridge	724	zhaug5n@forbes.com	202	204	2502998
205	Yamia	734	sboothby5o@ucoz.com	203	205	2503998
206	Yacero	744	mblais5p@businesswire.com	204	206	2504998
207	Gigaclub	754	gdebiaggi5q@issuu.com	205	207	2505998
208	Avamm	764	ljudge5r@facebook.com	206	208	2506998
209	Zoovu	774	cleban5s@weebly.com	207	209	2507998
210	Jaxworks	784	dwillson5t@va.gov	208	210	2508998
211	Eazzy	794	lwallege5u@cbslocal.com	209	211	2509998
212	Buzzdog	503	seseler5v@mapquest.com	210	212	2510998
213	Feedspan	513	fhaines5w@vimeo.com	211	213	2511998
214	Demivee	523	ysumbler5x@arizona.edu	212	214	2512998
215	Skaboo	533	cmoncrefe5y@netscape.com	213	215	2513998
216	Flashpoint	543	jchamberlen5z@bbc.co.uk	214	216	2514998
217	Livetube	553	bcard60@behance.net	215	217	2515998
218	Fanoodle	563	arubenovic61@addtoany.com	216	218	2516998
219	Mydo	573	epalmby62@time.com	217	219	2517998
220	Browsedrive	583	csterzaker63@google.it	218	220	2518998
221	Edgeify	593	tpeacey64@wisc.edu	219	221	2519998
222	Gigabox	603	sdring65@mapquest.com	220	222	2520998
223	Skipstorm	613	dbeiderbecke66@google.co.uk	221	223	2521998
224	Brainlounge	623	adulanty67@fema.gov	222	224	2522998
225	Twimm	633	uvarley68@usgs.gov	223	225	2523998
226	Photobug	643	jkennermann69@netvibes.com	224	226	2524998
227	Devpulse	653	dpillinger6a@yandex.ru	225	227	2525998
228	Blogspan	663	akerry6b@utexas.edu	226	228	2526998
229	Livefish	673	hkopfen6c@stanford.edu	227	229	2527998
230	Topiclounge	683	gredmell6d@ovh.net	228	230	2528998
231	Jetwire	693	ehukins6e@smh.com.au	229	231	2529998
232	Oba	703	cdainter6f@wikia.com	230	232	2530998
233	Edgetag	713	edoddridge6g@irs.gov	231	233	2531998
234	Avaveo	723	zstampfer6h@comcast.net	232	234	2532998
235	Photojam	733	dwedgwood6i@boston.com	233	235	2533998
236	Vidoo	743	cstolle6j@elegantthemes.com	234	236	2534998
237	Youopia	753	msineath6k@tiny.cc	235	237	2535998
238	Abata	763	jwharmby6l@1688.com	236	238	2536998
239	Thoughtmix	773	kpereira6m@prlog.org	237	239	2537998
240	Kayveo	783	ispinley6n@wsj.com	238	240	2538998
241	Devcast	793	bbrookshaw6o@aboutads.info	239	241	2539998
242	Izio	502	enutty6p@exblog.jp	240	242	2540998
243	Brightbean	512	gchander6q@reference.com	241	243	2541998
244	Trunyx	522	lmatzkaitis6r@sun.com	242	244	2542998
245	Meedoo	532	aleason6s@github.io	243	245	2543998
246	Fivebridge	542	rsenecaux6t@mozilla.org	244	246	2544998
247	Wikizz	552	sgreenhead6u@bloglines.com	245	247	2545998
248	Vimbo	562	aipplett6v@marketwatch.com	246	248	2546998
249	Kwimbee	572	jeve6w@over-blog.com	247	249	2547998
250	Trunyx	582	nraeburn6x@barnesandnoble.com	248	250	2548998
251	Flipbug	592	yelstub6y@ucsd.edu	249	251	2549998
252	Abatz	602	lfosdick6z@alibaba.com	250	252	2550998
253	Wikido	612	lbonnet70@loc.gov	251	253	2551998
254	Dynabox	622	fcosans71@oakley.com	252	254	2552998
255	Yodel	632	vsheber72@addtoany.com	253	255	2553998
256	Jaxbean	642	ascotchmur73@1688.com	254	256	2554998
257	Leenti	652	mpaudin74@merriam-webster.com	255	257	2555998
258	Youspan	662	gibotson75@friendfeed.com	256	258	2556998
259	Yombu	672	acomerford76@bravesites.com	257	259	2557998
260	Shufflebeat	682	cdreinan77@chron.com	258	260	2558998
261	Avamm	692	msearch78@ucsd.edu	259	261	2559998
262	Kazio	702	lwolver79@deviantart.com	260	262	2560998
263	Oyoyo	712	ckidsley7a@slate.com	261	263	2561998
264	Jabbertype	722	nsparks7b@si.edu	262	264	2562998
265	Voonder	732	bdamant7c@weather.com	263	265	2563998
266	Gigaclub	742	lhefferon7d@cbsnews.com	264	266	2564998
267	Yakidoo	752	kvolke7e@thetimes.co.uk	265	267	2565998
268	Meedoo	762	ngiovannini7f@networkadvertising.org	266	268	2566998
269	Skajo	772	cpethybridge7g@tamu.edu	267	269	2567998
270	Youspan	782	bbolesworth7h@mediafire.com	268	270	2568998
271	Zoozzy	792	blewzey7i@flickr.com	269	271	2569998
272	Tagopia	501	aroma7j@google.ca	270	272	2570998
273	Bluejam	511	vepgrave7k@domainmarket.com	271	273	2571998
274	Thoughtblab	521	cranstead7l@blogs.com	272	274	2572998
275	Jetpulse	531	ssaxelby7m@techcrunch.com	273	275	2573998
276	Twitterbridge	541	dcowterd7n@nyu.edu	274	276	2574998
277	Skiba	551	swhilder7o@state.gov	275	277	2575998
278	Janyx	561	lmenichini7p@yellowbook.com	276	278	2576998
279	Buzzbean	571	ddiano7q@deliciousdays.com	277	279	2577998
280	Cogilith	581	dkemp7r@godaddy.com	278	280	2578998
281	Oyope	591	mglennon7s@virginia.edu	279	281	2579998
282	Skinix	601	bmatschuk7t@youtu.be	280	282	2580998
283	Skivee	611	gdyet7u@bravesites.com	281	283	2581998
284	Blognation	621	kbarkus7v@yelp.com	282	284	2582998
285	Wordpedia	631	hsinclaire7w@google.com	283	285	2583998
286	Mudo	641	dbertome7x@com.com	284	286	2584998
287	Shuffletag	651	lbarme7y@twitpic.com	285	287	2585998
288	Meejo	661	swedlake7z@list-manage.com	286	288	2586998
289	Tazz	671	pantrim80@xrea.com	287	289	2587998
290	Blogtags	681	nyanin81@godaddy.com	288	290	2588998
291	Rhynyx	691	rcalwell82@chicagotribune.com	289	291	2589998
292	Centimia	701	cbamber83@webnode.com	290	292	2590998
293	Avavee	711	fmcconnel84@mayoclinic.com	291	293	2591998
294	Flashdog	721	jblethin85@time.com	292	294	2592998
295	Skimia	731	tgrimolbie86@booking.com	293	295	2593998
296	Jatri	741	phurtic87@ca.gov	294	296	2594998
297	Trudeo	751	aerskin88@squidoo.com	295	297	2595998
298	Shuffledrive	761	dmacneice89@meetup.com	296	298	2596998
299	Dazzlesphere	771	stipper8a@so-net.ne.jp	297	299	2597998
300	Wikizz	781	tlambkin8b@youtu.be	298	300	2598998
301	Chatterpoint	791	ivelten8c@123-reg.co.uk	299	301	2599998
302	Lazzy	500	etippell8d@cbc.ca	300	302	2500997
303	Zoomdog	510	sspire8e@csmonitor.com	301	303	2501997
304	Browsebug	520	tboichat8f@imgur.com	302	304	2502997
305	Innotype	530	cquickfall8g@alibaba.com	303	305	2503997
306	Abata	540	dwisdom8h@disqus.com	304	306	2504997
307	Trunyx	550	hsongest8i@quantcast.com	305	307	2505997
308	Thoughtbeat	560	lleyrroyd8j@spotify.com	306	308	2506997
309	Jetwire	570	cgrog8k@hp.com	307	309	2507997
310	Jatri	580	orubens8l@japanpost.jp	308	310	2508997
311	Dynava	590	achadburn8m@tinypic.com	309	311	2509997
312	Twimbo	600	twoodnutt8n@smh.com.au	310	312	2510997
313	Tagchat	610	soleszczak8o@tinypic.com	311	313	2511997
314	Divape	620	hbowlesworth8p@npr.org	312	314	2512997
315	Zoonoodle	630	tbonny8q@nasa.gov	313	315	2513997
316	Voolia	640	dcallendar8r@com.com	314	316	2514997
317	Dabjam	650	ahysom8s@studiopress.com	315	317	2515997
318	Yodoo	660	amccluskey8t@netvibes.com	316	318	2516997
319	Skinder	670	tdafter8u@google.pl	317	319	2517997
320	Leenti	680	cclissett8v@gnu.org	318	320	2518997
321	Skivee	690	bbeckwith8w@thetimes.co.uk	319	321	2519997
322	Twitterbeat	700	forthmann8x@fotki.com	320	322	2520997
323	Camido	710	bkilday8y@lulu.com	321	323	2521997
324	Ooba	720	kburleigh8z@comcast.net	322	324	2522997
325	Meejo	730	oventom90@bigcartel.com	323	325	2523997
326	Yamia	740	felsay91@intel.com	324	326	2524997
327	Bubblebox	750	nverdun92@amazon.co.jp	325	327	2525997
328	Photofeed	760	sbartke93@europa.eu	326	328	2526997
329	Tavu	770	sjollye94@soundcloud.com	327	329	2527997
330	Yombu	780	jklink95@constantcontact.com	328	330	2528997
331	Dabjam	790	tquarrie96@booking.com	329	331	2529997
332	Browseblab	800	wslatter97@home.pl	330	332	2530997
333	Twiyo	509	khaythornthwaite98@wikia.com	331	333	2531997
334	Skimia	519	pandover99@macromedia.com	332	334	2532997
335	Brightdog	529	kadrien9a@wisc.edu	333	335	2533997
336	Abatz	539	dpellamonuten9b@studiopress.com	334	336	2534997
337	Vitz	549	doldred9c@furl.net	335	337	2535997
338	Myworks	559	noshiel9d@businessweek.com	336	338	2536997
339	Feedbug	569	rhaythorne9e@nymag.com	337	339	2537997
340	Edgepulse	579	ehollebon9f@google.cn	338	340	2538997
341	Ntags	589	dbaldetti9g@aol.com	339	341	2539997
342	Twimm	599	cschwanden9h@reverbnation.com	340	342	2540997
343	Realmix	609	rdunbabin9i@bing.com	341	343	2541997
344	Quinu	619	lbalshaw9j@fc2.com	342	344	2542997
345	Realmix	629	pstiell9k@tripadvisor.com	343	345	2543997
346	Dynazzy	639	emacoun9l@state.tx.us	344	346	2544997
347	Skilith	649	jseebert9m@redcross.org	345	347	2545997
348	Feedbug	659	lwalsh9n@cocolog-nifty.com	346	348	2546997
349	Layo	669	doaks9o@etsy.com	347	349	2547997
350	Gigazoom	679	wolivello9p@newyorker.com	348	350	2548997
351	Demivee	689	toldknowe9q@nih.gov	349	351	2549997
352	BlogXS	699	kdobney9r@goo.ne.jp	350	352	2550997
353	Bubblebox	709	iglenister9s@cam.ac.uk	351	353	2551997
354	Livepath	719	kdignon9t@goodreads.com	352	354	2552997
355	Jaxbean	729	emcgilroy9u@miibeian.gov.cn	353	355	2553997
356	Roodel	739	gclail9v@tinypic.com	354	356	2554997
357	Realfire	749	pquare9w@constantcontact.com	355	357	2555997
358	Meemm	759	laylwin9x@paginegialle.it	356	358	2556997
359	Zoombox	769	lhannen9y@youtu.be	357	359	2557997
360	Blogtag	779	fbeatson9z@google.cn	358	360	2558997
361	Twinte	789	sboldisona0@homestead.com	359	361	2559997
362	Dazzlesphere	799	mmacphadena1@buzzfeed.com	360	362	2560997
363	Quaxo	508	mmorlinga2@cbsnews.com	361	363	2561997
364	Gevee	518	bdestoopa3@ycombinator.com	362	364	2562997
365	Eidel	528	khousemana4@europa.eu	363	365	2563997
366	Zoomzone	538	aduggona5@unesco.org	364	366	2564997
367	Photobug	548	gtilzeya6@indiatimes.com	365	367	2565997
368	Leexo	558	folliera7@google.com.hk	366	368	2566997
369	Jazzy	568	fgozarda8@people.com.cn	367	369	2567997
370	Eamia	578	cmaccaughana9@bizjournals.com	368	370	2568997
371	Jaxworks	588	dmaturaaa@deliciousdays.com	369	371	2569997
372	Tazz	598	bgoriniab@dagondesign.com	370	372	2570997
373	Meevee	608	cbodillac@1und1.de	371	373	2571997
374	Demizz	618	asindellad@twitter.com	372	374	2572997
375	Youbridge	628	tlejeanae@feedburner.com	373	375	2573997
376	Vinte	638	mjeannequinaf@barnesandnoble.com	374	376	2574997
377	Zoombox	648	eeganag@go.com	375	377	2575997
378	Wikivu	658	parensonah@t-online.de	376	378	2576997
379	Mydeo	668	kapfelmannai@paginegialle.it	377	379	2577997
380	Wordware	678	erizziaj@tinypic.com	378	380	2578997
381	Youtags	688	ldullinghamak@blogtalkradio.com	379	381	2579997
382	Shufflester	698	mcroutearal@skyrock.com	380	382	2580997
383	Topiczoom	708	ctremblotam@slate.com	381	383	2581997
384	Aimbo	718	dspykingsan@i2i.jp	382	384	2582997
385	Oyondu	728	skoenraadao@paginegialle.it	383	385	2583997
386	Mita	738	sdooreyap@tumblr.com	384	386	2584997
387	Skinder	748	fdamperaq@amazonaws.com	385	387	2585997
388	Twitterbeat	758	fvanear@abc.net.au	386	388	2586997
389	Skinder	768	csaffeas@unicef.org	387	389	2587997
390	Rhycero	778	amourantat@wisc.edu	388	390	2588997
391	Ntags	788	rclinganau@hugedomains.com	389	391	2589997
392	Centidel	798	adockrillav@miibeian.gov.cn	390	392	2590997
393	Skyndu	507	lbalharryaw@census.gov	391	393	2591997
394	Voomm	517	ncoullingax@networksolutions.com	392	394	2592997
395	Meevee	527	sendleay@drupal.org	393	395	2593997
396	Quatz	537	jtippellaz@adobe.com	394	396	2594997
397	Vinder	547	clowersonb0@weebly.com	395	397	2595997
398	Flashspan	557	mfosterb1@soundcloud.com	396	398	2596997
399	Vipe	567	gablesonb2@squidoo.com	397	399	2597997
400	Talane	577	dcumberledgeb3@craigslist.org	398	400	2598997
401	Latz	587	dsinclairb4@reference.com	399	401	2599997
402	Yacero	597	bhandslipb5@webs.com	400	402	2500996
403	Jabberstorm	607	bwhewayb6@ihg.com	200	403	2501996
404	Eabox	617	zcaulfieldb7@amazonaws.com	201	404	2502996
405	Jabberstorm	627	cmoanb8@com.com	202	405	2503996
406	Twitterbridge	637	eotridgeb9@multiply.com	203	406	2504996
407	Vinder	647	cbartaba@pinterest.com	204	407	2505996
408	Devpulse	657	abentzbb@wired.com	205	408	2506996
409	Roomm	667	cflickerbc@bizjournals.com	206	409	2507996
410	Demivee	677	mhensmansbd@state.gov	207	410	2508996
411	Skinix	687	mcopelandbe@bloglines.com	208	411	2509996
412	Youfeed	697	mstuddebf@goo.ne.jp	209	412	2510996
413	Tazzy	707	kpavelinbg@nsw.gov.au	210	413	2511996
414	Kayveo	717	aklimesbh@ebay.co.uk	211	414	2512996
415	Kazu	727	hprewettbi@over-blog.com	212	415	2513996
416	Kwinu	737	jsymondsbj@nytimes.com	213	416	2514996
417	Dabfeed	747	rnuccitellibk@devhub.com	214	417	2515996
418	Ailane	757	cgeraldobl@rediff.com	215	418	2516996
419	Jatri	767	mravenscraftbm@360.cn	216	419	2517996
420	Latz	777	rramagebn@bandcamp.com	217	420	2518996
421	Trupe	787	lcaslakebo@sbwire.com	218	421	2519996
422	Jamia	797	kbolstridgebp@answers.com	219	422	2520996
423	Youfeed	506	rbitchenobq@ucoz.ru	220	423	2521996
424	Skyvu	516	ddiggonsbr@yahoo.com	221	424	2522996
425	Meetz	526	cstonerbs@archive.org	222	425	2523996
426	Cogibox	536	mwaplebt@facebook.com	223	426	2524996
427	Twinte	546	smcdougallbu@mapquest.com	224	427	2525996
428	Skibox	556	kdunsbv@indiegogo.com	225	428	2526996
429	Skilith	566	jtoraldbw@yellowpages.com	226	429	2527996
430	Avavee	576	ecollardbx@rambler.ru	227	430	2528996
431	Aibox	586	mjewsonby@mail.ru	228	431	2529996
432	Brainbox	596	bchandersbz@wikia.com	229	432	2530996
433	Brainlounge	606	jclowserc0@oakley.com	230	433	2531996
434	Lazz	616	kcappineerc1@prnewswire.com	231	434	2532996
435	Rhynyx	626	jchardc2@youku.com	232	435	2533996
436	Divavu	636	bnewsteadc3@google.es	233	436	2534996
437	Ailane	646	kivanuschkac4@opensource.org	234	437	2535996
438	Skinder	656	fbosomworthc5@cornell.edu	235	438	2536996
439	Yodo	666	icaretc6@facebook.com	236	439	2537996
440	Rooxo	676	eorderc7@hugedomains.com	237	440	2538996
441	Topicblab	686	cpezeyc8@comsenz.com	238	441	2539996
442	Dynabox	696	kmoxsonc9@yale.edu	239	442	2540996
443	Rhynoodle	706	kmeatcherca@hibu.com	240	443	2541996
444	Youtags	716	cattrilcb@facebook.com	241	444	2542996
445	Thoughtstorm	726	ckaufmancc@techcrunch.com	242	445	2543996
446	Thoughtstorm	736	lrotherhamcd@instagram.com	243	446	2544996
447	Twitternation	746	lreachce@nps.gov	244	447	2545996
448	Skyndu	756	cgehrtscf@independent.co.uk	245	448	2546996
449	Voolia	766	wshouldercg@hubpages.com	246	449	2547996
450	Vinte	776	omcgeacheych@youtu.be	247	450	2548996
451	Jabbersphere	786	jlabbci@jimdo.com	248	451	2549996
452	Gabspot	796	cmoncrieffecj@goo.ne.jp	249	452	2550996
453	Divavu	505	rlodevickck@mashable.com	250	453	2551996
454	Dabtype	515	bfollowscl@canalblog.com	251	454	2552996
455	Quaxo	525	hpettefordcm@engadget.com	252	455	2553996
456	Oyoyo	535	hmassycn@baidu.com	253	456	2554996
457	Flashset	545	amustchinco@ask.com	254	457	2555996
458	Skyba	555	sthirstcp@linkedin.com	255	458	2556996
459	Youbridge	565	pjearumcq@wp.com	256	459	2557996
460	Tambee	575	mdeambrosiscr@devhub.com	257	460	2558996
461	Meevee	585	rbenieshcs@a8.net	258	461	2559996
462	Edgeify	595	afilipowiczct@topsy.com	259	462	2560996
1	Izion	505	haleksich0@smh.com.au	202	1	2500000
\.


--
-- TOC entry 3206 (class 0 OID 21095)
-- Dependencies: 223
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Taller" ("COD", "Nombre", "PaginaWeb", "Contacto", "Correo", "FK-LugarT", "FK-TelefonoT") FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 21101)
-- Dependencies: 224
-- Data for Name: Tarjeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tarjeta" ("COD", "Descripcion", "Tipo", "FechaVen", "Marca", "NroCuenta", "Banco", "FK-ClienteT") FROM stdin;
\.


--
-- TOC entry 3208 (class 0 OID 21107)
-- Dependencies: 225
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Telefono" ("COD", "Numero", "FK-SucursalT", "FK-Empleado", "FK-Cliente") FROM stdin;
\.


--
-- TOC entry 3209 (class 0 OID 21110)
-- Dependencies: 226
-- Data for Name: Terrestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Terrestre" ("Placa", "SerialMotor", "Capacidad", "Peso", "Descripcion", "SerialCarroceria", "FechaCreacion", "Tipo", "FK-SucursalT", "FK-ModeloT") FROM stdin;
N7W289L	345	900	100		98765	1999-12-11	Carro	\N	\N
L34P8R7	345	900	100		98765	1999-12-11	Carro	\N	\N
12AB234	345	900	100		98765	1999-12-11	Carro	\N	\N
\.


--
-- TOC entry 3210 (class 0 OID 21116)
-- Dependencies: 227
-- Data for Name: TipoPaquete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoPaquete" ("COD", "Clasificacion") FROM stdin;
1	Vidrieria
2	Metales
3	Alimento
4	Material de oficina
5	Electrodomesticos
6	Articulos de limpieza
7	Ropa
8	Video Juegos
9	Libros
10	Peliculas
11	Juguetes
12	Medicinas
13	Articulos de cocina
14	Muebles
15	Herramientas
16	Adornos
17	Software
18	Computadoras
19	Industrial y Cientifico
20	Suplementos para mascotas
\.


--
-- TOC entry 3211 (class 0 OID 21122)
-- Dependencies: 228
-- Data for Name: Transferencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transferencia" ("COD", "Descripcion", "NroCuenta", "Banco", "Correo", "FK-ClienteTrans") FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 21128)
-- Dependencies: 229
-- Data for Name: Traslado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Traslado" ("COD", "CODVeh-Rut", "CODEnvio", "PrecioVeh", "PrecioRuta") FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 21131)
-- Dependencies: 230
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("Nombre", "Contrasena", "FK-RolU", "FK-ClienteU", "FK-EmpleadoU", "COD") FROM stdin;
Rita.ucab	123	1	\N	6316457	3
Rouser4345	123	1	25213842	\N	5
Gladys.inlectra	456	1	\N	4823744	8
\.


--
-- TOC entry 3214 (class 0 OID 21137)
-- Dependencies: 231
-- Data for Name: Veh-Rut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Veh-Rut" ("COD", "PlacaA", "PlacaB", "PlacaT", "CODRuta", "Duracion") FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 21143)
-- Dependencies: 232
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Zona" ("COD", "Nombre", "TamanoDep", "Descripcion", "Dimension", "CapacidadEmp", "FK-SucursalZ") FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 0)
-- Dependencies: 233
-- Name: seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq', 11, true);


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


-- Completed on 2018-12-13 16:15:09

--
-- PostgreSQL database dump complete
--

