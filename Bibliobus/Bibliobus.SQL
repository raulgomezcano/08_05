--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 16:53:44

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
-- TOC entry 215 (class 1259 OID 16448)
-- Name: Libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Libro" (
    "ISBN" integer NOT NULL,
    autor character varying NOT NULL,
    titulo character varying NOT NULL,
    id_tema integer
);


ALTER TABLE public."Libro" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16447)
-- Name: Libro_ISBN_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Libro_ISBN_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Libro_ISBN_seq" OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 214
-- Name: Libro_ISBN_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Libro_ISBN_seq" OWNED BY public."Libro"."ISBN";


--
-- TOC entry 221 (class 1259 OID 16475)
-- Name: Prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Prestamo" (
    id_prestamo integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date NOT NULL,
    "ISBN" integer NOT NULL,
    id_socio integer NOT NULL
);


ALTER TABLE public."Prestamo" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16474)
-- Name: Prestamo_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Prestamo_id_prestamo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Prestamo_id_prestamo_seq" OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 220
-- Name: Prestamo_id_prestamo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Prestamo_id_prestamo_seq" OWNED BY public."Prestamo".id_prestamo;


--
-- TOC entry 219 (class 1259 OID 16466)
-- Name: Socio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Socio" (
    id_socio integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public."Socio" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16465)
-- Name: Socio_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Socio_id_socio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Socio_id_socio_seq" OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 218
-- Name: Socio_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Socio_id_socio_seq" OWNED BY public."Socio".id_socio;


--
-- TOC entry 217 (class 1259 OID 16457)
-- Name: Tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tema" (
    id_tema integer NOT NULL,
    tema character varying NOT NULL
);


ALTER TABLE public."Tema" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16456)
-- Name: Tema_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tema_id_tema_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Tema_id_tema_seq" OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 216
-- Name: Tema_id_tema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tema_id_tema_seq" OWNED BY public."Tema".id_tema;


--
-- TOC entry 3188 (class 2604 OID 16451)
-- Name: Libro ISBN; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Libro" ALTER COLUMN "ISBN" SET DEFAULT nextval('public."Libro_ISBN_seq"'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16478)
-- Name: Prestamo id_prestamo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamo" ALTER COLUMN id_prestamo SET DEFAULT nextval('public."Prestamo_id_prestamo_seq"'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16469)
-- Name: Socio id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Socio" ALTER COLUMN id_socio SET DEFAULT nextval('public."Socio_id_socio_seq"'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16460)
-- Name: Tema id_tema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema" ALTER COLUMN id_tema SET DEFAULT nextval('public."Tema_id_tema_seq"'::regclass);


--
-- TOC entry 3346 (class 0 OID 16448)
-- Dependencies: 215
-- Data for Name: Libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Libro" ("ISBN", autor, titulo, id_tema) VALUES (1234, 'Carlos Ruiz Zafon', 'El principe de la niebla', 1);
INSERT INTO public."Libro" ("ISBN", autor, titulo, id_tema) VALUES (5678, 'Laura Gallego', 'Donde los arboles cantan', 2);


--
-- TOC entry 3352 (class 0 OID 16475)
-- Dependencies: 221
-- Data for Name: Prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Prestamo" (id_prestamo, fecha_prestamo, fecha_devolucion, "ISBN", id_socio) VALUES (1, '2023-05-03', '2023-06-03', 1234, 2);
INSERT INTO public."Prestamo" (id_prestamo, fecha_prestamo, fecha_devolucion, "ISBN", id_socio) VALUES (2, '2023-05-04', '2023-06-04', 5678, 1);


--
-- TOC entry 3350 (class 0 OID 16466)
-- Dependencies: 219
-- Data for Name: Socio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Socio" (id_socio, nombre) VALUES (1, 'Raul');
INSERT INTO public."Socio" (id_socio, nombre) VALUES (2, 'Juli');


--
-- TOC entry 3348 (class 0 OID 16457)
-- Dependencies: 217
-- Data for Name: Tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Tema" (id_tema, tema) VALUES (1, 'Aventura');
INSERT INTO public."Tema" (id_tema, tema) VALUES (2, 'Misterio');


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 214
-- Name: Libro_ISBN_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Libro_ISBN_seq"', 1, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 220
-- Name: Prestamo_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Prestamo_id_prestamo_seq"', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 218
-- Name: Socio_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Socio_id_socio_seq"', 2, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 216
-- Name: Tema_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tema_id_tema_seq"', 1, false);


--
-- TOC entry 3193 (class 2606 OID 16455)
-- Name: Libro Libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Libro"
    ADD CONSTRAINT "Libro_pkey" PRIMARY KEY ("ISBN");


--
-- TOC entry 3199 (class 2606 OID 16480)
-- Name: Prestamo Prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamo"
    ADD CONSTRAINT "Prestamo_pkey" PRIMARY KEY (id_prestamo);


--
-- TOC entry 3197 (class 2606 OID 16473)
-- Name: Socio Socio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Socio"
    ADD CONSTRAINT "Socio_pkey" PRIMARY KEY (id_socio);


--
-- TOC entry 3195 (class 2606 OID 16464)
-- Name: Tema Tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tema"
    ADD CONSTRAINT "Tema_pkey" PRIMARY KEY (id_tema);


--
-- TOC entry 3201 (class 2606 OID 16486)
-- Name: Prestamo ISBN; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamo"
    ADD CONSTRAINT "ISBN" FOREIGN KEY ("ISBN") REFERENCES public."Libro"("ISBN") NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16491)
-- Name: Prestamo id_socio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Prestamo"
    ADD CONSTRAINT id_socio FOREIGN KEY (id_socio) REFERENCES public."Socio"(id_socio) NOT VALID;


--
-- TOC entry 3200 (class 2606 OID 16481)
-- Name: Libro id_tema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Libro"
    ADD CONSTRAINT id_tema FOREIGN KEY (id_tema) REFERENCES public."Tema"(id_tema) NOT VALID;


-- Completed on 2023-05-03 16:53:44

--
-- PostgreSQL database dump complete
--

