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
    "SalarioAsig" integer NOT NULL,
    "FechaContratado" date,
    "FechaFinal" date,
    "FK-GastosE" integer NOT NULL,
    "FK-SucursalEmp" integer NOT NULL,
    "FK-HorarioEmp" integer NOT NULL
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
-- TOC entry 232 (class 1259 OID 17780)
-- Name: Horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Horario" (
    "COD" integer NOT NULL,
    "HorarioInicio" time without time zone NOT NULL,
    "HorarioFinal" time without time zone NOT NULL
);


ALTER TABLE public."Horario" OWNER TO postgres;

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
-- TOC entry 2839 (class 2606 OID 17118)
-- Name: Accion Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Accion"
    ADD CONSTRAINT "Accion_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2841 (class 2606 OID 17123)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2845 (class 2606 OID 17128)
-- Name: Asistencia Asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("COD", "CIEmpleado", "CODZona");


--
-- TOC entry 2853 (class 2606 OID 17147)
-- Name: Barco Barco_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "Barco_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2857 (class 2606 OID 17155)
-- Name: Cheque Cheque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "Cheque_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2860 (class 2606 OID 17163)
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2973 (class 2606 OID 17376)
-- Name: Efectivo Efectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "Efectivo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2863 (class 2606 OID 17171)
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2868 (class 2606 OID 17179)
-- Name: Envio Envio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Envio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2872 (class 2606 OID 17187)
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2874 (class 2606 OID 17195)
-- Name: Gastos Gastos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gastos"
    ADD CONSTRAINT "Gastos_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2976 (class 2606 OID 17784)
-- Name: Horario Horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Horario"
    ADD CONSTRAINT "Horario_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2877 (class 2606 OID 17201)
-- Name: L-VIP L-VIP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "L-VIP_pkey" PRIMARY KEY ("NroCarnet");


--
-- TOC entry 2880 (class 2606 OID 17209)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2889 (class 2606 OID 17225)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2891 (class 2606 OID 17233)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2849 (class 2606 OID 17139)
-- Name: Avion PK-Avion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "PK-Avion" PRIMARY KEY ("Placa");


--
-- TOC entry 2883 (class 2606 OID 17378)
-- Name: Mantenimiento PK-Mantenimiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PK-Mantenimiento" PRIMARY KEY ("COD");


--
-- TOC entry 2894 (class 2606 OID 17240)
-- Name: Pago-Metodo Pago-Metodo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "Pago-Metodo_pkey" PRIMARY KEY ("COD", "CODPago");


--
-- TOC entry 2901 (class 2606 OID 17245)
-- Name: Pago Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2905 (class 2606 OID 17250)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2912 (class 2606 OID 17259)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2918 (class 2606 OID 17272)
-- Name: Rol-Accion Rol-Accion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "Rol-Accion_pkey" PRIMARY KEY ("COD", "CODRol", "CODAccion");


--
-- TOC entry 2916 (class 2606 OID 17267)
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2922 (class 2606 OID 17277)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2927 (class 2606 OID 17285)
-- Name: Servicio Servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "Servicio_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2930 (class 2606 OID 17293)
-- Name: Sucursal Sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2934 (class 2606 OID 17301)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2938 (class 2606 OID 17309)
-- Name: Tarjeta Tarjeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "Tarjeta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2941 (class 2606 OID 17314)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2946 (class 2606 OID 17323)
-- Name: Terrestre Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2950 (class 2606 OID 17331)
-- Name: TipoPaquete TipoPaquete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoPaquete"
    ADD CONSTRAINT "TipoPaquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2952 (class 2606 OID 17339)
-- Name: Transferencia Transferencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "Transferencia_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2955 (class 2606 OID 17344)
-- Name: Traslado Traslado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "Traslado_pkey" PRIMARY KEY ("COD", "CODVeh-Rut", "CODEnvio");


--
-- TOC entry 2959 (class 2606 OID 17352)
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("Nombre");


--
-- TOC entry 2964 (class 2606 OID 17360)
-- Name: Veh-Rut Veh-Rut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "Veh-Rut_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2970 (class 2606 OID 17368)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2846 (class 1259 OID 17396)
-- Name: fki_CIEmpleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CIEmpleado" ON public."Asistencia" USING btree ("CIEmpleado");


