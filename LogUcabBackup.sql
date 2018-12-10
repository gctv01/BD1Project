--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2018-12-10 17:53:07

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
-- TOC entry 2991 (class 1262 OID 18188)
-- Name: LogUCAB; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE "LogUCAB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


\connect "LogUCAB"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 18203)
-- Name: Aeropuerto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Aeropuerto" (
    "COD" integer NOT NULL,
    "Terminales" integer NOT NULL,
    "Pistas" integer NOT NULL,
    "Capacidad" integer NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 18206)
-- Name: Asistencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Asistencia" (
    "COD" integer NOT NULL,
    "Hora-Entrada" integer,
    "Hora-Salida" integer,
    "SalarioxHora" integer NOT NULL,
    "Fecha-Ini" date
);


--
-- TOC entry 199 (class 1259 OID 18209)
-- Name: Barco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Barco" (
    "Placa" "char"[] NOT NULL,
    "Clasificacion" "char"[] NOT NULL,
    "Capacidad-Carga" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Serial-Motor" "char"[] NOT NULL,
    "Serial-Carroceria" "char"[] NOT NULL,
    "Fecha-Creacion" date NOT NULL,
    "Descripcion" text[],
    "Longitud" integer NOT NULL,
    "Peso-Vacio" integer NOT NULL,
    "Envergadura" integer NOT NULL,
    "Peso-Max" integer NOT NULL,
    "Velocidad" integer NOT NULL,
    "Altura" integer NOT NULL,
    "Ancho-Cabina" integer NOT NULL,
    "Capacidad-Combustible" integer NOT NULL,
    "Carrera-Despegue" integer NOT NULL,
    "Diametro-Fuselaje" integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 18215)
-- Name: Cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Cliente" (
    "CI" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Apeliido" "char"[] NOT NULL,
    "Fecha-Nac" date NOT NULL,
    "Edo-Civil" "char"[] NOT NULL,
    "Trabajo" "char"[] NOT NULL,
    "Lvip" boolean NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 18221)
-- Name: Empleado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Empleado" (
    "CI" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Apeliido" "char"[] NOT NULL,
    "Fecha-Nac" date NOT NULL,
    "Nivel-Aca" "char"[] NOT NULL,
    "Profesion" "char"[] NOT NULL,
    "Edo-Civil" "char"[] NOT NULL,
    "Hijos" integer NOT NULL,
    "Correo" "char"[] NOT NULL,
    "Correo-Empresa" "char"[] NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 18227)
-- Name: Envio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Envio" (
    "COD" integer NOT NULL,
    "Fecha-Ini" date NOT NULL,
    "Fecha-Llegada" date NOT NULL,
    "CostoxPeso" integer NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 18189)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Lugar" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Tipo" "char"[] NOT NULL,
    "FK-Lugar" integer NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 18230)
-- Name: Mantenimiento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Mantenimiento" (
    "COD" integer NOT NULL,
    "Costo" integer NOT NULL,
    "Descripcion" "char"[] NOT NULL,
    "Fecha-Ini" date NOT NULL,
    "Fecha-Final" date NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 18236)
-- Name: Marca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Marca" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 18242)
-- Name: Metodo Pago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Metodo Pago" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 18248)
-- Name: Modelo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Modelo" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Descripcion" text[] NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 18254)
-- Name: Pago; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Pago" (
    "COD" integer NOT NULL,
    "Costo-Total" integer NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 18257)
-- Name: Paquete; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Paquete" (
    "NoGuia" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Descripcion" "char"[] NOT NULL,
    "Clasificacion" "char"[] NOT NULL,
    "Alerta" boolean NOT NULL
);


--
-- TOC entry 210 (class 1259 OID 18269)
-- Name: Puerto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Puerto" (
    "COD" integer NOT NULL,
    "Puestos" integer NOT NULL,
    "Total-Muelles" integer NOT NULL,
    "Longitud" integer NOT NULL,
    "Ancho" integer NOT NULL,
    "Calado" integer NOT NULL,
    "Uso" "char"[] NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 18361)
-- Name: Rol; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Rol" (
    "COD" integer NOT NULL,
    "Nombre" character varying NOT NULL,
    "FK-Usuario" integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 18275)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Ruta" (
    "COD" integer NOT NULL,
    "Descripcion" "char"[] NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 18281)
-- Name: Servicios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Servicios" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Estatus" "char"[] NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 18287)
-- Name: Sucursal; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Sucursal" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Capacidad" integer NOT NULL,
    "Correo-Elec" "char"[] NOT NULL,
    "Almacenamiento" integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 18293)
