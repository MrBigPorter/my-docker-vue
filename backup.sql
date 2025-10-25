--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2 (Debian 13.2-1.pgdg100+1)

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
-- Name: books; Type: TABLE; Schema: public; Owner: lucky
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(255),
    author character varying(255)
);


ALTER TABLE public.books OWNER TO lucky;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: lucky
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO lucky;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucky
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: test_users; Type: TABLE; Schema: public; Owner: lucky
--

CREATE TABLE public.test_users (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.test_users OWNER TO lucky;

--
-- Name: test_users_id_seq; Type: SEQUENCE; Schema: public; Owner: lucky
--

CREATE SEQUENCE public.test_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_users_id_seq OWNER TO lucky;

--
-- Name: test_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucky
--

ALTER SEQUENCE public.test_users_id_seq OWNED BY public.test_users.id;


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: lucky
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: test_users id; Type: DEFAULT; Schema: public; Owner: lucky
--

ALTER TABLE ONLY public.test_users ALTER COLUMN id SET DEFAULT nextval('public.test_users_id_seq'::regclass);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: lucky
--

COPY public.books (id, title, author) FROM stdin;
1	Clean Code	Robert C. Martin
2	You Don't Know JS	Kyle Simpson
3	Refactoring	Martin Fowler
\.


--
-- Data for Name: test_users; Type: TABLE DATA; Schema: public; Owner: lucky
--

COPY public.test_users (id, name) FROM stdin;
1	Porter
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucky
--

SELECT pg_catalog.setval('public.books_id_seq', 3, true);


--
-- Name: test_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lucky
--

SELECT pg_catalog.setval('public.test_users_id_seq', 1, true);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: lucky
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: test_users test_users_pkey; Type: CONSTRAINT; Schema: public; Owner: lucky
--

ALTER TABLE ONLY public.test_users
    ADD CONSTRAINT test_users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

