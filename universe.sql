--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean NOT NULL,
    no_of_stars_in_thousand_million integer,
    no_of_planet_in_billion integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30),
    size_compare integer,
    no_of_moons integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30),
    has_life boolean,
    distance_from_earth numeric(5,1),
    no_of_moons integer,
    no_of_rings integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    times_than_earth integer,
    times_than_sun integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: years; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.years (
    years_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    light_year integer,
    galaxy_id integer
);


ALTER TABLE public.years OWNER TO freecodecamp;

--
-- Name: years_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.years_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.years_id_seq OWNER TO freecodecamp;

--
-- Name: years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.years_id_seq OWNED BY public.years.years_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: years years_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.years ALTER COLUMN years_id SET DEFAULT nextval('public.years_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'include our solar system', false, 100, 900);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'bigger than milky way', false, 300, 1000);
INSERT INTO public.galaxy VALUES (3, 'virgo', 'giant elliptical galaxy with black hole in middle', false, 250, 700);
INSERT INTO public.galaxy VALUES (4, 'maffei 1 & 2', 'closest galaxy to milky way', false, 350, 100);
INSERT INTO public.galaxy VALUES (5, 'cygnus A', 'giant elliptical galaxy with black hole in middle', false, 250, 750);
INSERT INTO public.galaxy VALUES (6, 'canis major dwarf', 'constellation in canis cluster', false, 500, 1000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 9, 'moon', 100, 1);
INSERT INTO public.moon VALUES (2, 13, 'lo', 105, 80);
INSERT INTO public.moon VALUES (3, 13, 'ganymede', 145, 80);
INSERT INTO public.moon VALUES (4, 13, 'europa', 90, 80);
INSERT INTO public.moon VALUES (5, 13, 'callisto', NULL, 80);
INSERT INTO public.moon VALUES (6, 13, 'amalthea', NULL, 80);
INSERT INTO public.moon VALUES (7, 13, 'adrastea', NULL, 80);
INSERT INTO public.moon VALUES (8, 9, 'moon', 100, 1);
INSERT INTO public.moon VALUES (9, 13, 'lo', 105, 80);
INSERT INTO public.moon VALUES (10, 13, 'ganymede', 145, 80);
INSERT INTO public.moon VALUES (11, 13, 'europa', 90, 80);
INSERT INTO public.moon VALUES (12, 13, 'callisto', NULL, 80);
INSERT INTO public.moon VALUES (13, 13, 'amalthea', NULL, 80);
INSERT INTO public.moon VALUES (14, 13, 'adrastea', NULL, 80);
INSERT INTO public.moon VALUES (15, 14, 'titan', 50, 83);
INSERT INTO public.moon VALUES (16, 14, 'enceladus', 30, 83);
INSERT INTO public.moon VALUES (17, 14, 'rhea', 24, 83);
INSERT INTO public.moon VALUES (18, 14, 'lapetus', NULL, 83);
INSERT INTO public.moon VALUES (19, 14, 'dione', NULL, 83);
INSERT INTO public.moon VALUES (20, 14, 'tethys', NULL, 83);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 3, 'earth', true, 0.0, 1, 0);
INSERT INTO public.planet VALUES (10, 3, 'mercury', false, 129.9, 0, 0);
INSERT INTO public.planet VALUES (11, 3, 'venus', false, 256.1, 0, 0);
INSERT INTO public.planet VALUES (12, 3, 'mars', false, 54.6, 2, 0);
INSERT INTO public.planet VALUES (13, 3, 'jupiter', false, 593.4, 80, 0);
INSERT INTO public.planet VALUES (14, 3, 'saturn', false, 1378.2, 83, 7);
INSERT INTO public.planet VALUES (15, 3, 'neptune', false, 4331.9, 14, 2);
INSERT INTO public.planet VALUES (16, 3, 'uranus', false, 2821.4, 27, 2);
INSERT INTO public.planet VALUES (17, 3, 'pluto', false, 5140.3, 5, 0);
INSERT INTO public.planet VALUES (18, 3, 'kepler-452b', false, NULL, 0, 0);
INSERT INTO public.planet VALUES (19, 6, 'j1407', false, 433.3, 5, 30);
INSERT INTO public.planet VALUES (20, 3, 'arion', false, 9342.4, 0, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 1, 'sun', 'star of solar system', 100, 1);
INSERT INTO public.star VALUES (4, 1, 'sirius', 'mixed of hydro-helim', 3500, 2);
INSERT INTO public.star VALUES (5, 1, 'pollux', '2x of sirius', 7000, 4);
INSERT INTO public.star VALUES (6, 1, 'arcturus', 'red giant body', 10000, 7);
INSERT INTO public.star VALUES (7, 1, 'aldebaran', 'brightest body of galaxy', 35000, 22);
INSERT INTO public.star VALUES (8, 1, 'rigel', 'a white-giant sun', 70000, 1000);


--
-- Data for Name: years; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.years VALUES (1, 'milky way', 13, 13, 1);
INSERT INTO public.years VALUES (2, 'Andromeda', 10, 10, 2);
INSERT INTO public.years VALUES (3, 'virgo', 17, 17, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.years_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: years years_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT years_id_key UNIQUE (years_id);


--
-- Name: years years_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT years_pkey PRIMARY KEY (years_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: years years_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT years_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

