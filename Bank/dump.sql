--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

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
-- Name: bankansatt; Type: TABLE; Schema: public; Owner: bank
--

CREATE TABLE public.bankansatt (
    bankansattid integer NOT NULL,
    fornavn text NOT NULL,
    etternavn text NOT NULL,
    ansiennitet integer DEFAULT 1,
    kjonn text,
    CONSTRAINT bankansatt_kjonn_check CHECK (((kjonn = 'm'::text) OR (kjonn = 'f'::text)))
);


ALTER TABLE public.bankansatt OWNER TO bank;

--
-- Name: bankansatt_bankansattid_seq; Type: SEQUENCE; Schema: public; Owner: bank
--

CREATE SEQUENCE public.bankansatt_bankansattid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bankansatt_bankansattid_seq OWNER TO bank;

--
-- Name: bankansatt_bankansattid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bank
--

ALTER SEQUENCE public.bankansatt_bankansattid_seq OWNED BY public.bankansatt.bankansattid;


--
-- Name: konto; Type: TABLE; Schema: public; Owner: bank
--

CREATE TABLE public.konto (
    kontoid integer NOT NULL,
    balance text,
    kundeid integer
);


ALTER TABLE public.konto OWNER TO bank;

--
-- Name: konto_kontoid_seq; Type: SEQUENCE; Schema: public; Owner: bank
--

CREATE SEQUENCE public.konto_kontoid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.konto_kontoid_seq OWNER TO bank;

--
-- Name: konto_kontoid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bank
--

ALTER SEQUENCE public.konto_kontoid_seq OWNED BY public.konto.kontoid;


--
-- Name: kunde; Type: TABLE; Schema: public; Owner: bank
--

CREATE TABLE public.kunde (
    kundeid integer NOT NULL,
    fornavn text NOT NULL,
    etternavn text NOT NULL,
    adresse text,
    epost text,
    tlf text,
    fdato date,
    kjonn text,
    bankansattid integer,
    userid integer NOT NULL
);


ALTER TABLE public.kunde OWNER TO bank;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE; Schema: public; Owner: bank
--

CREATE SEQUENCE public.kunde_kundeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kunde_kundeid_seq OWNER TO bank;

--
-- Name: kunde_kundeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bank
--

ALTER SEQUENCE public.kunde_kundeid_seq OWNED BY public.kunde.kundeid;


--
-- Name: laan; Type: TABLE; Schema: public; Owner: bank
--

CREATE TABLE public.laan (
    laanid integer NOT NULL,
    udato date,
    antall text,
    nedbetalt text DEFAULT 'false'::text,
    kundeid integer,
    CONSTRAINT laan_nedbetalt_check CHECK (((nedbetalt = 'true'::text) OR (nedbetalt = 'false'::text)))
);


ALTER TABLE public.laan OWNER TO bank;

--
-- Name: laan_laanid_seq; Type: SEQUENCE; Schema: public; Owner: bank
--

CREATE SEQUENCE public.laan_laanid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.laan_laanid_seq OWNER TO bank;

--
-- Name: laan_laanid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bank
--

ALTER SEQUENCE public.laan_laanid_seq OWNED BY public.laan.laanid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: bank
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    username text NOT NULL,
    role text DEFAULT 'user'::text,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO bank;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: bank
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO bank;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bank
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: bankansatt bankansattid; Type: DEFAULT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.bankansatt ALTER COLUMN bankansattid SET DEFAULT nextval('public.bankansatt_bankansattid_seq'::regclass);


--
-- Name: konto kontoid; Type: DEFAULT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.konto ALTER COLUMN kontoid SET DEFAULT nextval('public.konto_kontoid_seq'::regclass);


--
-- Name: kunde kundeid; Type: DEFAULT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.kunde ALTER COLUMN kundeid SET DEFAULT nextval('public.kunde_kundeid_seq'::regclass);