-- Name: Taller; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Taller" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Pagina-Web" "char"[] NOT NULL,
    "Contacto" "char"[] NOT NULL,
    "Correo" "char"[] NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 18299)
-- Name: Telefono; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Telefono" (
    "COD" integer NOT NULL,
    "Numero" integer NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 18302)
-- Name: Terrestre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Terrestre" (
    "Placa" "char"[] NOT NULL,
    "Clasificacion" "char"[] NOT NULL,
    "Capacidad-Carga" integer NOT NULL,
    "Peso" integer NOT NULL,
    "Serial-Motor" "char"[] NOT NULL,
    "Serial-Carroceria" "char"[] NOT NULL,
    "Fecha-Creacion" date NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 18308)
-- Name: Tipo Paquete; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Tipo Paquete" (
    "COD" integer NOT NULL,
    "Descripcion" "char"[] NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 18263)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Usuario" (
    "COD" integer NOT NULL,
    "Username" character varying NOT NULL,
    "Contrasena" character varying NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 18314)
-- Name: Zona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."Zona" (
    "COD" integer NOT NULL,
    "Nombre" "char"[] NOT NULL,
    "Tamano" integer NOT NULL,
    "Descripcion" text[] NOT NULL,
    "Dimension" integer NOT NULL
);


--
-- TOC entry 2963 (class 0 OID 18203)
-- Dependencies: 197
-- Data for Name: Aeropuerto; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2964 (class 0 OID 18206)
-- Dependencies: 198
-- Data for Name: Asistencia; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2965 (class 0 OID 18209)
-- Dependencies: 199
-- Data for Name: Barco; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2966 (class 0 OID 18215)
-- Dependencies: 200
-- Data for Name: Cliente; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2967 (class 0 OID 18221)
-- Dependencies: 201
-- Data for Name: Empleado; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2968 (class 0 OID 18227)
-- Dependencies: 202
-- Data for Name: Envio; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2962 (class 0 OID 18189)
-- Dependencies: 196
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2969 (class 0 OID 18230)
-- Dependencies: 203
-- Data for Name: Mantenimiento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2970 (class 0 OID 18236)
-- Dependencies: 204
-- Data for Name: Marca; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2971 (class 0 OID 18242)
-- Dependencies: 205
-- Data for Name: Metodo Pago; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2972 (class 0 OID 18248)
-- Dependencies: 206
-- Data for Name: Modelo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2973 (class 0 OID 18254)
-- Dependencies: 207
-- Data for Name: Pago; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2974 (class 0 OID 18257)
-- Dependencies: 208
-- Data for Name: Paquete; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2976 (class 0 OID 18269)
-- Dependencies: 210
-- Data for Name: Puerto; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2985 (class 0 OID 18361)
-- Dependencies: 219
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Rol" ("COD", "Nombre", "FK-Usuario") VALUES (1, 'Administrador', 1);
INSERT INTO public."Rol" ("COD", "Nombre", "FK-Usuario") VALUES (2, 'Empleado', 2);
INSERT INTO public."Rol" ("COD", "Nombre", "FK-Usuario") VALUES (3, 'Empleado', 3);
INSERT INTO public."Rol" ("COD", "Nombre", "FK-Usuario") VALUES (4, 'Cliente', 4);
INSERT INTO public."Rol" ("COD", "Nombre", "FK-Usuario") VALUES (5, 'Cliente', 5);


--
-- TOC entry 2977 (class 0 OID 18275)
-- Dependencies: 211
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2978 (class 0 OID 18281)
-- Dependencies: 212
-- Data for Name: Servicios; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2979 (class 0 OID 18287)
-- Dependencies: 213
-- Data for Name: Sucursal; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2980 (class 0 OID 18293)
-- Dependencies: 214
-- Data for Name: Taller; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2981 (class 0 OID 18299)
-- Dependencies: 215
-- Data for Name: Telefono; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2982 (class 0 OID 18302)
-- Dependencies: 216
-- Data for Name: Terrestre; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2983 (class 0 OID 18308)
-- Dependencies: 217
-- Data for Name: Tipo Paquete; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2975 (class 0 OID 18263)
-- Dependencies: 209
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."Usuario" ("COD", "Username", "Contrasena") VALUES (1, 'Rajimenez.16', 'ucab.2018');
INSERT INTO public."Usuario" ("COD", "Username", "Contrasena") VALUES (2, 'Empleado1', '1234');
INSERT INTO public."Usuario" ("COD", "Username", "Contrasena") VALUES (3, 'Empleado2', '2345');
INSERT INTO public."Usuario" ("COD", "Username", "Contrasena") VALUES (4, 'Cliente1', '4567');
INSERT INTO public."Usuario" ("COD", "Username", "Contrasena") VALUES (5, 'Cliente2', '6789');