--
-- TOC entry 2919 (class 1259 OID 17616)
-- Name: fki_CODAccion; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODAccion" ON public."Rol-Accion" USING btree ("CODAccion");


--
-- TOC entry 2895 (class 1259 OID 17540)
-- Name: fki_CODCheque; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODCheque" ON public."Pago-Metodo" USING btree ("CODCheque");


--
-- TOC entry 2896 (class 1259 OID 17552)
-- Name: fki_CODEfect; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEfect" ON public."Pago-Metodo" USING btree ("CODEfect");


--
-- TOC entry 2956 (class 1259 OID 17724)
-- Name: fki_CODEnvio; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODEnvio" ON public."Traslado" USING btree ("CODEnvio");


--
-- TOC entry 2897 (class 1259 OID 17528)
-- Name: fki_CODPago; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODPago" ON public."Pago-Metodo" USING btree ("CODPago");


--
-- TOC entry 2920 (class 1259 OID 17610)
-- Name: fki_CODRol; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRol" ON public."Rol-Accion" USING btree ("CODRol");


--
-- TOC entry 2965 (class 1259 OID 17748)
-- Name: fki_CODRuta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODRuta" ON public."Veh-Rut" USING btree ("CODRuta");


--
-- TOC entry 2884 (class 1259 OID 17486)
-- Name: fki_CODTaller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTaller" ON public."Mantenimiento" USING btree ("CODTaller");


--
-- TOC entry 2898 (class 1259 OID 17534)
-- Name: fki_CODTarjeta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTarjeta" ON public."Pago-Metodo" USING btree ("CODTarjeta");


--
-- TOC entry 2899 (class 1259 OID 17546)
-- Name: fki_CODTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTrans" ON public."Pago-Metodo" USING btree ("CODTrans");


--
-- TOC entry 2957 (class 1259 OID 17718)
-- Name: fki_CODVeh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODVeh-Rut" ON public."Traslado" USING btree ("CODVeh-Rut");


--
-- TOC entry 2847 (class 1259 OID 17402)
-- Name: fki_CODZona; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODZona" ON public."Asistencia" USING btree ("CODZona");


--
-- TOC entry 2850 (class 1259 OID 17414)
-- Name: fki_FK-Aeropuerto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Aeropuerto" ON public."Avion" USING btree ("FK-Aeropuerto");


--
-- TOC entry 2878 (class 1259 OID 17474)
-- Name: fki_FK-CLienteL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-CLienteL" ON public."L-VIP" USING btree ("FK-ClienteL");


--
-- TOC entry 2942 (class 1259 OID 17689)
-- Name: fki_FK-Cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente" ON public."Telefono" USING btree ("FK-Cliente");


--
-- TOC entry 2906 (class 1259 OID 17581)
-- Name: fki_FK-Cliente1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente1" ON public."Paquete" USING btree ("FK-Cliente1");


--
-- TOC entry 2907 (class 1259 OID 17587)
-- Name: fki_FK-Cliente2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Cliente2" ON public."Paquete" USING btree ("FK-Cliente2");


--
-- TOC entry 2974 (class 1259 OID 17444)
-- Name: fki_FK-ClienteE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteE" ON public."Efectivo" USING btree ("FK-ClienteE");


--
-- TOC entry 2858 (class 1259 OID 17432)
-- Name: fki_FK-ClienteM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteM" ON public."Cheque" USING btree ("FK-ClienteM");


--
-- TOC entry 2939 (class 1259 OID 17671)
-- Name: fki_FK-ClienteT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteT" ON public."Tarjeta" USING btree ("FK-ClienteT");


--
-- TOC entry 2953 (class 1259 OID 17712)
-- Name: fki_FK-ClienteTrans; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteTrans" ON public."Transferencia" USING btree ("FK-ClienteTrans");


--
-- TOC entry 2960 (class 1259 OID 17766)
-- Name: fki_FK-ClienteU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ClienteU" ON public."Usuario" USING btree ("FK-ClienteU");


