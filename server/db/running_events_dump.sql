--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    event_date date,
    name character varying(255),
    quantity integer,
    distance integer
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, event_date, name, quantity, distance) FROM stdin;
1	2021-10-07	Рождественский полумарафон	24	21
2	2021-12-15	Новогодний марафон	700	42
3	2021-02-27	Рождественская гонка	32	15
4	2021-03-09	Новая почта космический полумарафон	57	21
5	2021-03-11	Новая почта Чернигов полумарафон	100	21
6	2021-04-13	Новогодний пробег	42	10
7	2021-06-30	Бука трейл	150	5
8	2021-10-24	Авалон полумарафон Львов	300	21
9	2021-05-15	Весенний пробег Чернигов	15	13
10	2021-10-21	Карпатия трейл	10	5
11	2021-12-06	Полтавская ночь	100	10
12	2021-10-10	Киевский полумарафон	60	21
13	2021-08-14	Хорольский забег	74	10
14	2021-05-12	Кременчугский полумарафон	45	21
15	2021-01-19	Ультратрейл Куяльник	30	4
16	2021-09-28	Белоцерковский марафон	36	42
17	2021-11-29	Эко-трейл краски осени	78	5
18	2021-03-16	Новая почта винницкий марафон	59	42
19	2021-02-06	Осенний трейл Киев	37	5
20	2021-03-08	Побег из Межигорья	94	21
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 20, true);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

