--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: contactInfo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."contactInfo" (
    id integer NOT NULL,
    cpf character varying(11) NOT NULL,
    telephone character varying(15) NOT NULL,
    city text NOT NULL,
    photo text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: contactInfo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."contactInfo_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contactInfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."contactInfo_id_seq" OWNED BY public."contactInfo".id;


--
-- Name: professions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.professions (
    id integer NOT NULL,
    title text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: professions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.professions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: professions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.professions_id_seq OWNED BY public.professions.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    photo text NOT NULL,
    available boolean DEFAULT true,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contactInfo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."contactInfo" ALTER COLUMN id SET DEFAULT nextval('public."contactInfo_id_seq"'::regclass);


--
-- Name: professions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.professions ALTER COLUMN id SET DEFAULT nextval('public.professions_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contactInfo; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."contactInfo" VALUES (4, '12345678905', '32999842476', 'Lavras', 'https://picture5com.br', 11, '2023-10-04 23:04:58.613264');
INSERT INTO public."contactInfo" VALUES (5, '12345678901', '32999842471', 'Lavras', 'https://picture1com.br', 12, '2023-10-04 23:05:56.636778');
INSERT INTO public."contactInfo" VALUES (6, '01234567891', '99985632541', 'miami', 'https://w7.pngwing.com/pngs/211/502/png-transparent-lionel-messi-art-lionel-messi-wpap-desktop-lionel-messi-face-poster-head-thumbnail.png', 13, '2023-10-05 14:50:39.621306');
INSERT INTO public."contactInfo" VALUES (7, '12345678961', '32999842461', 'Lavras61', 'https://picture61com.br', 14, '2023-10-05 21:00:45.035686');
INSERT INTO public."contactInfo" VALUES (8, '12345678900', '32999842400', 'Lavras00', 'https://picture00com.br', 15, '2023-10-05 21:12:08.95254');


--
-- Data for Name: professions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.professions VALUES (1, 'Dev', 14, '2023-10-06 15:20:48.803877');
INSERT INTO public.professions VALUES (2, 'Software engineer', 15, '2023-10-06 15:20:48.803877');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.services VALUES (1, 'front javascript, c++', 'faço projetos front-end nas linguagens javascript e c++', 'https://www.pngwing.com/pt/free-png-dcjna', true, 13, '2023-10-05 16:03:37.702705');
INSERT INTO public.services VALUES (2, 'skfjdsfjdk', 'dkfhldsh', 'kjfdfk', true, 13, '2023-10-05 16:15:43.845315');
INSERT INTO public.services VALUES (3, 'kslkdkhkfj', 'suidiusdis', 'ksdhksjhdjk', true, 13, '2023-10-05 16:19:12.949595');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 'fc28b2bf-ef7f-4696-b1c1-95bd5e325bb9', 12, '2023-10-04 23:13:52.751171');
INSERT INTO public.sessions VALUES (2, '02b5cd32-d864-4740-b93d-d476ec95f10f', 12, '2023-10-04 23:13:59.382838');
INSERT INTO public.sessions VALUES (3, '3299f589-4e08-48ec-846f-409dbdb24986', 12, '2023-10-05 14:46:17.357132');
INSERT INTO public.sessions VALUES (4, 'a40cf118-58c8-4ed0-a5f6-c5222aadec6f', 13, '2023-10-05 14:53:09.415263');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (11, 'Henrique5', 'henrique5@driven.com', '$2b$10$oKuyO6I6mfWk5OTtjTmOEusIsZiYKjEwKadZNn9zoGDrdOuyh/N9u', '2023-10-04 23:04:58.600368');
INSERT INTO public.users VALUES (12, 'Henrique1', 'henrique1@driven.com', '$2b$10$/3Ilmh.2mc8DzLUtSIVuPuh6z83hiaFCXt7xdTf.Jqsq444PUMzsq', '2023-10-04 23:05:56.628628');
INSERT INTO public.users VALUES (13, 'messi', 'messi@driven.com', '$2b$10$90t3H4dPdU.lxlUHn0uFBOMoUK4trvwmYUISfTTIssts81oI9aVyW', '2023-10-05 14:50:39.614702');
INSERT INTO public.users VALUES (14, 'Henrique61', 'henrique61@driven.com', '$2b$10$JF87KSg0FOXEznX/b.7XpeGBnnGW2eyd3WI.KpTWT6B4bTxh4tDDK', '2023-10-05 21:00:45.026846');
INSERT INTO public.users VALUES (15, 'Joao', 'joao@driven.com', '$2b$10$lU5kQQnbxiyJoVyH8ADNfuorD2/idVG/XZbC18ab33dcRkuuM0sJe', '2023-10-05 21:12:08.945055');


--
-- Name: contactInfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."contactInfo_id_seq"', 8, true);


--
-- Name: professions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.professions_id_seq', 2, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_id_seq', 3, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- Name: contactInfo contactInfo_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."contactInfo"
    ADD CONSTRAINT "contactInfo_cpf_key" UNIQUE (cpf);


--
-- Name: contactInfo contactInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."contactInfo"
    ADD CONSTRAINT "contactInfo_pkey" PRIMARY KEY (id);


--
-- Name: contactInfo contactInfo_telephone_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."contactInfo"
    ADD CONSTRAINT "contactInfo_telephone_key" UNIQUE (telephone);


--
-- Name: professions professions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.professions
    ADD CONSTRAINT professions_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: contactInfo contactInfo_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."contactInfo"
    ADD CONSTRAINT "contactInfo_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: professions professions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.professions
    ADD CONSTRAINT "professions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: services services_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT "services_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