--
-- TOC entry 2943 (class 1259 OID 17683)
-- Name: fki_FK-Empleado; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Empleado" ON public."Telefono" USING btree ("FK-Empleado");


--
-- TOC entry 2869 (class 1259 OID 17456)
-- Name: fki_FK-EmpleadoE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoE" ON public."Envio" USING btree ("FK-EmpleadoE");


--
-- TOC entry 2902 (class 1259 OID 17516)
-- Name: fki_FK-EmpleadoP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoP" ON public."Pago" USING btree ("FK-EmpleadoP");


--
-- TOC entry 2931 (class 1259 OID 17653)
-- Name: fki_FK-EmpleadoS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoS" ON public."Sucursal" USING btree ("FK-EmpleadoS");


--
-- TOC entry 2961 (class 1259 OID 17772)
-- Name: fki_FK-EmpleadoU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EmpleadoU" ON public."Usuario" USING btree ("FK-EmpleadoU");


--
-- TOC entry 2903 (class 1259 OID 17522)
-- Name: fki_FK-EnvioP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioP" ON public."Pago" USING btree ("FK-EnvioP");


--
-- TOC entry 2908 (class 1259 OID 17575)
-- Name: fki_FK-EnvioPa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EnvioPa" ON public."Paquete" USING btree ("FK-EnvioP");


--
-- TOC entry 2870 (class 1259 OID 17462)
-- Name: fki_FK-EstatusE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-EstatusE" ON public."Envio" USING btree ("FK-EstatusE");


--
-- TOC entry 2864 (class 1259 OID 17450)
-- Name: fki_FK-GastosE; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosE" ON public."Empleado" USING btree ("FK-GastosE");


--
-- TOC entry 2928 (class 1259 OID 17641)
-- Name: fki_FK-GastosS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-GastosS" ON public."Servicio" USING btree ("FK-GastosS");


--
-- TOC entry 2865 (class 1259 OID 17790)
-- Name: fki_FK-HorarioEmp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-HorarioEmp" ON public."Empleado" USING btree ("FK-HorarioEmp");


--
-- TOC entry 2842 (class 1259 OID 17390)
-- Name: fki_FK-LugarAe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarAe" ON public."Aeropuerto" USING btree ("FK-LugarAe");


--
-- TOC entry 2861 (class 1259 OID 17438)
-- Name: fki_FK-LugarC; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarC" ON public."Cliente" USING btree ("FK-LugarC");


--
-- TOC entry 2881 (class 1259 OID 17480)
-- Name: fki_FK-LugarL; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarL" ON public."Lugar" USING btree ("Fk-LugarL");


--
-- TOC entry 2913 (class 1259 OID 17593)
-- Name: fki_FK-LugarP; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarP" ON public."Puerto" USING btree ("FK-LugarP");


--
-- TOC entry 2932 (class 1259 OID 17647)
-- Name: fki_FK-LugarS; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarS" ON public."Sucursal" USING btree ("FK-LugarS");


--
-- TOC entry 2935 (class 1259 OID 17659)
-- Name: fki_FK-LugarT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-LugarT" ON public."Taller" USING btree ("FK-LugarT");


--
-- TOC entry 2892 (class 1259 OID 17510)
-- Name: fki_FK-MarcaM; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-MarcaM" ON public."Modelo" USING btree ("FK-MarcaM");


--
-- TOC entry 2851 (class 1259 OID 17408)
-- Name: fki_FK-ModeloA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloA" ON public."Avion" USING btree ("FK-ModeloA");


--
-- TOC entry 2854 (class 1259 OID 17420)
-- Name: fki_FK-ModeloB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloB" ON public."Barco" USING btree ("FK-ModeloB");


--
-- TOC entry 2947 (class 1259 OID 17706)
-- Name: fki_FK-ModeloT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-ModeloT" ON public."Terrestre" USING btree ("FK-ModeloT");


--
-- TOC entry 2855 (class 1259 OID 17426)
-- Name: fki_FK-PuertoB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-PuertoB" ON public."Barco" USING btree ("FK-PuertoB");


