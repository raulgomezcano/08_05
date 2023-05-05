--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-05 14:35:48

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
-- TOC entry 3390 (class 1262 OID 16678)
-- Name: socio_pedido; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE socio_pedido WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE socio_pedido OWNER TO postgres;

\connect socio_pedido

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
-- TOC entry 214 (class 1259 OID 16855)
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
-- TOC entry 220 (class 1259 OID 16885)
-- Name: almacenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacenes (
    id_almacen integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_provincia integer NOT NULL,
    direccion character varying(30) NOT NULL,
    fapertura date NOT NULL
);


ALTER TABLE public.almacenes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16902)
-- Name: coleccionees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coleccionees (
    id_coleccion integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    volumen integer NOT NULL
);


ALTER TABLE public.coleccionees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16868)
-- Name: detalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle (
    id_pedido_detalle integer NOT NULL,
    isbn integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.detalle OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16897)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    isbn integer NOT NULL,
    id_coleccion integer NOT NULL,
    titulo character varying(30) NOT NULL,
    autor character varying(30) NOT NULL,
    editorial character varying(30) NOT NULL
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16862)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_socio integer NOT NULL,
    forma_pago character varying(20),
    forma_envio character varying(20)
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16873)
-- Name: poblaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.poblaciones (
    id_poblacion integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_provincia integer NOT NULL,
    nombre character varying(30) NOT NULL,
    habitantes integer NOT NULL
);


ALTER TABLE public.poblaciones OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16879)
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id_provincia integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    id_almacen_provincia integer NOT NULL,
    nombre character varying(30) NOT NULL,
    extension integer NOT NULL
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16856)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id_socio integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    nombre character varying(40) NOT NULL,
    apellidos character varying(50) NOT NULL,
    dni character varying(9) NOT NULL,
    telefono integer NOT NULL,
    id_avalador integer NOT NULL,
    id_poblacion integer NOT NULL
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16891)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    id_almacen_stock integer DEFAULT nextval('public.contador'::regclass) NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 16885)
-- Dependencies: 220
-- Data for Name: almacenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacenes (id_almacen, id_provincia, direccion, fapertura) FROM stdin;
\.


--
-- TOC entry 3384 (class 0 OID 16902)
-- Dependencies: 223
-- Data for Name: coleccionees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coleccionees (id_coleccion, volumen) FROM stdin;
\.


--
-- TOC entry 3378 (class 0 OID 16868)
-- Dependencies: 217
-- Data for Name: detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalle (id_pedido_detalle, isbn, cantidad) FROM stdin;
\.


--
-- TOC entry 3383 (class 0 OID 16897)
-- Dependencies: 222
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (isbn, id_coleccion, titulo, autor, editorial) FROM stdin;
\.


--
-- TOC entry 3377 (class 0 OID 16862)
-- Dependencies: 216
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id_pedido, id_socio, forma_pago, forma_envio) FROM stdin;
\.


--
-- TOC entry 3379 (class 0 OID 16873)
-- Dependencies: 218
-- Data for Name: poblaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.poblaciones (id_poblacion, id_provincia, nombre, habitantes) FROM stdin;
\.


--
-- TOC entry 3380 (class 0 OID 16879)
-- Dependencies: 219
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provincia (id_provincia, id_almacen_provincia, nombre, extension) FROM stdin;
\.


--
-- TOC entry 3376 (class 0 OID 16856)
-- Dependencies: 215
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (id_socio, nombre, apellidos, dni, telefono, id_avalador, id_poblacion) FROM stdin;
\.


--
-- TOC entry 3382 (class 0 OID 16891)
-- Dependencies: 221
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (id_almacen_stock, cantidad) FROM stdin;
\.


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 214
-- Name: contador; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contador', 1, false);


--
-- TOC entry 3223 (class 2606 OID 16890)
-- Name: almacenes id_almacen; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacenes
    ADD CONSTRAINT id_almacen PRIMARY KEY (id_almacen);


--
-- TOC entry 3225 (class 2606 OID 16896)
-- Name: stock id_almacen_stock; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT id_almacen_stock PRIMARY KEY (id_almacen_stock);


--
-- TOC entry 3229 (class 2606 OID 16907)
-- Name: coleccionees id_coleccion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coleccionees
    ADD CONSTRAINT id_coleccion PRIMARY KEY (id_coleccion);


--
-- TOC entry 3215 (class 2606 OID 16867)
-- Name: pedidos id_pedido; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT id_pedido PRIMARY KEY (id_pedido);


--
-- TOC entry 3217 (class 2606 OID 16872)
-- Name: detalle id_pedido_detalle; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle
    ADD CONSTRAINT id_pedido_detalle PRIMARY KEY (id_pedido_detalle);


--
-- TOC entry 3219 (class 2606 OID 16878)
-- Name: poblaciones id_poblacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.poblaciones
    ADD CONSTRAINT id_poblacion PRIMARY KEY (id_poblacion);


--
-- TOC entry 3221 (class 2606 OID 16884)
-- Name: provincia id_provincia; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT id_provincia PRIMARY KEY (id_provincia);


--
-- TOC entry 3213 (class 2606 OID 16861)
-- Name: socios id_socio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT id_socio PRIMARY KEY (id_socio);


--
-- TOC entry 3227 (class 2606 OID 16901)
-- Name: libros isbn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT isbn PRIMARY KEY (isbn);


--
-- TOC entry 3230 (class 2606 OID 16913)
-- Name: socios id_avalador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT id_avalador FOREIGN KEY (id_avalador) REFERENCES public.socios(id_socio);


--
-- TOC entry 3231 (class 2606 OID 16918)
-- Name: socios id_poblacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT id_poblacion FOREIGN KEY (id_poblacion) REFERENCES public.poblaciones(id_poblacion);


--
-- TOC entry 3232 (class 2606 OID 16908)
-- Name: pedidos id_socio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT id_socio FOREIGN KEY (id_socio) REFERENCES public.socios(id_socio);


-- Completed on 2023-05-05 14:35:48

--
-- PostgreSQL database dump complete
--

