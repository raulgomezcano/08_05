--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 16:52:50

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: Autobús; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Autobús" (
    id_autobus integer NOT NULL,
    a_fabricacion integer NOT NULL,
    precio numeric(10,4)
);


ALTER TABLE public."Autobús" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: Autobús_id_autobus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Autobús_id_autobus_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Autobús_id_autobus_seq" OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 216
-- Name: Autobús_id_autobus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Autobús_id_autobus_seq" OWNED BY public."Autobús".id_autobus;


--
-- TOC entry 219 (class 1259 OID 16416)
-- Name: Conductor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Conductor" (
    id_conductor integer NOT NULL,
    nombre character varying(60) NOT NULL,
    dni "char"[]
);


ALTER TABLE public."Conductor" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16415)
-- Name: Conductor_id_conductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Conductor_id_conductor_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Conductor_id_conductor_seq" OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 218
-- Name: Conductor_id_conductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Conductor_id_conductor_seq" OWNED BY public."Conductor".id_conductor;


--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: Lugar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Lugar" (
    id_lugar integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public."Lugar" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: Lugar_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Lugar_id_lugar_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Lugar_id_lugar_seq" OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 214
-- Name: Lugar_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Lugar_id_lugar_seq" OWNED BY public."Lugar".id_lugar;


--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: Ruta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ruta" (
    fecha date NOT NULL,
    id_conductor integer NOT NULL,
    id_autobus integer NOT NULL,
    id_lugar integer NOT NULL,
    id_ruta integer NOT NULL
);


ALTER TABLE public."Ruta" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16424)
-- Name: Ruta_id_ruta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ruta_id_ruta_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ruta_id_ruta_seq" OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 220
-- Name: Ruta_id_ruta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ruta_id_ruta_seq" OWNED BY public."Ruta".id_ruta;


--
-- TOC entry 3189 (class 2604 OID 16412)
-- Name: Autobús id_autobus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Autobús" ALTER COLUMN id_autobus SET DEFAULT nextval('public."Autobús_id_autobus_seq"'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16419)
-- Name: Conductor id_conductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conductor" ALTER COLUMN id_conductor SET DEFAULT nextval('public."Conductor_id_conductor_seq"'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16403)
-- Name: Lugar id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar" ALTER COLUMN id_lugar SET DEFAULT nextval('public."Lugar_id_lugar_seq"'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16428)
-- Name: Ruta id_ruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta" ALTER COLUMN id_ruta SET DEFAULT nextval('public."Ruta_id_ruta_seq"'::regclass);


--
-- TOC entry 3348 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: Autobús; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Autobús" (id_autobus, a_fabricacion, precio) VALUES (1, 1990, 1.3000);
INSERT INTO public."Autobús" (id_autobus, a_fabricacion, precio) VALUES (3, 2016, 2.2000);


--
-- TOC entry 3350 (class 0 OID 16416)
-- Dependencies: 219
-- Data for Name: Conductor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Conductor" (id_conductor, nombre, dni) VALUES (1034, 'Raul', '{4}');
INSERT INTO public."Conductor" (id_conductor, nombre, dni) VALUES (1055, 'Juli', '{2}');


--
-- TOC entry 3346 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: Lugar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Lugar" (id_lugar, nombre) VALUES (2022, 'Las Rozas');
INSERT INTO public."Lugar" (id_lugar, nombre) VALUES (4044, 'Las Tablas');


--
-- TOC entry 3352 (class 0 OID 16425)
-- Dependencies: 221
-- Data for Name: Ruta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ruta" (fecha, id_conductor, id_autobus, id_lugar, id_ruta) VALUES ('2023-05-20', 1034, 1, 2022, 1);
INSERT INTO public."Ruta" (fecha, id_conductor, id_autobus, id_lugar, id_ruta) VALUES ('2023-10-06', 1055, 3, 4044, 2);


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 216
-- Name: Autobús_id_autobus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Autobús_id_autobus_seq"', 1, false);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 218
-- Name: Conductor_id_conductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Conductor_id_conductor_seq"', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 214
-- Name: Lugar_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Lugar_id_lugar_seq"', 1, false);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 220
-- Name: Ruta_id_ruta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ruta_id_ruta_seq"', 1, false);


--
-- TOC entry 3195 (class 2606 OID 16414)
-- Name: Autobús Autobús_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Autobús"
    ADD CONSTRAINT "Autobús_pkey" PRIMARY KEY (id_autobus);


--
-- TOC entry 3197 (class 2606 OID 16423)
-- Name: Conductor Conductor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Conductor"
    ADD CONSTRAINT "Conductor_pkey" PRIMARY KEY (id_conductor);


--
-- TOC entry 3193 (class 2606 OID 16407)
-- Name: Lugar Lugar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Lugar"
    ADD CONSTRAINT "Lugar_pkey" PRIMARY KEY (id_lugar);


--
-- TOC entry 3199 (class 2606 OID 16430)
-- Name: Ruta Ruta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT "Ruta_pkey" PRIMARY KEY (id_ruta);


--
-- TOC entry 3200 (class 2606 OID 16431)
-- Name: Ruta fk_ruta_autobus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT fk_ruta_autobus FOREIGN KEY (id_autobus) REFERENCES public."Autobús"(id_autobus) NOT VALID;


--
-- TOC entry 3201 (class 2606 OID 16436)
-- Name: Ruta fk_ruta_conductor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT fk_ruta_conductor FOREIGN KEY (id_conductor) REFERENCES public."Conductor"(id_conductor) NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16441)
-- Name: Ruta fk_ruta_lugar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ruta"
    ADD CONSTRAINT fk_ruta_lugar FOREIGN KEY (id_lugar) REFERENCES public."Lugar"(id_lugar) NOT VALID;


-- Completed on 2023-05-03 16:52:50

--
-- PostgreSQL database dump complete
--

