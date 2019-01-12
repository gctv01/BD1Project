--
-- PostgreSQL database dump
--

-- Dumped from database version 11.0
-- Dumped by pg_dump version 11.0

-- Started on 2019-01-12 17:44:24

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "LogUCAB";
--
-- TOC entry 2955 (class 1262 OID 23048)
-- Name: LogUCAB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "LogUCAB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE "LogUCAB" OWNER TO postgres;

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 211 (class 1259 OID 23127)
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
-- TOC entry 2949 (class 0 OID 23127)
-- Dependencies: 211
-- Data for Name: Mantenimiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") VALUES (1, 14000, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', '2018-01-17', '2020-06-15', 1, 'SAJWJ0EF4E8650965', NULL, NULL, 1);
INSERT INTO public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") VALUES (2, 14001, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', '2018-10-06', '2020-01-20', 2, NULL, 'WUAUUAFG0F7018131', NULL, 2);
INSERT INTO public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") VALUES (3, 14002, 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', '2018-03-05', '2020-12-08', 3, NULL, NULL, 'SCBCP7ZA9AC021557', 3);
INSERT INTO public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") VALUES (4, 14003, 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2018-09-15', '2020-10-31', 4, NULL, NULL, '1C3BCBEB1CN299547', 4);
INSERT INTO public."Mantenimiento" ("COD", "Costo", "Descripcion", "FechaIni", "FechaFinal", "FK-GastosM", "PlacaA", "PlacaB", "PlacaT", "CODTaller") VALUES (5, 14004, 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '2017-12-25', '2020-11-15', 5, NULL, NULL, '19UUA96219A029978', 5);


--
-- TOC entry 2819 (class 2606 OID 23276)
-- Name: Mantenimiento PK-Mantenimiento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PK-Mantenimiento" PRIMARY KEY ("COD");


--
-- TOC entry 2820 (class 1259 OID 23323)
-- Name: fki_CODTaller; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_CODTaller" ON public."Mantenimiento" USING btree ("CODTaller");


--
-- TOC entry 2821 (class 1259 OID 23371)
-- Name: fki_PlacaA; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaA" ON public."Mantenimiento" USING btree ("PlacaA");


--
-- TOC entry 2822 (class 1259 OID 23373)
-- Name: fki_PlacaB; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaB" ON public."Mantenimiento" USING btree ("PlacaB");


--
-- TOC entry 2823 (class 1259 OID 23375)
-- Name: fki_PlacaT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_PlacaT" ON public."Mantenimiento" USING btree ("PlacaT");


--
-- TOC entry 2824 (class 2606 OID 23418)
-- Name: Mantenimiento CODTaller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "CODTaller" FOREIGN KEY ("CODTaller") REFERENCES public."Taller"("COD");


--
-- TOC entry 2825 (class 2606 OID 23678)
-- Name: Mantenimiento PlacaA; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaA" FOREIGN KEY ("PlacaA") REFERENCES public."Avion"("Placa");


--
-- TOC entry 2826 (class 2606 OID 23688)
-- Name: Mantenimiento PlacaB; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaB" FOREIGN KEY ("PlacaB") REFERENCES public."Barco"("Placa");


--
-- TOC entry 2827 (class 2606 OID 23698)
-- Name: Mantenimiento PlacaT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Mantenimiento"
    ADD CONSTRAINT "PlacaT" FOREIGN KEY ("PlacaT") REFERENCES public."Terrestre"("Placa");


-- Completed on 2019-01-12 17:44:25

--
-- PostgreSQL database dump complete
--