--
-- Name: laan laanid; Type: DEFAULT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.laan ALTER COLUMN laanid SET DEFAULT nextval('public.laan_laanid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: bankansatt; Type: TABLE DATA; Schema: public; Owner: bank
--

COPY public.bankansatt (bankansattid, fornavn, etternavn, ansiennitet, kjonn) FROM stdin;
2	Sigurd	Kringeland	5	\N
4	Eirik	Nilsen	5	\N
5	Peter	Olsen	8	\N
\.


--
-- Data for Name: konto; Type: TABLE DATA; Schema: public; Owner: bank
--

COPY public.konto (kontoid, balance, kundeid) FROM stdin;
\.


--
-- Data for Name: kunde; Type: TABLE DATA; Schema: public; Owner: bank
--

COPY public.kunde (kundeid, fornavn, etternavn, adresse, epost, tlf, fdato, kjonn, bankansattid, userid) FROM stdin;
1	Henrik	Ibsen	Haugesund	henrik@gmail.com	\N	\N	\N	\N	1
2	Eirik	Nilsen	Haugesund	eirik@gmail.com	\N	\N	\N	\N	3
\.


--
-- Data for Name: laan; Type: TABLE DATA; Schema: public; Owner: bank
--

COPY public.laan (laanid, udato, antall, nedbetalt, kundeid) FROM stdin;
3	2020-01-29	555	false	1
4	2020-01-31	10000000	false	1
5	2020-01-30	9000000	false	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: bank
--

COPY public.users (userid, username, role, password) FROM stdin;
2	admin	admin	4122cb13c7a474c1976c9706ae36521d
3	eirik	user	202cb962ac59075b964b07152d234b70
1	henrik	admin	202cb962ac59075b964b07152d234b70
\.


--
-- Name: bankansatt_bankansattid_seq; Type: SEQUENCE SET; Schema: public; Owner: bank
--

SELECT pg_catalog.setval('public.bankansatt_bankansattid_seq', 5, true);


--
-- Name: konto_kontoid_seq; Type: SEQUENCE SET; Schema: public; Owner: bank
--

SELECT pg_catalog.setval('public.konto_kontoid_seq', 1, false);


--
-- Name: kunde_kundeid_seq; Type: SEQUENCE SET; Schema: public; Owner: bank
--

SELECT pg_catalog.setval('public.kunde_kundeid_seq', 2, true);


--
-- Name: laan_laanid_seq; Type: SEQUENCE SET; Schema: public; Owner: bank
--

SELECT pg_catalog.setval('public.laan_laanid_seq', 5, true);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: bank
--

SELECT pg_catalog.setval('public.users_userid_seq', 3, true);


--
-- Name: bankansatt bankansatt_pkey; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.bankansatt
    ADD CONSTRAINT bankansatt_pkey PRIMARY KEY (bankansattid);


--
-- Name: konto konto_pkey; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.konto
    ADD CONSTRAINT konto_pkey PRIMARY KEY (kontoid);


--
-- Name: kunde kunde_pkey; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_pkey PRIMARY KEY (kundeid);


--
-- Name: kunde kunde_userid_key; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_userid_key UNIQUE (userid);


--
-- Name: laan laan_pkey; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.laan
    ADD CONSTRAINT laan_pkey PRIMARY KEY (laanid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: konto konto_kundeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.konto
    ADD CONSTRAINT konto_kundeid_fkey FOREIGN KEY (kundeid) REFERENCES public.kunde(kundeid);


--
-- Name: kunde kunde_bankansattid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.kunde
    ADD CONSTRAINT kunde_bankansattid_fkey FOREIGN KEY (bankansattid) REFERENCES public.bankansatt(bankansattid);


--
-- Name: laan laan_kundeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bank
--

ALTER TABLE ONLY public.laan
    ADD CONSTRAINT laan_kundeid_fkey FOREIGN KEY (kundeid) REFERENCES public.kunde(kundeid);


--
-- PostgreSQL database dump complete
--