--
-- TOC entry 2962 (class 1259 OID 17760)
-- Name: fki_FK-RolU; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-RolU" ON public."Usuario" USING btree ("FK-RolU");


--
-- TOC entry 2923 (class 1259 OID 17635)
-- Name: fki_FK-Ruta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Ruta" ON public."Ruta" USING btree ("FK-Ruta");


--
-- TOC entry 2909 (class 1259 OID 17564)
-- Name: fki_FK-Sucursal; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal" ON public."Paquete" USING btree ("FK-Sucursal");


--
-- TOC entry 2924 (class 1259 OID 17623)
-- Name: fki_FK-Sucursal1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal1" ON public."Ruta" USING btree ("FK-Sucursal1");


--
-- TOC entry 2925 (class 1259 OID 17629)
-- Name: fki_FK-Sucursal2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-Sucursal2" ON public."Ruta" USING btree ("Fk-Sucursal2");


--
-- TOC entry 2843 (class 1259 OID 17384)
-- Name: fki_FK-SucursalA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalA" ON public."Aeropuerto" USING btree ("FK-SucursalA");


--
-- TOC entry 2866 (class 1259 OID 17779)
-- Name: fki_FK-SucursalEmp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalEmp" ON public."Empleado" USING btree ("FK-SucursalEmp");


--
-- TOC entry 2875 (class 1259 OID 17468)
-- Name: fki_FK-SucursalG; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalG" ON public."Gastos" USING btree ("FK-SucursalG");


--
-- TOC entry 2914 (class 1259 OID 17604)
-- Name: fki_FK-SucursalPu; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalPu" ON public."Puerto" USING btree ("FK-Sucursal");


--
-- TOC entry 2944 (class 1259 OID 17677)
-- Name: fki_FK-SucursalT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalT" ON public."Telefono" USING btree ("FK-SucursalT");


--
-- TOC entry 2948 (class 1259 OID 17700)
-- Name: fki_FK-SucursalTe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalTe" ON public."Terrestre" USING btree ("FK-SucursalT");


--
-- TOC entry 2971 (class 1259 OID 17754)
-- Name: fki_FK-SucursalZ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-SucursalZ" ON public."Zona" USING btree ("FK-SucursalZ");


--
-- TOC entry 2936 (class 1259 OID 17665)
-- Name: fki_FK-TelefonoT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TelefonoT" ON public."Taller" USING btree ("FK-TelefonoT");


--
-- TOC entry 2910 (class 1259 OID 17558)
-- Name: fki_FK-TipoPaquete; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK-TipoPaquete" ON public."Paquete" USING btree ("FK-TipoPaquete");


--
-- TOC entry 2885 (class 1259 OID 17492)
-- Name: fki_PlacaA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA" ON public."Mantenimiento" USING btree ("PlacaA");


--
-- TOC entry 2966 (class 1259 OID 17730)
-- Name: fki_PlacaA-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaA");


--
-- TOC entry 2886 (class 1259 OID 17498)
-- Name: fki_PlacaB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB" ON public."Mantenimiento" USING btree ("PlacaB");


--
-- TOC entry 2967 (class 1259 OID 17736)
-- Name: fki_PlacaB-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaB");


--
-- TOC entry 2887 (class 1259 OID 17504)
-- Name: fki_PlacaT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT" ON public."Mantenimiento" USING btree ("PlacaT");


--
-- TOC entry 2968 (class 1259 OID 17742)
-- Name: fki_PlacaT-Veh-Rut; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT-Veh-Rut" ON public."Veh-Rut" USING btree ("PlacaT");


--
-- TOC entry 2979 (class 2606 OID 17391)
-- Name: Asistencia CIEmpleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "CIEmpleado" FOREIGN KEY ("CIEmpleado") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3017 (class 2606 OID 17611)
-- Name: Rol-Accion CODAccion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODAccion" FOREIGN KEY ("CODAccion") REFERENCES public."Accion"("COD");


--
-- TOC entry 3002 (class 2606 OID 17535)
-- Name: Pago-Metodo CODCheque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODCheque" FOREIGN KEY ("CODCheque") REFERENCES public."Cheque"("COD");


