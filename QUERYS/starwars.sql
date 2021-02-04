--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    title character varying(100),
    episode_id character varying(100),
    opening_crawl character varying(10485760),
    director character varying(100),
    producer character varying(100),
    release_date character varying(100),
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.films OWNER TO postgres;

--
-- Name: films_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films_people (
    codigo_film integer NOT NULL,
    codigo_people integer NOT NULL
);


ALTER TABLE public.films_people OWNER TO postgres;

--
-- Name: films_planets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films_planets (
    codigo_film integer NOT NULL,
    codigo_planet integer NOT NULL
);


ALTER TABLE public.films_planets OWNER TO postgres;

--
-- Name: mails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mails (
    id integer NOT NULL,
    mail character varying(60),
    id_usuarios integer
);


ALTER TABLE public.mails OWNER TO postgres;

--
-- Name: mails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mails_id_seq OWNER TO postgres;

--
-- Name: mails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mails_id_seq OWNED BY public.mails.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.people (
    name character varying(100),
    birth_year character varying(100),
    eye_color character varying(100),
    gender character varying(100),
    hair_color character varying(100),
    height character varying(100),
    mass character varying(100),
    skin_color character varying(100),
    homeworld integer,
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.people OWNER TO postgres;

--
-- Name: planets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planets (
    name character varying(100),
    diameter character varying(100),
    rotation_period character varying(100),
    orbital_period character varying(100),
    gravity character varying(100),
    population character varying(100),
    climate character varying(100),
    terrain character varying(100),
    surface_water character varying(100),
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.planets OWNER TO postgres;

--
-- Name: species; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species (
    name character varying(100),
    classification character varying(100),
    designation character varying(100),
    average_height character varying(100),
    average_lifespan character varying(100),
    eye_colors character varying(100),
    hair_colors character varying(100),
    skin_colors character varying(100),
    language character varying(100),
    homeworld integer,
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.species OWNER TO postgres;

--
-- Name: species_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.species_people (
    codigo_specie integer NOT NULL,
    codigo_people integer NOT NULL
);


ALTER TABLE public.species_people OWNER TO postgres;

--
-- Name: starships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starships (
    name character varying(100),
    model character varying(100),
    starship_class character varying(100),
    manufacturer character varying(100),
    cost_in_credits character varying(100),
    length character varying(100),
    crew character varying(100),
    passengers character varying(100),
    max_atmosphering_speed character varying(100),
    hyperdrive_rating character varying(100),
    mglt character varying(100),
    cargo_capacity character varying(100),
    consumables character varying(100),
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.starships OWNER TO postgres;

--
-- Name: starships_films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starships_films (
    codigo_starship integer NOT NULL,
    codigo_film integer NOT NULL
);


ALTER TABLE public.starships_films OWNER TO postgres;

--
-- Name: starships_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starships_people (
    codigo_starship integer NOT NULL,
    codigo_people integer NOT NULL
);


ALTER TABLE public.starships_people OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    usuario character varying(60),
    password character varying(60),
    codigo_people integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    name character varying(100),
    model character varying(100),
    vehicle_class character varying(100),
    manufacturer character varying(100),
    length character varying(100),
    cost_in_credits character varying(100),
    crew character varying(100),
    passengers character varying(100),
    max_atmosphering_speed character varying(100),
    cargo_capacity character varying(100),
    consumables character varying(100),
    codigo integer NOT NULL,
    created character varying(100),
    edited character varying(100)
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- Name: vehicles_films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles_films (
    codigo_vehicle integer NOT NULL,
    codigo_film integer NOT NULL
);


ALTER TABLE public.vehicles_films OWNER TO postgres;

--
-- Name: vehicles_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles_people (
    codigo_vehicle integer NOT NULL,
    codigo_people integer NOT NULL
);


ALTER TABLE public.vehicles_people OWNER TO postgres;

--
-- Name: mails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails ALTER COLUMN id SET DEFAULT nextval('public.mails_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (title, episode_id, opening_crawl, director, producer, release_date, codigo, created, edited) FROM stdin;
A New Hope	4	It is a period of civil war.\nRebel spaceships, striking\nfrom a hidden base, have won\ntheir first victory against\nthe evil Galactic Empire.\n\nDuring the battle, Rebel\nspies managed to steal secret\nplans to the Empire's\nultimate weapon, the DEATH\nSTAR, an armored space\nstation with enough power\nto destroy an entire planet.\n\nPursued by the Empire's\nsinister agents, Princess\nLeia races home aboard her\nstarship, custodian of the\nstolen plans that can save her\npeople and restore\nfreedom to the galaxy....	George Lucas	Gary Kurtz, Rick McCallum	1977-05-25	1	2014-12-10T14:23:31.880000Z	2014-12-20T19:49:45.256000Z
The Empire Strikes Back	5	It is a dark time for the\nRebellion. Although the Death\nStar has been destroyed,\nImperial troops have driven the\nRebel forces from their hidden\nbase and pursued them across\nthe galaxy.\n\nEvading the dreaded Imperial\nStarfleet, a group of freedom\nfighters led by Luke Skywalker\nhas established a new secret\nbase on the remote ice world\nof Hoth.\n\nThe evil lord Darth Vader,\nobsessed with finding young\nSkywalker, has dispatched\nthousands of remote probes into\nthe far reaches of space....	Irvin Kershner	Gary Kurtz, Rick McCallum	1980-05-17	2	2014-12-12T11:26:24.656000Z	2014-12-15T13:07:53.386000Z
Return of the Jedi	6	Luke Skywalker has returned to\nhis home planet of Tatooine in\nan attempt to rescue his\nfriend Han Solo from the\nclutches of the vile gangster\nJabba the Hutt.\n\nLittle does Luke know that the\nGALACTIC EMPIRE has secretly\nbegun construction on a new\narmored space station even\nmore powerful than the first\ndreaded Death Star.\n\nWhen completed, this ultimate\nweapon will spell certain doom\nfor the small band of rebels\nstruggling to restore freedom\nto the galaxy...	Richard Marquand	Howard G. Kazanjian, George Lucas, Rick McCallum	1983-05-25	3	2014-12-18T10:39:33.255000Z	2014-12-20T09:48:37.462000Z
The Phantom Menace	1	Turmoil has engulfed the\nGalactic Republic. The taxation\nof trade routes to outlying star\nsystems is in dispute.\n\nHoping to resolve the matter\nwith a blockade of deadly\nbattleships, the greedy Trade\nFederation has stopped all\nshipping to the small planet\nof Naboo.\n\nWhile the Congress of the\nRepublic endlessly debates\nthis alarming chain of events,\nthe Supreme Chancellor has\nsecretly dispatched two Jedi\nKnights, the guardians of\npeace and justice in the\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19	4	2014-12-19T16:52:55.740000Z	2014-12-20T10:54:07.216000Z
Attack of the Clones	2	There is unrest in the Galactic\nSenate. Several thousand solar\nsystems have declared their\nintentions to leave the Republic.\n\nThis separatist movement,\nunder the leadership of the\nmysterious Count Dooku, has\nmade it difficult for the limited\nnumber of Jedi Knights to maintain \npeace and order in the galaxy.\n\nSenator Amidala, the former\nQueen of Naboo, is returning\nto the Galactic Senate to vote\non the critical issue of creating\nan ARMY OF THE REPUBLIC\nto assist the overwhelmed\nJedi....	George Lucas	Rick McCallum	2002-05-16	5	2014-12-20T10:57:57.886000Z	2014-12-20T20:18:48.516000Z
Revenge of the Sith	3	War! The Republic is crumbling\nunder attacks by the ruthless\nSith Lord, Count Dooku.\nThere are heroes on both sides.\nEvil is everywhere.\n\nIn a stunning move, the\nfiendish droid leader, General\nGrievous, has swept into the\nRepublic capital and kidnapped\nChancellor Palpatine, leader of\nthe Galactic Senate.\n\nAs the Separatist Droid Army\nattempts to flee the besieged\ncapital with their valuable\nhostage, two Jedi Knights lead a\ndesperate mission to rescue the\ncaptive Chancellor....	George Lucas	Rick McCallum	2005-05-19	6	2014-12-20T18:49:38.403000Z	2014-12-20T20:47:52.073000Z
A New Hope	4	Nueva pelicula	George Lucas	Gary Kurtz, Rick McCallum	1977-05-25	8	2014-12-10T14:23:31.880000Z	2014-12-20T19:49:45.256000Z
Nueva Con Planet y Personajes	11	Turmoil has engulfed the\nGalactic Republic. The taxation\nof trade routes to outlying star\nsystems is in dispute.\n\nHoping to resolve the matter\nwith a blockade of deadly\nbattleships, the greedy Trade\nFederation has stopped all\nshipping to the small planet\nof Naboo.\n\nWhile the Congress of the\nRepublic endlessly debates\nthis alarming chain of events,\nthe Supreme Chancellor has\nsecretly dispatched two Jedi\nKnights, the guardians of\npeace and justice in the\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19	20	2021-02-03T10:34:04.921Z	2021-02-04T08:11:20.615Z
Nueva Con Planet y Personajes	11	Turmoil has engulfed the\nGalactic Republic. The taxation\nof trade routes to outlying star\nsystems is in dispute.\n\nHoping to resolve the matter\nwith a blockade of deadly\nbattleships, the greedy Trade\nFederation has stopped all\nshipping to the small planet\nof Naboo.\n\nWhile the Congress of the\nRepublic endlessly debates\nthis alarming chain of events,\nthe Supreme Chancellor has\nsecretly dispatched two Jedi\nKnights, the guardians of\npeace and justice in the\ngalaxy, to settle the conflict....	George Lucas	Rick McCallum	1999-05-19	19	2021-02-03T10:34:04.921Z	2021-02-03T10:34:04.921Z
Nueva Con Planet y Personajes	2	Una familia	George Lucas	Rick McCallum	2021-02-04	21	2021-02-03T20:55:18.374Z	2021-02-04T18:54:26.502Z
\.


--
-- Data for Name: films_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films_people (codigo_film, codigo_people) FROM stdin;
1	1
2	1
3	1
6	1
1	2
2	2
3	2
4	2
5	2
6	2
1	3
2	3
3	3
4	3
5	3
6	3
1	4
2	4
3	4
6	4
1	5
2	5
3	5
6	5
1	6
5	6
6	6
1	8
1	9
1	10
2	10
3	10
4	10
5	10
6	10
4	11
5	11
6	11
1	14
2	14
3	14
1	15
1	16
3	16
4	16
1	18
2	18
3	18
1	19
2	20
3	20
4	20
5	20
6	20
2	21
3	21
4	21
5	21
6	21
2	22
3	22
5	22
2	23
2	24
2	25
3	25
2	26
3	27
3	28
3	29
3	30
3	31
4	32
4	33
5	33
6	33
4	34
4	35
5	35
6	35
4	36
5	36
4	37
4	38
4	39
4	40
5	40
4	41
4	42
4	43
5	43
4	44
3	45
4	46
5	46
6	46
4	47
4	48
4	49
4	50
4	51
5	51
6	51
4	52
5	52
6	52
4	53
5	53
6	53
4	54
6	54
4	55
6	55
4	56
6	56
4	57
4	58
5	58
6	58
4	59
5	59
5	60
5	61
5	62
5	63
6	63
5	64
6	64
5	65
5	66
5	67
6	67
5	68
6	68
5	69
5	70
5	71
5	72
5	73
5	74
5	75
6	75
5	76
5	77
5	78
6	78
6	79
6	80
1	81
6	81
8	1
19	33
20	33
20	5
21	13
\.


--
-- Data for Name: films_planets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films_planets (codigo_film, codigo_planet) FROM stdin;
1	1
1	2
1	3
2	4
2	5
2	6
2	27
3	1
3	5
3	7
3	8
3	9
4	1
4	8
4	9
5	1
5	8
5	9
5	10
5	11
6	1
6	2
6	5
6	8
6	9
6	12
6	13
6	14
6	15
6	16
6	17
6	18
6	19
8	1
19	1
19	9
21	1
20	1
20	7
20	3
20	6
21	2
\.


--
-- Data for Name: mails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mails (id, mail, id_usuarios) FROM stdin;
198	leia@correo.com	71
199	Luke@Correo.com	72
200	r2d2@correo.com	73
201	r2d2_1@correo.com	73
202	chiwi@correo.com	74
203	ObiWanKe@correo.com	75
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.people (name, birth_year, eye_color, gender, hair_color, height, mass, skin_color, homeworld, codigo, created, edited) FROM stdin;
Beru Whitesun lars	47BBY	blue	female	brown	165	75	light	1	7	2014-12-09T13:50:51.644000Z	2021-02-01T20:50:33.694Z
Chewbacca	200BBY	blue	male	brown	228	112	fair	14	13	2014-12-09T13:50:51.644000Z	2021-02-04T18:48:40.059Z
Wilhuff Tarkin	64BBY	blue	male	auburn, grey	180	123	fair	21	12	2014-12-09T13:50:51.644000Z	2021-02-04T18:48:49.164Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	1	1	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Leia Organa	19BBY	brown	female	brown	150	49	light	2	5	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.315000Z
Owen Lars	52BBY	blue	male	brown, grey	178	120	light	1	6	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.317000Z
Biggs Darklighter	24BBY	brown	male	black	183	84	light	1	9	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.323000Z
Obi-Wan Kenobi	57BBY	blue-gray	male	auburn, white	182	77	fair	20	10	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.325000Z
Anakin Skywalker	41.9BBY	blue	male	blond	188	84	fair	1	11	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.327000Z
Han Solo	29BBY	brown	male	brown	180	80	fair	22	14	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.334000Z
Wedge Antilles	21BBY	hazel	male	brown	170	77	fair	22	18	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.341000Z
Jek Tono Porkins	unknown	blue	male	brown	180	110	fair	26	19	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.343000Z
Yoda	896BBY	brown	male	white	66	17	green	28	20	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.345000Z
Palpatine	82BBY	yellow	male	grey	170	75	pale	8	21	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.347000Z
Boba Fett	31.5BBY	brown	male	black	183	78.2	fair	10	22	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.349000Z
Lando Calrissian	31BBY	brown	male	black	177	79	dark	30	25	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.357000Z
Mon Mothma	48BBY	blue	female	auburn	150	unknown	fair	32	28	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.364000Z
Arvel Crynyd	unknown	brown	male	brown	unknown	unknown	fair	28	29	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.367000Z
Wicket Systri Warrick	8BBY	brown	male	brown	88	20	brown	7	30	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.369000Z
Qui-Gon Jinn	92BBY	blue	male	brown	193	89	fair	28	32	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.375000Z
Finis Valorum	91BBY	blue	male	blond	170	unknown	fair	9	34	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.379000Z
2	57BBY	Marron	GeneroNuevoPersonaje	Cian	123	123	Verde	50	99	2021-02-01T20:31:41.389Z	2021-02-01T20:31:41.389Z
Gregar Typho	unknown	brown	male	black	185	85	dark	8	60	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.445000Z
Cordé	unknown	brown	female	brown	157	unknown	light	8	61	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.449000Z
Cliegg Lars	82BBY	blue	male	brown	183	unknown	fair	1	62	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.451000Z
Luminara Unduli	58BBY	blue	female	black	170	56.2	yellow	51	64	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.455000Z
Barriss Offee	40BBY	blue	female	black	166	50	yellow	51	65	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.457000Z
Dormé	unknown	brown	female	brown	165	unknown	light	8	66	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.460000Z
Dooku	102BBY	brown	male	white	193	80	fair	52	67	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.462000Z
Bail Prestor Organa	67BBY	brown	male	black	191	unknown	tan	2	68	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.463000Z
Jango Fett	66BBY	brown	male	black	183	79	tan	53	69	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.465000Z
Zam Wesell	unknown	yellow	female	blonde	168	55	fair, green, yellow	54	70	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.468000Z
Jocasta Nu	unknown	blue	female	white	167	unknown	fair	9	74	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.476000Z
Tarfful	unknown	blue	male	brown	234	136	brown	14	80	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.491000Z
Raymus Antilles	unknown	brown	male	brown	188	79	light	2	81	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.493000Z
Kylo Ren	2YL23	Marron	Masculino	Marron	191	80	Blanca	63	100	2021-02-04T13:22:33.870Z	2021-02-04T18:45:15.172Z
Padmé Amidala	46BBY	brown	female	brown	185	45	light	8	35	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.381000Z
Ric Olié	unknown	blue	male	brown	183	unknown	fair	8	39	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.392000Z
Watto	unknown	yellow	male	black	137	unknown	blue, grey	34	40	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.395000Z
Quarsh Panaka	62BBY	brown	male	black	183	unknown	dark	8	42	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.399000Z
Shmi Skywalker	72BBY	brown	female	black	163	unknown	fair	1	43	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.401000Z
Ki-Adi-Mundi	92BBY	yellow	male	white	198	82	pale	43	52	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.422000Z
Eeth Koth	unknown	brown	male	black	171	unknown	brown	45	54	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.427000Z
Greedo	44BBY	black	male	unknown	173	74	green	23	15	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.336000Z
Jabba Desilijic Tiure	600BBY	orange	hermaphrodite	unknown	175	1,358	green-tan, brown	24	16	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.338000Z
Darth Vader	41.9BBY	yellow	male	unknown	202	136	white	1	4	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.313000Z
IG-88	15BBY	red	none	unknown	200	140	metal	28	23	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.351000Z
Bossk	53BBY	red	male	unknown	190	113	green	29	24	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.355000Z
Yarael Poof	unknown	yellow	male	unknown	264	unknown	white	48	57	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.437000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	1	85	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	1	86	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	1	87	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	\N	88	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	\N	89	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	\N	90	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:56.891000Z
Plo Koon	22BBY	black	male	unknown	188	80	orange	49	58	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.439000Z
Mas Amedda	unknown	blue	male	unknown	196	unknown	blue	50	59	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.442000Z
Poggle the Lesser	unknown	yellow	male	unknown	183	80	green	11	63	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.453000Z
Dexter Jettster	unknown	yellow	male	unknown	198	102	brown	55	71	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.470000Z
Luke Skywalker	19BBY	blue	male	blond	172	77	fair	1	91	2014-12-09T13:50:51.644000Z	2021-02-01T10:18:33.013Z
C-3PO	112BBY	yellow	unknown	unknown	167	75	gold	1	2	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.309000Z
R2-D2	33BBY	red	unknown	unknown	96	32	white, blue	8	3	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.311000Z
R5-D4	unknown	red	unknown	unknown	97	32	white, red	1	8	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.321000Z
Lobot	37BBY	blue	male	unknown	175	79	light	6	26	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.359000Z
Ackbar	41BBY	orange	male	unknown	180	83	brown mottle	31	27	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.362000Z
Nien Nunb	unknown	black	male	unknown	160	68	grey	33	31	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.371000Z
Nute Gunray	unknown	red	male	unknown	191	90	mottled green	18	33	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.377000Z
Jar Jar Binks	52BBY	orange	male	unknown	196	66	orange	8	36	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.383000Z
Roos Tarpals	unknown	orange	male	unknown	224	82	grey	8	37	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.385000Z
Rugor Nass	unknown	orange	male	unknown	206	unknown	green	8	38	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.388000Z
Sebulba	unknown	orange	male	unknown	112	40	grey, red	35	41	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.397000Z
Lama Su	unknown	black	male	unknown	229	88	grey	10	72	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.473000Z
Taun We	unknown	black	female	unknown	213	unknown	grey	10	73	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.474000Z
R4-P17	unknown	red, blue	female	unknown	96	unknown	silver, red	28	75	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.478000Z
Wat Tambor	unknown	unknown	male	unknown	193	48	green, grey	56	76	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.481000Z
San Hill	unknown	gold	male	unknown	191	unknown	grey	57	77	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.484000Z
Darth Maul	54BBY	yellow	male	unknown	175	80	red	36	44	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.403000Z
Bib Fortuna	unknown	pink	male	unknown	180	unknown	pale	37	45	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.407000Z
Ayla Secura	48BBY	hazel	female	unknown	178	55	blue	37	46	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.409000Z
Ratts Tyerel	unknown	unknown	male	unknown	79	15	grey, blue	38	47	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.410000Z
Dud Bolt	unknown	yellow	male	unknown	94	45	blue, grey	39	48	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.414000Z
Gasgano	unknown	black	male	unknown	122	unknown	white, blue	40	49	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.416000Z
Ben Quadinaros	unknown	orange	male	unknown	163	65	grey, green, yellow	41	50	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.417000Z
Mace Windu	72BBY	brown	male	unknown	188	84	dark	42	51	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.420000Z
Kit Fisto	unknown	black	male	unknown	196	87	green	44	53	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.424000Z
Adi Gallia	unknown	blue	female	unknown	184	50	dark	9	55	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.432000Z
Saesee Tiin	unknown	orange	male	unknown	188	unknown	pale	47	56	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.434000Z
Shaak Ti	unknown	black	female	unknown	178	57	red, blue, white	58	78	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.486000Z
Grievous	unknown	green, yellow	male	unknown	216	159	brown, white	59	79	2014-12-09T13:50:51.644000Z	2014-12-20T21:17:50.488000Z
Sly Moore	unknown	white	female	unknown	178	48	pale	60	82	2014-12-09T13:50:51.644000Z	2021-02-01T20:03:35.823Z
Tion Medon	25031985	black	male	Claro	206	80	grey	10	83	2014-12-09T13:50:51.644000Z	2021-02-04T08:39:44.044Z
\.


--
-- Data for Name: planets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planets (name, diameter, rotation_period, orbital_period, gravity, population, climate, terrain, surface_water, codigo, created, edited) FROM stdin;
Tatooine	10465	23	304	1 standard	200000	arid	desert	1	1	2014-12-09T13:50:49.641000Z	2014-12-20T20:58:18.411000Z
Alderaan	12500	24	364	1 standard	2000000000	temperate	grasslands, mountains	40	2	2014-12-10T11:35:48.479000Z	2014-12-20T20:58:18.420000Z
Yavin IV	10200	24	4818	1 standard	1000	temperate, tropical	jungle, rainforests	8	3	2014-12-10T11:37:19.144000Z	2014-12-20T20:58:18.421000Z
Hoth	7200	23	549	1.1 standard	unknown	frozen	tundra, ice caves, mountain ranges	100	4	2014-12-10T11:39:13.934000Z	2014-12-20T20:58:18.423000Z
Bespin	118000	12	5110	1.5 (surface), 1 standard (Cloud City)	6000000	temperate	gas giant	0	6	2014-12-10T11:43:55.240000Z	2014-12-20T20:58:18.427000Z
Endor	4900	18	402	0.85 standard	30000000	temperate	forests, mountains, lakes	8	7	2014-12-10T11:50:29.349000Z	2014-12-20T20:58:18.429000Z
Naboo	12120	26	312	1 standard	4500000000	temperate	grassy hills, swamps, forests, mountains	12	8	2014-12-10T11:52:31.066000Z	2014-12-20T20:58:18.430000Z
Coruscant	12240	24	368	1 standard	1000000000000	temperate	cityscape, mountains	unknown	9	2014-12-10T11:54:13.921000Z	2014-12-20T20:58:18.432000Z
Kamino	19720	27	463	1 standard	1000000000	temperate	ocean	100	10	2014-12-10T12:45:06.577000Z	2014-12-20T20:58:18.434000Z
Geonosis	11370	30	256	0.9 standard	100000000000	temperate, arid	rock, desert, mountain, barren	5	11	2014-12-10T12:47:22.350000Z	2014-12-20T20:58:18.437000Z
Utapau	12900	27	351	1 standard	95000000	temperate, arid, windy	scrublands, savanna, canyons, sinkholes	0.9	12	2014-12-10T12:49:01.491000Z	2014-12-20T20:58:18.439000Z
Mustafar	4200	36	412	1 standard	20000	hot	volcanoes, lava rivers, mountains, caves	0	13	2014-12-10T12:50:16.526000Z	2014-12-20T20:58:18.440000Z
Kashyyyk	12765	26	381	1 standard	45000000	tropical	jungle, forests, lakes, rivers	60	14	2014-12-10T13:32:00.124000Z	2014-12-20T20:58:18.442000Z
Polis Massa	0	24	590	0.56 standard	1000000	artificial temperate 	airless asteroid	0	15	2014-12-10T13:33:46.405000Z	2014-12-20T20:58:18.444000Z
Mygeeto	10088	12	167	1 standard	19000000	frigid	glaciers, mountains, ice canyons	unknown	16	2014-12-10T13:43:39.139000Z	2014-12-20T20:58:18.446000Z
Felucia	9100	34	231	0.75 standard	8500000	hot, humid	fungus forests	unknown	17	2014-12-10T13:44:50.397000Z	2014-12-20T20:58:18.447000Z
Cato Neimoidia	0	25	278	1 standard	10000000	temperate, moist	mountains, fields, forests, rock arches	unknown	18	2014-12-10T13:46:28.704000Z	2014-12-20T20:58:18.449000Z
Saleucami	14920	26	392	unknown	1400000000	hot	caves, desert, mountains, volcanoes	unknown	19	2014-12-10T13:47:46.874000Z	2014-12-20T20:58:18.450000Z
Stewjon	0	unknown	unknown	1 standard	unknown	temperate	grass	unknown	20	2014-12-10T16:16:26.566000Z	2014-12-20T20:58:18.452000Z
Eriadu	13490	24	360	1 standard	22000000000	polluted	cityscape	unknown	21	2014-12-10T16:26:54.384000Z	2014-12-20T20:58:18.454000Z
Corellia	11000	25	329	1 standard	3000000000	temperate	plains, urban, hills, forests	70	22	2014-12-10T16:49:12.453000Z	2014-12-20T20:58:18.456000Z
Rodia	7549	29	305	1 standard	1300000000	hot	jungles, oceans, urban, swamps	60	23	2014-12-10T17:03:28.110000Z	2014-12-20T20:58:18.458000Z
Nal Hutta	12150	87	413	1 standard	7000000000	temperate	urban, oceans, swamps, bogs	unknown	24	2014-12-10T17:11:29.452000Z	2014-12-20T20:58:18.460000Z
Dantooine	9830	25	378	1 standard	1000	temperate	oceans, savannas, mountains, grasslands	unknown	25	2014-12-10T17:23:29.896000Z	2014-12-20T20:58:18.461000Z
Bestine IV	6400	26	680	unknown	62000000	temperate	rocky islands, oceans	98	26	2014-12-12T11:16:55.078000Z	2014-12-20T20:58:18.463000Z
Ord Mantell	14050	26	334	1 standard	4000000000	temperate	plains, seas, mesas	10	27	2014-12-15T12:23:41.661000Z	2014-12-20T20:58:18.464000Z
unknown	0	0	0	unknown	unknown	unknown	unknown	unknown	28	2014-12-15T12:25:59.569000Z	2014-12-20T20:58:18.466000Z
Trandosha	0	25	371	0.62 standard	42000000	arid	mountains, seas, grasslands, deserts	unknown	29	2014-12-15T12:53:47.695000Z	2014-12-20T20:58:18.468000Z
Socorro	0	20	326	1 standard	300000000	arid	deserts, mountains	unknown	30	2014-12-15T12:56:31.121000Z	2014-12-20T20:58:18.469000Z
Mon Cala	11030	21	398	1	27000000000	temperate	oceans, reefs, islands	100	31	2014-12-18T11:07:01.792000Z	2014-12-20T20:58:18.471000Z
Chandrila	13500	20	368	1	1200000000	temperate	plains, forests	40	32	2014-12-18T11:11:51.872000Z	2014-12-20T20:58:18.472000Z
Sullust	12780	20	263	1	18500000000	superheated	mountains, volcanoes, rocky deserts	5	33	2014-12-18T11:25:40.243000Z	2014-12-20T20:58:18.474000Z
Toydaria	7900	21	184	1	11000000	temperate	swamps, lakes	unknown	34	2014-12-19T17:47:54.403000Z	2014-12-20T20:58:18.476000Z
Malastare	18880	26	201	1.56	2000000000	arid, temperate, tropical	swamps, deserts, jungles, mountains	unknown	35	2014-12-19T17:52:13.106000Z	2014-12-20T20:58:18.478000Z
Dathomir	10480	24	491	0.9	5200	temperate	forests, deserts, savannas	unknown	36	2014-12-19T18:00:40.142000Z	2014-12-20T20:58:18.480000Z
Ryloth	10600	30	305	1	1500000000	temperate, arid, subartic	mountains, valleys, deserts, tundra	5	37	2014-12-20T09:46:25.740000Z	2014-12-20T20:58:18.481000Z
Aleen Minor	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown	38	2014-12-20T09:52:23.452000Z	2014-12-20T20:58:18.483000Z
Vulpter	14900	22	391	1	421000000	temperate, artic	urban, barren	unknown	39	2014-12-20T09:56:58.874000Z	2014-12-20T20:58:18.485000Z
Troiken	unknown	unknown	unknown	unknown	unknown	unknown	desert, tundra, rainforests, mountains	unknown	40	2014-12-20T10:01:37.395000Z	2014-12-20T20:58:18.487000Z
Tund	12190	48	1770	unknown	0	unknown	barren, ash	unknown	41	2014-12-20T10:07:29.578000Z	2014-12-20T20:58:18.489000Z
Haruun Kal	10120	25	383	0.98	705300	temperate	toxic cloudsea, plateaus, volcanoes	unknown	42	2014-12-20T10:12:28.980000Z	2014-12-20T20:58:18.491000Z
Cerea	unknown	27	386	1	450000000	temperate	verdant	20	43	2014-12-20T10:14:48.178000Z	2014-12-20T20:58:18.493000Z
Glee Anselm	15600	33	206	1	500000000	tropical, temperate	lakes, islands, swamps, seas	80	44	2014-12-20T10:18:26.110000Z	2014-12-20T20:58:18.495000Z
Iridonia	unknown	29	413	unknown	unknown	unknown	rocky canyons, acid pools	unknown	45	2014-12-20T10:26:05.788000Z	2014-12-20T20:58:18.497000Z
Tholoth	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown	46	2014-12-20T10:28:31.117000Z	2014-12-20T20:58:18.498000Z
Iktotch	unknown	22	481	1	unknown	arid, rocky, windy	rocky	unknown	47	2014-12-20T10:31:32.413000Z	2014-12-20T20:58:18.500000Z
Quermia	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown	48	2014-12-20T10:34:08.249000Z	2014-12-20T20:58:18.502000Z
Dorin	13400	22	409	1	unknown	temperate	unknown	unknown	49	2014-12-20T10:48:36.141000Z	2014-12-20T20:58:18.504000Z
Champala	unknown	27	318	1	3500000000	temperate	oceans, rainforests, plateaus	unknown	50	2014-12-20T10:52:51.524000Z	2014-12-20T20:58:18.506000Z
Mirial	unknown	unknown	unknown	unknown	unknown	unknown	deserts	unknown	51	2014-12-20T16:44:46.318000Z	2014-12-20T20:58:18.508000Z
Serenno	unknown	unknown	unknown	unknown	unknown	unknown	rainforests, rivers, mountains	unknown	52	2014-12-20T16:52:13.357000Z	2014-12-20T20:58:18.510000Z
Concord Dawn	unknown	unknown	unknown	unknown	unknown	unknown	jungles, forests, deserts	unknown	53	2014-12-20T16:54:39.909000Z	2014-12-20T20:58:18.512000Z
Zolan	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown	54	2014-12-20T16:56:37.250000Z	2014-12-20T20:58:18.514000Z
Ojom	unknown	unknown	unknown	unknown	500000000	frigid	oceans, glaciers	100	55	2014-12-20T17:27:41.286000Z	2014-12-20T20:58:18.516000Z
Skako	unknown	27	384	1	500000000000	temperate	urban, vines	unknown	56	2014-12-20T17:50:47.864000Z	2014-12-20T20:58:18.517000Z
Muunilinst	13800	28	412	1	5000000000	temperate	plains, forests, hills, mountains	25	57	2014-12-20T17:57:47.420000Z	2014-12-20T20:58:18.519000Z
Shili	unknown	unknown	unknown	1	unknown	temperate	cities, savannahs, seas, plains	unknown	58	2014-12-20T18:43:14.049000Z	2014-12-20T20:58:18.521000Z
Kalee	13850	23	378	1	4000000000	arid, temperate, tropical	rainforests, cliffs, canyons, seas	unknown	59	2014-12-20T19:43:51.278000Z	2014-12-20T20:58:18.523000Z
Umbara	unknown	unknown	unknown	unknown	unknown	unknown	unknown	unknown	60	2014-12-20T20:18:36.256000Z	2014-12-20T20:58:18.525000Z
Nuevo Planet	10465	23	304	1 standard	200000	arid	desert	1	61	2014-12-09T13:50:49.641000Z	2014-12-20T20:58:18.411000Z
PlanetaNuevoDesdeFront	100	14	15	1	120	Frio	Agua	11	62	2021-02-01T17:47:14.256Z	2021-02-01T17:50:16.353Z
Dagobah	8900	23	341	unknown	unknown	murky	swamp, jungles	8	5	2014-12-10T11:42:22.590000Z	2014-12-20T20:58:18.425000Z
Lulalu	10000km	12	23	10H	123412	Frio	Arido	50	63	2021-02-04T18:38:35.920Z	2021-02-04T18:38:35.920Z
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species (name, classification, designation, average_height, average_lifespan, eye_colors, hair_colors, skin_colors, language, homeworld, codigo, created, edited) FROM stdin;
Human	mammal	sentient	180	120	brown, blue, green, hazel, grey, amber	blonde, brown, black, red	caucasian, black, asian, hispanic	Galactic Basic	9	1	2014-12-10T13:52:11.567000Z	2014-12-20T21:36:42.136000Z
Droid	artificial	sentient	n/a	indefinite	n/a	n/a	n/a	n/a	\N	2	2014-12-10T15:16:16.259000Z	2014-12-20T21:36:42.139000Z
Wookie	mammal	sentient	210	400	blue, green, yellow, brown, golden, red	black, brown	gray	Shyriiwook	14	3	2014-12-10T16:44:31.486000Z	2014-12-20T21:36:42.142000Z
Rodian	sentient	reptilian	170	unknown	black	n/a	green, blue	Galatic Basic	23	4	2014-12-10T17:05:26.471000Z	2014-12-20T21:36:42.144000Z
Hutt	gastropod	sentient	300	1000	yellow, red	n/a	green, brown, tan	Huttese	24	5	2014-12-10T17:12:50.410000Z	2014-12-20T21:36:42.146000Z
Yoda´s species	mammal	sentient	66	900	brown, green, yellow	brown, white	green, yellow	Galactic basic	28	6	2014-12-15T12:27:22.877000Z	2014-12-20T21:36:42.148000Z
Trandoshan	reptile	sentient	200	unknown	yellow, orange	none	brown, green	Dosh	29	7	2014-12-15T13:07:47.704000Z	2014-12-20T21:36:42.151000Z
Mon Calamari	amphibian	sentient	160	unknown	yellow	none	red, blue, brown, magenta	Mon Calamarian	31	8	2014-12-18T11:09:52.263000Z	2014-12-20T21:36:42.153000Z
Ewok	mammal	sentient	100	unknown	orange, brown	white, brown, black	brown	Ewokese	7	9	2014-12-18T11:22:00.285000Z	2014-12-20T21:36:42.155000Z
Sullustan	mammal	sentient	180	unknown	black	none	pale	Sullutese	33	10	2014-12-18T11:26:20.103000Z	2014-12-20T21:36:42.157000Z
Neimodian	unknown	sentient	180	unknown	red, pink	none	grey, green	Neimoidia	18	11	2014-12-19T17:07:31.319000Z	2014-12-20T21:36:42.160000Z
Gungan	amphibian	sentient	190	unknown	orange	none	brown, green	Gungan basic	8	12	2014-12-19T17:30:37.341000Z	2014-12-20T21:36:42.163000Z
Toydarian	mammal	sentient	120	91	yellow	none	blue, green, grey	Toydarian	34	13	2014-12-19T17:48:56.893000Z	2014-12-20T21:36:42.165000Z
Dug	mammal	sentient	100	unknown	yellow, blue	none	brown, purple, grey, red	Dugese	35	14	2014-12-19T17:53:11.214000Z	2014-12-20T21:36:42.167000Z
Twi´lek	mammals	sentient	200	unknown	blue, brown, orange, pink	none	orange, yellow, blue, green, pink, purple, tan	Twi'leki	37	15	2014-12-20T09:48:02.406000Z	2014-12-20T21:36:42.169000Z
Aleena	reptile	sentient	80	79	unknown	none	blue, gray	Aleena	38	16	2014-12-20T09:53:16.481000Z	2014-12-20T21:36:42.171000Z
Vulptereen	unknown	sentient	100	unknown	yellow	none	grey	vulpterish	39	17	2014-12-20T09:57:33.128000Z	2014-12-20T21:36:42.173000Z
Xexto	unknown	sentient	125	unknown	black	none	grey, yellow, purple	Xextese	40	18	2014-12-20T10:02:13.915000Z	2014-12-20T21:36:42.175000Z
Toong	unknown	sentient	200	unknown	orange	none	grey, green, yellow	Tundan	41	19	2014-12-20T10:08:36.795000Z	2014-12-20T21:36:42.177000Z
Cerean	mammal	sentient	200	unknown	hazel	red, blond, black, white	pale pink	Cerean	43	20	2014-12-20T10:15:33.765000Z	2014-12-20T21:36:42.179000Z
Nautolan	amphibian	sentient	180	70	black	none	green, blue, brown, red	Nautila	44	21	2014-12-20T10:18:58.610000Z	2014-12-20T21:36:42.181000Z
Zabrak	mammal	sentient	180	unknown	brown, orange	black	pale, brown, red, orange, yellow	Zabraki	45	22	2014-12-20T10:26:59.894000Z	2014-12-20T21:36:42.183000Z
Tholothian	mammal	sentient	unknown	unknown	blue, indigo	unknown	dark	unknown	46	23	2014-12-20T10:29:13.798000Z	2014-12-20T21:36:42.186000Z
Iktotchi	unknown	sentient	180	unknown	orange	none	pink	Iktotchese	47	24	2014-12-20T10:32:13.046000Z	2014-12-20T21:36:42.188000Z
Quermian	mammal	sentient	240	86	yellow	none	white	Quermian	48	25	2014-12-20T10:34:50.827000Z	2014-12-20T21:36:42.189000Z
Kel Dor	unknown	sentient	180	70	black, silver	none	peach, orange, red	Kel Dor	49	26	2014-12-20T10:49:21.692000Z	2014-12-20T21:36:42.191000Z
Chagrian	amphibian	sentient	190	unknown	blue	none	blue	Chagria	50	27	2014-12-20T10:53:28.795000Z	2014-12-20T21:36:42.193000Z
Geonosian	insectoid	sentient	178	unknown	green, hazel	none	green, brown	Geonosian	11	28	2014-12-20T16:40:45.618000Z	2014-12-20T21:36:42.195000Z
Mirialan	mammal	sentient	180	unknown	blue, green, red, yellow, brown, orange	black, brown	yellow, green	Mirialan	51	29	2014-12-20T16:46:48.290000Z	2014-12-20T21:36:42.197000Z
Clawdite	reptilian	sentient	180	70	yellow	none	green, yellow	Clawdite	54	30	2014-12-20T16:57:46.171000Z	2014-12-20T21:36:42.199000Z
Besalisk	amphibian	sentient	178	75	yellow	none	brown	besalisk	55	31	2014-12-20T17:28:28.821000Z	2014-12-20T21:36:42.200000Z
Kaminoan	amphibian	sentient	220	80	black	none	grey, blue	Kaminoan	10	32	2014-12-20T17:31:24.838000Z	2014-12-20T21:36:42.202000Z
Skakoan	mammal	sentient	unknown	unknown	unknown	none	grey, green	Skakoan	56	33	2014-12-20T17:53:54.515000Z	2014-12-20T21:36:42.204000Z
Muun	mammal	sentient	190	100	black	none	grey, white	Muun	57	34	2014-12-20T17:58:19.088000Z	2014-12-20T21:36:42.207000Z
Togruta	mammal	sentient	180	94	red, orange, yellow, green, blue, black	none	red, white, orange, yellow, green, blue	Togruti	58	35	2014-12-20T18:44:03.246000Z	2014-12-20T21:36:42.209000Z
Kaleesh	reptile	sentient	170	80	yellow	none	brown, orange, tan	Kaleesh	59	36	2014-12-20T19:45:42.537000Z	2014-12-20T21:36:42.210000Z
Pau´an	mammal	sentient	190	700	black	none	grey	Utapese	12	37	2014-12-20T20:35:06.777000Z	2014-12-20T21:36:42.212000Z
\.


--
-- Data for Name: species_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.species_people (codigo_specie, codigo_people) FROM stdin;
2	2
2	3
2	8
3	13
4	15
5	16
6	20
2	23
7	24
8	27
9	30
10	31
11	33
12	36
12	37
12	38
13	40
14	41
22	44
15	45
15	46
16	47
17	48
18	49
19	50
20	52
21	53
22	54
23	55
24	56
25	57
26	58
27	59
28	63
29	64
29	65
1	66
1	67
1	68
30	70
31	71
32	72
32	73
1	74
33	76
34	77
35	78
36	79
3	80
37	83
\.


--
-- Data for Name: starships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starships (name, model, starship_class, manufacturer, cost_in_credits, length, crew, passengers, max_atmosphering_speed, hyperdrive_rating, mglt, cargo_capacity, consumables, codigo, created, edited) FROM stdin;
CR90 corvette	CR90 corvette	corvette	Corellian Engineering Corporation	3500000	150	30-165	600	950	2.0	60	3000000	1 year	2	2014-12-10T14:20:33.369000Z	2014-12-20T21:23:49.867000Z
Star Destroyer	Imperial I-class Star Destroyer	Star Destroyer	Kuat Drive Yards	150000000	1,600	47,060	n/a	975	2.0	60	36000000	2 years	3	2014-12-10T15:08:19.848000Z	2014-12-20T21:23:49.870000Z
Sentinel-class landing craft	Sentinel-class landing craft	landing craft	Sienar Fleet Systems, Cyngus Spaceworks	240000	38	5	75	1000	1.0	70	180000	1 month	5	2014-12-10T15:48:00.586000Z	2014-12-20T21:23:49.873000Z
Death Star	DS-1 Orbital Battle Station	Deep Space Mobile Battlestation	Imperial Department of Military Research, Sienar Fleet Systems	1000000000000	120000	342,953	843,342	n/a	4.0	10	1000000000000	3 years	9	2014-12-10T16:36:50.509000Z	2014-12-20T21:26:24.783000Z
Millennium Falcon	YT-1300 light freighter	Light freighter	Corellian Engineering Corporation	100000	34.37	4	6	1050	0.5	75	100000	2 months	10	2014-12-10T16:59:45.094000Z	2014-12-20T21:23:49.880000Z
Y-wing	BTL Y-wing	assault starfighter	Koensayr Manufacturing	134999	14	2	0	1000km	1.0	80	110	1 week	11	2014-12-12T11:00:39.817000Z	2014-12-20T21:23:49.883000Z
X-wing	T-65 X-wing	Starfighter	Incom Corporation	149999	12.5	1	0	1050	1.0	100	110	1 week	12	2014-12-12T11:19:05.340000Z	2014-12-20T21:23:49.886000Z
TIE Advanced x1	Twin Ion Engine Advanced x1	Starfighter	Sienar Fleet Systems	unknown	9.2	1	0	1200	1.0	105	150	5 days	13	2014-12-12T11:21:32.991000Z	2014-12-20T21:23:49.889000Z
Executor	Executor-class star dreadnought	Star dreadnought	Kuat Drive Yards, Fondor Shipyards	1143350000	19000	279,144	38000	n/a	2.0	40	250000000	6 years	15	2014-12-15T12:31:42.547000Z	2014-12-20T21:23:49.893000Z
Rebel transport	GR-75 medium transport	Medium transport	Gallofree Yards, Inc.	unknown	90	6	90	650	4.0	20	19000000	6 months	17	2014-12-15T12:34:52.264000Z	2014-12-20T21:23:49.895000Z
Slave 1	Firespray-31-class patrol and attack	Patrol craft	Kuat Systems Engineering	unknown	21.5	1	6	1000	3.0	70	70000	1 month	21	2014-12-15T13:00:56.332000Z	2014-12-20T21:23:49.897000Z
Imperial shuttle	Lambda-class T-4a shuttle	Armed government transport	Sienar Fleet Systems	240000	20	6	20	850	1.0	50	80000	2 months	22	2014-12-15T13:04:47.235000Z	2014-12-20T21:23:49.900000Z
EF76 Nebulon-B escort frigate	EF76 Nebulon-B escort frigate	Escort ship	Kuat Drive Yards	8500000	300	854	75	800	2.0	40	6000000	2 years	23	2014-12-15T13:06:30.813000Z	2014-12-20T21:23:49.902000Z
Calamari Cruiser	MC80 Liberty type Star Cruiser	Star Cruiser	Mon Calamari shipyards	104000000	1200	5400	1200	n/a	1.0	60	unknown	2 years	27	2014-12-18T10:54:57.804000Z	2014-12-20T21:23:49.904000Z
A-wing	RZ-1 A-wing Interceptor	Starfighter	Alliance Underground Engineering, Incom Corporation	175000	9.6	1	0	1300	1.0	120	40	1 week	28	2014-12-18T11:16:34.542000Z	2014-12-20T21:23:49.907000Z
B-wing	A/SF-01 B-wing starfighter	Assault Starfighter	Slayn & Korpil	220000	16.9	1	0	950	2.0	91	45	1 week	29	2014-12-18T11:18:04.763000Z	2014-12-20T21:23:49.909000Z
Republic Cruiser	Consular-class cruiser	Space cruiser	Corellian Engineering Corporation	unknown	115	9	16	900	2.0	unknown	unknown	unknown	31	2014-12-19T17:01:31.488000Z	2014-12-20T21:23:49.912000Z
Droid control ship	Lucrehulk-class Droid Control Ship	Droid control ship	Hoersch-Kessel Drive, Inc.	unknown	3170	175	139000	n/a	2.0	unknown	4000000000	500 days	32	2014-12-19T17:04:06.323000Z	2014-12-20T21:23:49.915000Z
Naboo fighter	N-1 starfighter	Starfighter	Theed Palace Space Vessel Engineering Corps	200000	11	1	0	1100	1.0	unknown	65	7 days	39	2014-12-19T17:39:17.582000Z	2014-12-20T21:23:49.917000Z
Naboo Royal Starship	J-type 327 Nubian royal starship	yacht	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	unknown	76	8	unknown	920	1.8	unknown	unknown	unknown	40	2014-12-19T17:45:03.506000Z	2014-12-20T21:23:49.919000Z
Scimitar	Star Courier	Space Transport	Republic Sienar Systems	55000000	26.5	1	6	1180	1.5	unknown	2500000	30 days	41	2014-12-20T09:39:56.116000Z	2014-12-20T21:23:49.922000Z
J-type diplomatic barge	J-type diplomatic barge	Diplomatic barge	Theed Palace Space Vessel Engineering Corps, Nubia Star Drives	2000000	39	5	10	2000	0.7	unknown	unknown	1 year	43	2014-12-20T11:05:51.237000Z	2014-12-20T21:23:49.925000Z
AA-9 Coruscant freighter	Botajef AA-9 Freighter-Liner	freighter	Botajef Shipyards	unknown	390	unknown	30000	unknown	unknown	unknown	unknown	unknown	47	2014-12-20T17:24:23.509000Z	2014-12-20T21:23:49.928000Z
Jedi starfighter	Delta-7 Aethersprite-class interceptor	Starfighter	Kuat Systems Engineering	180000	8	1	0	1150	1.0	unknown	60	7 days	48	2014-12-20T17:35:23.906000Z	2014-12-20T21:23:49.930000Z
H-type Nubian yacht	H-type Nubian yacht	yacht	Theed Palace Space Vessel Engineering Corps	unknown	47.9	4	unknown	8000	0.9	unknown	unknown	unknown	49	2014-12-20T17:46:46.847000Z	2014-12-20T21:23:49.932000Z
Republic Assault ship	Acclamator I-class assault ship	assault ship	Rothana Heavy Engineering	unknown	752	700	16000	unknown	0.6	unknown	11250000	2 years	52	2014-12-20T18:08:42.926000Z	2014-12-20T21:23:49.935000Z
Solar Sailer	Punworcca 116-class interstellar sloop	yacht	Huppla Pasa Tisc Shipwrights Collective	35700	15.2	3	11	1600	1.5	unknown	240	7 days	58	2014-12-20T18:37:56.969000Z	2014-12-20T21:23:49.937000Z
Trade Federation cruiser	Providence-class carrier/destroyer	capital ship	Rendili StarDrive, Free Dac Volunteers Engineering corps.	125000000	1088	600	48247	1050	1.5	unknown	50000000	4 years	59	2014-12-20T19:40:21.902000Z	2014-12-20T21:23:49.941000Z
Theta-class T-2c shuttle	Theta-class T-2c shuttle	transport	Cygnus Spaceworks	1000000	18.5	5	16	2000	1.0	unknown	50000	56 days	61	2014-12-20T19:48:40.409000Z	2014-12-20T21:23:49.944000Z
Republic attack cruiser	Senator-class Star Destroyer	star destroyer	Kuat Drive Yards, Allanteen Six shipyards	59000000	1137	7400	2000	975	1.0	unknown	20000000	2 years	63	2014-12-20T19:52:56.232000Z	2014-12-20T21:23:49.946000Z
Naboo star skiff	J-type star skiff	yacht	Theed Palace Space Vessel Engineering Corps/Nubia Star Drives, Incorporated	unknown	29.2	3	3	1050	0.5	unknown	unknown	unknown	64	2014-12-20T19:55:15.396000Z	2014-12-20T21:23:49.948000Z
Jedi Interceptor	Eta-2 Actis-class light interceptor	starfighter	Kuat Systems Engineering	320000	5.47	1	0	1500	1.0	unknown	60	2 days	65	2014-12-20T19:56:57.468000Z	2014-12-20T21:23:49.951000Z
arc-170	Aggressive Reconnaissance-170 starfighte	starfighter	Incom Corporation, Subpro Corporation	155000	14.5	3	0	1000	1.0	100	110	5 days	66	2014-12-20T20:03:48.603000Z	2014-12-20T21:23:49.953000Z
Banking clan frigte	Munificent-class star frigate	cruiser	Hoersch-Kessel Drive, Inc, Gwori Revolutionary Industries	57000000	825	200	unknown	unknown	1.0	unknown	40000000	2 years	68	2014-12-20T20:07:11.538000Z	2014-12-20T21:23:49.956000Z
Belbullab-22 starfighter	Belbullab-22 starfighter	starfighter	Feethan Ottraw Scalable Assemblies	168000	6.71	1	0	1100	6	unknown	140	7 days	74	2014-12-20T20:38:05.031000Z	2014-12-20T21:23:49.959000Z
V-wing	Alpha-3 Nimbus-class V-wing starfighter	starfighter	Kuat Systems Engineering	102500	7.9	1	0	1050	1.0	unknown	60	15 hours	75	2014-12-20T20:43:04.349000Z	2014-12-20T21:23:49.961000Z
\.


--
-- Data for Name: starships_films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starships_films (codigo_starship, codigo_film) FROM stdin;
2	1
3	1
5	1
9	1
10	1
11	1
12	1
13	1
3	2
10	2
11	2
12	2
15	2
17	2
21	2
22	2
23	2
2	3
3	3
10	3
11	3
12	3
15	3
17	3
22	3
23	3
27	3
28	3
29	3
31	4
32	4
39	4
40	4
41	4
21	5
32	5
39	5
43	5
47	5
48	5
49	5
52	5
58	5
2	6
32	6
48	6
59	6
61	6
63	6
64	6
65	6
66	6
68	6
74	6
75	6
\.


--
-- Data for Name: starships_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starships_people (codigo_starship, codigo_people) FROM stdin;
12	1
22	1
13	4
12	9
48	10
59	10
64	10
65	10
74	10
39	11
59	11
65	11
10	13
22	13
10	14
22	14
12	18
12	19
21	22
10	25
28	29
10	31
39	35
49	35
64	35
40	39
41	44
48	58
39	60
74	79
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, usuario, password, codigo_people) FROM stdin;
73	r2d2	123456	3
74	Chiwi	123456	13
75	ObiWanKenobi	ObiWanKe	10
71	Leia	123456	5
72	Luke	123456	1
\.


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (name, model, vehicle_class, manufacturer, length, cost_in_credits, crew, passengers, max_atmosphering_speed, cargo_capacity, consumables, codigo, created, edited) FROM stdin;
Sand Crawler	Digger Crawler	wheeled	Corellia Mining Corporation	36.8 	150000	46	30	30	50000	2 months	4	2014-12-10T15:36:25.724000Z	2014-12-20T21:30:21.661000Z
T-16 skyhopper	T-16 skyhopper	repulsorcraft	Incom Corporation	10.4 	14500	1	1	1200	50	0	6	2014-12-10T16:01:52.434000Z	2014-12-20T21:30:21.665000Z
X-34 landspeeder	X-34 landspeeder	repulsorcraft	SoroSuub Corporation	3.4 	10550	1	1	250	5	unknown	7	2014-12-10T16:13:52.586000Z	2014-12-20T21:30:21.668000Z
TIE/LN starfighter	Twin Ion Engine/Ln Starfighter	starfighter	Sienar Fleet Systems	6.4	unknown	1	0	1200	65	2 days	8	2014-12-10T16:33:52.860000Z	2014-12-20T21:30:21.670000Z
Snowspeeder	t-47 airspeeder	airspeeder	Incom corporation	4.5	unknown	2	0	650	10	none	14	2014-12-15T12:22:12Z	2014-12-20T21:30:21.672000Z
TIE bomber	TIE/sa bomber	space/planetary bomber	Sienar Fleet Systems	7.8	unknown	1	0	850	none	2 days	16	2014-12-15T12:33:15.838000Z	2014-12-20T21:30:21.675000Z
AT-AT	All Terrain Armored Transport	assault walker	Kuat Drive Yards, Imperial Department of Military Research	20	unknown	5	40	60	1000	unknown	18	2014-12-15T12:38:25.937000Z	2014-12-20T21:30:21.677000Z
AT-ST	All Terrain Scout Transport	walker	Kuat Drive Yards, Imperial Department of Military Research	2	unknown	2	0	90	200	none	19	2014-12-15T12:46:42.384000Z	2014-12-20T21:30:21.679000Z
Storm IV Twin-Pod cloud car	Storm IV Twin-Pod	repulsorcraft	Bespin Motors	7	75000	2	0	1500	10	1 day	20	2014-12-15T12:58:50.530000Z	2014-12-20T21:30:21.681000Z
Sail barge	Modified Luxury Sail Barge	sail barge	Ubrikkian Industries Custom Vehicle Division	30	285000	26	500	100	2000000	Live food tanks	24	2014-12-18T10:44:14.217000Z	2014-12-20T21:30:21.684000Z
Bantha-II cargo skiff	Bantha-II	repulsorcraft cargo skiff	Ubrikkian Industries	9.5	8000	5	16	250	135000	1 day	25	2014-12-18T10:48:03.208000Z	2014-12-20T21:30:21.688000Z
TIE/IN interceptor	Twin Ion Engine Interceptor	starfighter	Sienar Fleet Systems	9.6	unknown	1	0	1250	75	2 days	26	2014-12-18T10:50:28.225000Z	2014-12-20T21:30:21.691000Z
Imperial Speeder Bike	74-Z speeder bike	speeder	Aratech Repulsor Company	3	8000	1	1	360	4	1 day	30	2014-12-18T11:20:04.625000Z	2014-12-20T21:30:21.693000Z
Vulture Droid	Vulture-class droid starfighter	starfighter	Haor Chall Engineering, Baktoid Armor Workshop	3.5	unknown	0	0	1200	0	none	33	2014-12-19T17:09:53.584000Z	2014-12-20T21:30:21.697000Z
Multi-Troop Transport	Multi-Troop Transport	repulsorcraft	Baktoid Armor Workshop	31	138000	4	112	35	12000	unknown	34	2014-12-19T17:12:04.400000Z	2014-12-20T21:30:21.700000Z
Armored Assault Tank	Armoured Assault Tank	repulsorcraft	Baktoid Armor Workshop	9.75	unknown	4	6	55	unknown	unknown	35	2014-12-19T17:13:29.799000Z	2014-12-20T21:30:21.703000Z
Single Trooper Aerial Platform	Single Trooper Aerial Platform	repulsorcraft	Baktoid Armor Workshop	2	2500	1	0	400	none	none	36	2014-12-19T17:15:09.511000Z	2014-12-20T21:30:21.705000Z
C-9979 landing craft	C-9979 landing craft	landing craft	Haor Chall Engineering	210	200000	140	284	587	1800000	1 day	37	2014-12-19T17:20:36.373000Z	2014-12-20T21:30:21.707000Z
Tribubble bongo	Tribubble bongo	submarine	Otoh Gunga Bongameken Cooperative	15	unknown	1	2	85	1600	unknown	38	2014-12-19T17:37:37.924000Z	2014-12-20T21:30:21.710000Z
Sith speeder	FC-20 speeder bike	speeder	Razalon	1.5	4000	1	0	180	2	unknown	42	2014-12-20T10:09:56.095000Z	2014-12-20T21:30:21.712000Z
Zephyr-G swoop bike	Zephyr-G swoop bike	repulsorcraft	Mobquet Swoops and Speeders	3.68	5750	1	1	350	200	none	44	2014-12-20T16:24:16.026000Z	2014-12-20T21:30:21.714000Z
Koro-2 Exodrive airspeeder	Koro-2 Exodrive airspeeder	airspeeder	Desler Gizh Outworld Mobility Corporation	6.6	unknown	1	1	800	80	unknown	45	2014-12-20T17:17:33.526000Z	2014-12-20T21:30:21.716000Z
XJ-6 airspeeder	XJ-6 airspeeder	airspeeder	Narglatch AirTech prefabricated kit	6.23	unknown	1	1	720	unknown	unknown	46	2014-12-20T17:19:19.991000Z	2014-12-20T21:30:21.719000Z
LAAT/i	Low Altitude Assault Transport/infrantry	gunship	Rothana Heavy Engineering	17.4	unknown	6	30	620	170	unknown	50	2014-12-20T18:01:21.014000Z	2014-12-20T21:30:21.723000Z
LAAT/c	Low Altitude Assault Transport/carrier	gunship	Rothana Heavy Engineering	28.82	unknown	1	0	620	40000	unknown	51	2014-12-20T18:02:46.802000Z	2014-12-20T21:30:21.725000Z
AT-TE	All Terrain Tactical Enforcer	walker	Rothana Heavy Engineering, Kuat Drive Yards	13.2	unknown	6	36	60	10000	21 days	53	2014-12-20T18:10:07.560000Z	2014-12-20T21:30:21.728000Z
SPHA	Self-Propelled Heavy Artillery	walker	Rothana Heavy Engineering	140	unknown	25	30	35	500	7 days	54	2014-12-20T18:12:32.315000Z	2014-12-20T21:30:21.731000Z
Flitknot speeder	Flitknot speeder	speeder	Huppla Pasa Tisc Shipwrights Collective	2	8000	1	0	634	unknown	unknown	55	2014-12-20T18:15:20.312000Z	2014-12-20T21:30:21.735000Z
Neimoidian shuttle	Sheathipede-class transport shuttle	transport	Haor Chall Engineering	20	unknown	2	6	880	1000	7 days	56	2014-12-20T18:25:44.912000Z	2014-12-20T21:30:21.739000Z
Geonosian starfighter	Nantex-class territorial defense	starfighter	Huppla Pasa Tisc Shipwrights Collective	9.8	unknown	1	0	20000	unknown	unknown	57	2014-12-20T18:34:12.541000Z	2014-12-20T21:30:21.742000Z
Tsmeu-6 personal wheel bike	Tsmeu-6 personal wheel bike	wheeled walker	Z-Gomot Ternbuell Guppat Corporation	3.5	15000	1	1	330	10	none	60	2014-12-20T19:43:54.870000Z	2014-12-20T21:30:21.745000Z
Emergency Firespeeder	Fire suppression speeder	fire suppression ship	unknown	unknown	unknown	2	unknown	unknown	unknown	unknown	62	2014-12-20T19:50:58.559000Z	2014-12-20T21:30:21.749000Z
Droid tri-fighter	tri-fighter	droid starfighter	Colla Designs, Phlac-Arphocc Automata Industries	5.4	20000	1	0	1180	0	none	67	2014-12-20T20:05:19.992000Z	2014-12-20T21:30:21.752000Z
Oevvaor jet catamaran	Oevvaor jet catamaran	airspeeder	Appazanna Engineering Works	15.1	12125	2	2	420	50	3 days	69	2014-12-20T20:20:53.931000Z	2014-12-20T21:30:21.756000Z
Raddaugh Gnasp fluttercraft	Raddaugh Gnasp fluttercraft	air speeder	Appazanna Engineering Works	7	14750	2	0	310	20	none	70	2014-12-20T20:21:55.648000Z	2014-12-20T21:30:21.759000Z
Clone turbo tank	HAVw A6 Juggernaut	wheeled walker	Kuat Drive Yards	49.4	350000	20	300	160	30000	20 days	71	2014-12-20T20:24:45.587000Z	2014-12-20T21:30:21.762000Z
Corporate Alliance tank droid	NR-N99 Persuader-class droid enforcer	droid tank	Techno Union	10.96	49000	0	4	100	none	none	72	2014-12-20T20:26:55.522000Z	2014-12-20T21:30:21.765000Z
Droid gunship	HMP droid gunship	airspeeder	Baktoid Fleet Ordnance, Haor Chall Engineering	12.3	60000	0	0	820	0	none	73	2014-12-20T20:32:05.687000Z	2014-12-20T21:30:21.768000Z
AT-RT	All Terrain Recon Transport	walker	Kuat Drive Yards	3.2	40000	1	0	90	20	1 day	76	2014-12-20T20:47:49.189000Z	2014-12-20T21:30:21.772000Z
\.


--
-- Data for Name: vehicles_films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles_films (codigo_vehicle, codigo_film) FROM stdin;
4	1
6	1
7	1
8	1
8	2
14	2
16	2
18	2
19	2
20	2
8	3
16	3
18	3
19	3
24	3
25	3
26	3
30	3
33	4
34	4
35	4
36	4
37	4
38	4
42	4
4	5
44	5
45	5
46	5
50	5
51	5
53	5
54	5
55	5
56	5
57	5
33	6
50	6
53	6
56	6
60	6
62	6
67	6
69	6
70	6
71	6
72	6
73	6
76	6
\.


--
-- Data for Name: vehicles_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles_people (codigo_vehicle, codigo_people) FROM stdin;
14	1
30	1
30	5
38	10
44	11
46	11
19	13
14	18
38	32
42	44
55	67
45	70
60	79
\.


--
-- Name: mails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mails_id_seq', 1, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- Name: films_people films_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_people
    ADD CONSTRAINT films_people_pkey PRIMARY KEY (codigo_film, codigo_people);


--
-- Name: films films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey PRIMARY KEY (codigo);


--
-- Name: films_planets films_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_planets
    ADD CONSTRAINT films_planet_pkey PRIMARY KEY (codigo_film, codigo_planet);


--
-- Name: mails mails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT mails_pkey PRIMARY KEY (id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (codigo);


--
-- Name: planets planets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planets
    ADD CONSTRAINT planets_pkey PRIMARY KEY (codigo);


--
-- Name: species_people species_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species_people
    ADD CONSTRAINT species_people_pkey PRIMARY KEY (codigo_specie, codigo_people);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (codigo);


--
-- Name: starships_films starships_films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_films
    ADD CONSTRAINT starships_films_pkey PRIMARY KEY (codigo_starship, codigo_film);


--
-- Name: starships_people starships_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_people
    ADD CONSTRAINT starships_people_pkey PRIMARY KEY (codigo_starship, codigo_people);


--
-- Name: starships starships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships
    ADD CONSTRAINT starships_pkey PRIMARY KEY (codigo);


--
-- Name: usuarios usuarios_codigo_people_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_codigo_people_key UNIQUE (codigo_people);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: vehicles_films vehicle_films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_films
    ADD CONSTRAINT vehicle_films_pkey PRIMARY KEY (codigo_vehicle, codigo_film);


--
-- Name: vehicles_people vehicle_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_people
    ADD CONSTRAINT vehicle_people_pkey PRIMARY KEY (codigo_vehicle, codigo_people);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (codigo);


--
-- Name: films_people films_peolple_fk_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_people
    ADD CONSTRAINT films_peolple_fk_film FOREIGN KEY (codigo_film) REFERENCES public.films(codigo);


--
-- Name: films_people films_peolple_fk_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_people
    ADD CONSTRAINT films_peolple_fk_people FOREIGN KEY (codigo_people) REFERENCES public.people(codigo);


--
-- Name: films_planets films_planets_fk_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_planets
    ADD CONSTRAINT films_planets_fk_film FOREIGN KEY (codigo_film) REFERENCES public.films(codigo);


--
-- Name: films_planets films_planets_fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films_planets
    ADD CONSTRAINT films_planets_fk_planet FOREIGN KEY (codigo_planet) REFERENCES public.planets(codigo);


--
-- Name: mails fk_mails_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mails
    ADD CONSTRAINT fk_mails_usuarios FOREIGN KEY (id_usuarios) REFERENCES public.usuarios(id);


--
-- Name: usuarios fk_usuarios_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_people FOREIGN KEY (codigo_people) REFERENCES public.people(codigo);


--
-- Name: people people_fk_planet_homeworld; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_fk_planet_homeworld FOREIGN KEY (homeworld) REFERENCES public.planets(codigo);


--
-- Name: species species_fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_fk_planet FOREIGN KEY (homeworld) REFERENCES public.planets(codigo);


--
-- Name: species_people species_people_fk_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species_people
    ADD CONSTRAINT species_people_fk_people FOREIGN KEY (codigo_people) REFERENCES public.people(codigo);


--
-- Name: species_people species_people_fk_specie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.species_people
    ADD CONSTRAINT species_people_fk_specie FOREIGN KEY (codigo_specie) REFERENCES public.species(codigo);


--
-- Name: starships_films starships_films_fk_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_films
    ADD CONSTRAINT starships_films_fk_film FOREIGN KEY (codigo_film) REFERENCES public.films(codigo);


--
-- Name: starships_films starships_films_fk_starship; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_films
    ADD CONSTRAINT starships_films_fk_starship FOREIGN KEY (codigo_starship) REFERENCES public.starships(codigo);


--
-- Name: starships_people starships_people_fk_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_people
    ADD CONSTRAINT starships_people_fk_people FOREIGN KEY (codigo_people) REFERENCES public.people(codigo);


--
-- Name: starships_people starships_people_fk_starship; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.starships_people
    ADD CONSTRAINT starships_people_fk_starship FOREIGN KEY (codigo_starship) REFERENCES public.starships(codigo);


--
-- Name: vehicles_films vehicles_films_fk_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_films
    ADD CONSTRAINT vehicles_films_fk_film FOREIGN KEY (codigo_film) REFERENCES public.films(codigo);


--
-- Name: vehicles_films vehicles_films_fk_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_films
    ADD CONSTRAINT vehicles_films_fk_vehiculo FOREIGN KEY (codigo_vehicle) REFERENCES public.vehicles(codigo);


--
-- Name: vehicles_people vehicles_people_fk_people; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_people
    ADD CONSTRAINT vehicles_people_fk_people FOREIGN KEY (codigo_people) REFERENCES public.people(codigo);


--
-- Name: vehicles_people vehicles_people_fk_vehiculo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles_people
    ADD CONSTRAINT vehicles_people_fk_vehiculo FOREIGN KEY (codigo_vehicle) REFERENCES public.vehicles(codigo);


--
-- PostgreSQL database dump complete
--

