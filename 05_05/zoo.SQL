--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-05 13:35:46

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

--
-- TOC entry 3344 (class 1262 OID 16500)
-- Name: zoo; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE zoo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE zoo OWNER TO postgres;

\connect zoo

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

--
-- TOC entry 214 (class 1259 OID 16507)
-- Name: contador; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contador OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16654)
-- Name: animal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animal (
    id_animal integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_especie integer NOT NULL,
    a_nacimiento integer NOT NULL,
    sexo character(1) NOT NULL,
    pais character varying(50) NOT NULL,
    continente character varying(50) NOT NULL,
    CONSTRAINT animal_sexo_check CHECK ((sexo = ANY (ARRAY['H'::bpchar, 'M'::bpchar])))
);


ALTER TABLE public.animal OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16661)
-- Name: especie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especie (
    id_especie integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    nom_cientifico character varying(50) NOT NULL,
    nom_vulgar character varying(50) NOT NULL
);


ALTER TABLE public.especie OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16648)
-- Name: zoo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zoo (
    id_zoo integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_animal integer NOT NULL,
    nombre character varying(50) NOT NULL,
    ciudad character varying(50) NOT NULL,
    pais character varying(50) NOT NULL,
    tamano integer NOT NULL,
    presupuesto integer NOT NULL
);


ALTER TABLE public.zoo OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 16654)
-- Dependencies: 216
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animal (id_animal, id_especie, a_nacimiento, sexo, pais, continente) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 16661)
-- Dependencies: 217
-- Data for Name: especie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especie (id_especie, nom_cientifico, nom_vulgar) FROM stdin;
\.


--
-- TOC entry 3336 (class 0 OID 16648)
-- Dependencies: 215
-- Data for Name: zoo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zoo (id_zoo, id_animal, nombre, ciudad, pais, tamano, presupuesto) FROM stdin;
\.


--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 214
-- Name: contador; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contador', 1, false);


--
-- TOC entry 3188 (class 2606 OID 16660)
-- Name: animal id_animal; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT id_animal PRIMARY KEY (id_animal);


--
-- TOC entry 3190 (class 2606 OID 16666)
-- Name: especie id_especie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especie
    ADD CONSTRAINT id_especie PRIMARY KEY (id_especie);


--
-- TOC entry 3186 (class 2606 OID 16653)
-- Name: zoo id_zoo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zoo
    ADD CONSTRAINT id_zoo PRIMARY KEY (id_zoo);


--
-- TOC entry 3191 (class 2606 OID 16668)
-- Name: zoo id_animal; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zoo
    ADD CONSTRAINT id_animal FOREIGN KEY (id_animal) REFERENCES public.animal(id_animal);


--
-- TOC entry 3192 (class 2606 OID 16673)
-- Name: animal id_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animal
    ADD CONSTRAINT id_especie FOREIGN KEY (id_especie) REFERENCES public.especie(id_especie);


-- Completed on 2023-05-05 13:35:46

--
-- PostgreSQL database dump complete
--