--
-- TOC entry 2984 (class 0 OID 18314)
-- Dependencies: 218
-- Data for Name: Zona; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2798 (class 2606 OID 18321)
-- Name: Aeropuerto Aeropuerto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Aeropuerto"
    ADD CONSTRAINT "Aeropuerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2800 (class 2606 OID 18323)
-- Name: Asistencia Asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Asistencia"
    ADD CONSTRAINT "Asistencia_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2802 (class 2606 OID 18325)
-- Name: Cliente Cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Cliente"
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2804 (class 2606 OID 18327)
-- Name: Empleado Empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Empleado"
    ADD CONSTRAINT "Empleado_pkey" PRIMARY KEY ("CI");


--
-- TOC entry 2795 (class 2606 OID 18196)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2808 (class 2606 OID 18329)
-- Name: Mantenimiento Mantenimiento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "Mantenimiento_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2810 (class 2606 OID 18331)
-- Name: Marca Marca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Marca"
    ADD CONSTRAINT "Marca_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2812 (class 2606 OID 18333)
-- Name: Metodo Pago Metodo Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Metodo Pago"
    ADD CONSTRAINT "Metodo Pago_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2814 (class 2606 OID 18335)
-- Name: Modelo Modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Modelo"
    ADD CONSTRAINT "Modelo_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2838 (class 2606 OID 18368)
-- Name: Rol PK-Rol; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "PK-Rol" PRIMARY KEY ("COD");


--
-- TOC entry 2806 (class 2606 OID 18337)
-- Name: Envio Pago_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Envio"
    ADD CONSTRAINT "Pago_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2816 (class 2606 OID 18339)
-- Name: Pago Pago_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Pago"
    ADD CONSTRAINT "Pago_pkey1" PRIMARY KEY ("COD");


--
-- TOC entry 2818 (class 2606 OID 18341)
-- Name: Paquete Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Paquete"
    ADD CONSTRAINT "Paquete_pkey" PRIMARY KEY ("NoGuia");


--
-- TOC entry 2820 (class 2606 OID 18343)
-- Name: Usuario Perfil_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Perfil_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2822 (class 2606 OID 18345)
-- Name: Puerto Puerto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Puerto"
    ADD CONSTRAINT "Puerto_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2824 (class 2606 OID 18347)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2826 (class 2606 OID 18349)
-- Name: Sucursal Sucursal_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Sucursal"
    ADD CONSTRAINT "Sucursal_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2828 (class 2606 OID 18351)
-- Name: Taller Taller_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Taller"
    ADD CONSTRAINT "Taller_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2830 (class 2606 OID 18353)
-- Name: Telefono Telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Telefono"
    ADD CONSTRAINT "Telefono_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2832 (class 2606 OID 18355)
-- Name: Terrestre Terrestre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Terrestre"
    ADD CONSTRAINT "Terrestre_pkey" PRIMARY KEY ("Placa");


--
-- TOC entry 2834 (class 2606 OID 18357)
-- Name: Tipo Paquete Tipo Paquete_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Tipo Paquete"
    ADD CONSTRAINT "Tipo Paquete_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2836 (class 2606 OID 18359)
-- Name: Zona Zona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Zona"
    ADD CONSTRAINT "Zona_pkey" PRIMARY KEY ("COD");


--
-- TOC entry 2796 (class 1259 OID 18197)
-- Name: fki_FK-Lugar; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fki_FK-Lugar" ON public."Lugar" USING btree ("FK-Lugar");


--
-- TOC entry 2839 (class 2606 OID 18198)
-- Name: Lugar FK-Lugar; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "FK-Lugar" FOREIGN KEY ("FK-Lugar") REFERENCES public."Lugar"("COD");


--
-- TOC entry 2840 (class 2606 OID 18369)
-- Name: Rol FK-Usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "FK-Usuario" FOREIGN KEY ("FK-Usuario") REFERENCES public."Usuario"("COD");


-- Completed on 2018-12-10 17:53:08

--
-- PostgreSQL database dump complete
--