--
-- TOC entry 3004 (class 2606 OID 17547)
-- Name: Pago-Metodo CODEfect; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODEfect" FOREIGN KEY ("CODEfect") REFERENCES public."Efectivo"("COD");


--
-- TOC entry 3035 (class 2606 OID 17719)
-- Name: Traslado CODEnvio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODEnvio" FOREIGN KEY ("CODEnvio") REFERENCES public."Envio"("COD");


--
-- TOC entry 3000 (class 2606 OID 17523)
-- Name: Pago-Metodo CODPago; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODPago" FOREIGN KEY ("CODPago") REFERENCES public."Pago"("COD");


--
-- TOC entry 3016 (class 2606 OID 17605)
-- Name: Rol-Accion CODRol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol-Accion"
    ADD CONSTRAINT "CODRol" FOREIGN KEY ("CODRol") REFERENCES public."Rol"("COD");


--
-- TOC entry 3042 (class 2606 OID 17743)
-- Name: Veh-Rut CODRuta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "CODRuta" FOREIGN KEY ("CODRuta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 2995 (class 2606 OID 17481)
-- Name: Mantenimiento CODTaller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "CODTaller" FOREIGN KEY ("CODTaller") REFERENCES public."Taller"("COD");


--
-- TOC entry 3001 (class 2606 OID 17529)
-- Name: Pago-Metodo CODTarjeta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTarjeta" FOREIGN KEY ("CODTarjeta") REFERENCES public."Tarjeta"("COD");


--
-- TOC entry 3003 (class 2606 OID 17541)
-- Name: Pago-Metodo CODTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago-Metodo"
    ADD CONSTRAINT "CODTrans" FOREIGN KEY ("CODTrans") REFERENCES public."Transferencia"("COD");


--
-- TOC entry 3034 (class 2606 OID 17713)
-- Name: Traslado CODVeh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Traslado"
    ADD CONSTRAINT "CODVeh-Rut" FOREIGN KEY ("CODVeh-Rut") REFERENCES public."Veh-Rut"("COD");


--
-- TOC entry 2980 (class 2606 OID 17397)
-- Name: Asistencia CODZona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "CODZona" FOREIGN KEY ("CODZona") REFERENCES public."Zona"("COD");


--
-- TOC entry 2982 (class 2606 OID 17409)
-- Name: Avion FK-Aeropuerto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-Aeropuerto" FOREIGN KEY ("FK-Aeropuerto") REFERENCES public."Aeropuerto"("COD");


--
-- TOC entry 2993 (class 2606 OID 17469)
-- Name: L-VIP FK-CLienteL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."L-VIP"
    ADD CONSTRAINT "FK-CLienteL" FOREIGN KEY ("FK-ClienteL") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3029 (class 2606 OID 17684)
-- Name: Telefono FK-Cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Cliente" FOREIGN KEY ("FK-Cliente") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3008 (class 2606 OID 17576)
-- Name: Paquete FK-Cliente1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente1" FOREIGN KEY ("FK-Cliente1") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3009 (class 2606 OID 17582)
-- Name: Paquete FK-Cliente2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Cliente2" FOREIGN KEY ("FK-Cliente2") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3044 (class 2606 OID 17439)
-- Name: Efectivo FK-ClienteE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Efectivo"
    ADD CONSTRAINT "FK-ClienteE" FOREIGN KEY ("FK-ClienteE") REFERENCES public."Cliente"("CI");


--
-- TOC entry 2985 (class 2606 OID 17427)
-- Name: Cheque FK-ClienteM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cheque"
    ADD CONSTRAINT "FK-ClienteM" FOREIGN KEY ("FK-ClienteM") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3026 (class 2606 OID 17666)
-- Name: Tarjeta FK-ClienteT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tarjeta"
    ADD CONSTRAINT "FK-ClienteT" FOREIGN KEY ("FK-ClienteT") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3033 (class 2606 OID 17707)
-- Name: Transferencia FK-ClienteTrans; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transferencia"
    ADD CONSTRAINT "FK-ClienteTrans" FOREIGN KEY ("FK-ClienteTrans") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3037 (class 2606 OID 17761)
-- Name: Usuario FK-ClienteU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-ClienteU" FOREIGN KEY ("FK-ClienteU") REFERENCES public."Cliente"("CI");


--
-- TOC entry 3028 (class 2606 OID 17678)
-- Name: Telefono FK-Empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-Empleado" FOREIGN KEY ("FK-Empleado") REFERENCES public."Empleado"("CI");


--
-- TOC entry 2990 (class 2606 OID 17451)
-- Name: Envio FK-EmpleadoE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EmpleadoE" FOREIGN KEY ("FK-EmpleadoE") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3005 (class 2606 OID 17511)
-- Name: Pago FK-EmpleadoP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EmpleadoP" FOREIGN KEY ("FK-EmpleadoP") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3023 (class 2606 OID 17648)
-- Name: Sucursal FK-EmpleadoS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "FK-EmpleadoS" FOREIGN KEY ("FK-EmpleadoS") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3038 (class 2606 OID 17767)
-- Name: Usuario FK-EmpleadoU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-EmpleadoU" FOREIGN KEY ("FK-EmpleadoU") REFERENCES public."Empleado"("CI");


--
-- TOC entry 3006 (class 2606 OID 17517)
-- Name: Pago FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3012 (class 2606 OID 17565)
-- Name: Paquete FK-EnvioP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioP" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 3007 (class 2606 OID 17570)
-- Name: Paquete FK-EnvioPa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-EnvioPa" FOREIGN KEY ("FK-EnvioP") REFERENCES public."Envio"("COD");


--
-- TOC entry 2991 (class 2606 OID 17457)
-- Name: Envio FK-EstatusE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "FK-EstatusE" FOREIGN KEY ("FK-EstatusE") REFERENCES public."Estatus"("COD");


--
-- TOC entry 2987 (class 2606 OID 17445)
-- Name: Empleado FK-GastosE; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-GastosE" FOREIGN KEY ("FK-GastosE") REFERENCES public."Gastos"("COD");


--
-- TOC entry 3021 (class 2606 OID 17636)
-- Name: Servicio FK-GastosS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Servicio"
    ADD CONSTRAINT "FK-GastosS" FOREIGN KEY ("FK-GastosS") REFERENCES public."Gastos"("COD");


--
-- TOC entry 2989 (class 2606 OID 17785)
-- Name: Empleado FK-HorarioEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-HorarioEmp" FOREIGN KEY ("FK-HorarioEmp") REFERENCES public."Horario"("COD");


--
-- TOC entry 2978 (class 2606 OID 17385)
-- Name: Aeropuerto FK-LugarAe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-LugarAe" FOREIGN KEY ("FK-LugarAe") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2986 (class 2606 OID 17433)
-- Name: Cliente FK-LugarC; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "FK-LugarC" FOREIGN KEY ("FK-LugarC") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2994 (class 2606 OID 17475)
-- Name: Lugar FK-LugarL; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "FK-LugarL" FOREIGN KEY ("Fk-LugarL") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3013 (class 2606 OID 17588)
-- Name: Puerto FK-LugarP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-LugarP" FOREIGN KEY ("FK-LugarP") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3022 (class 2606 OID 17642)
-- Name: Sucursal FK-LugarS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "FK-LugarS" FOREIGN KEY ("FK-LugarS") REFERENCES public."Lugar"("COD");


--
-- TOC entry 3024 (class 2606 OID 17654)
-- Name: Taller FK-LugarT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-LugarT" FOREIGN KEY ("FK-LugarT") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2999 (class 2606 OID 17505)
-- Name: Modelo FK-MarcaM; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "FK-MarcaM" FOREIGN KEY ("FK-MarcaM") REFERENCES public."Marca"("COD");


--
-- TOC entry 2981 (class 2606 OID 17403)
-- Name: Avion FK-ModeloA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avion"
    ADD CONSTRAINT "FK-ModeloA" FOREIGN KEY ("FK-ModeloA") REFERENCES public."Modelo"("COD");


--
-- TOC entry 2983 (class 2606 OID 17415)
-- Name: Barco FK-ModeloB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-ModeloB" FOREIGN KEY ("FK-ModeloB") REFERENCES public."Modelo"("COD");


--
-- TOC entry 3032 (class 2606 OID 17701)
-- Name: Terrestre FK-ModeloT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-ModeloT" FOREIGN KEY ("FK-ModeloT") REFERENCES public."Modelo"("COD");


--
-- TOC entry 2984 (class 2606 OID 17421)
-- Name: Barco FK-PuertoB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Barco"
    ADD CONSTRAINT "FK-PuertoB" FOREIGN KEY ("FK-PuertoB") REFERENCES public."Puerto"("COD");


--
-- TOC entry 3036 (class 2606 OID 17755)
-- Name: Usuario FK-RolU; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK-RolU" FOREIGN KEY ("FK-RolU") REFERENCES public."Rol"("COD");


--
-- TOC entry 3020 (class 2606 OID 17630)
-- Name: Ruta FK-Ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Ruta" FOREIGN KEY ("FK-Ruta") REFERENCES public."Ruta"("COD");


--
-- TOC entry 3011 (class 2606 OID 17559)
-- Name: Paquete FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3014 (class 2606 OID 17594)
-- Name: Puerto FK-Sucursal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-Sucursal" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3018 (class 2606 OID 17618)
-- Name: Ruta FK-Sucursal1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal1" FOREIGN KEY ("FK-Sucursal1") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3019 (class 2606 OID 17624)
-- Name: Ruta FK-Sucursal2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "FK-Sucursal2" FOREIGN KEY ("Fk-Sucursal2") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2977 (class 2606 OID 17379)
-- Name: Aeropuerto FK-SucursalA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "FK-SucursalA" FOREIGN KEY ("FK-SucursalA") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2988 (class 2606 OID 17774)
-- Name: Empleado FK-SucursalEmp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "FK-SucursalEmp" FOREIGN KEY ("FK-SucursalEmp") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 2992 (class 2606 OID 17463)
-- Name: Gastos FK-SucursalG; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gastos"
    ADD CONSTRAINT "FK-SucursalG" FOREIGN KEY ("FK-SucursalG") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3015 (class 2606 OID 17599)
-- Name: Puerto FK-SucursalPu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "FK-SucursalPu" FOREIGN KEY ("FK-Sucursal") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3027 (class 2606 OID 17672)
-- Name: Telefono FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3030 (class 2606 OID 17690)
-- Name: Terrestre FK-SucursalT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalT" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3031 (class 2606 OID 17695)
-- Name: Terrestre FK-SucursalTe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "FK-SucursalTe" FOREIGN KEY ("FK-SucursalT") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3043 (class 2606 OID 17749)
-- Name: Zona FK-SucursalZ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "FK-SucursalZ" FOREIGN KEY ("FK-SucursalZ") REFERENCES public."Sucursal"("COD");


--
-- TOC entry 3025 (class 2606 OID 17660)
-- Name: Taller FK-TelefonoT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "FK-TelefonoT" FOREIGN KEY ("FK-TelefonoT") REFERENCES public."Telefono"("COD");


--
-- TOC entry 3010 (class 2606 OID 17553)
-- Name: Paquete FK-TipoPaquete; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "FK-TipoPaquete" FOREIGN KEY ("FK-TipoPaquete") REFERENCES public."TipoPaquete"("COD");


--
-- TOC entry 2996 (class 2606 OID 17487)
-- Name: Mantenimiento PlacaA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaA" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 3039 (class 2606 OID 17725)
-- Name: Veh-Rut PlacaA-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaA-Veh-Rut" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 2997 (class 2606 OID 17493)
-- Name: Mantenimiento PlacaB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaB" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 3040 (class 2606 OID 17731)
-- Name: Veh-Rut PlacaB-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaB-Veh-Rut" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 2998 (class 2606 OID 17499)
-- Name: Mantenimiento PlacaT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaT" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


--
-- TOC entry 3041 (class 2606 OID 17737)
-- Name: Veh-Rut PlacaT-Veh-Rut; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Veh-Rut"
    ADD CONSTRAINT "PlacaT-Veh-Rut" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


-- Completed on 2018-12-12 14:26:27

--
-- PostgreSQL database dump complete
--

