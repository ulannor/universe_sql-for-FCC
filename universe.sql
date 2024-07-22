--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    type text,
    mass numeric(10,2),
    is_visible boolean DEFAULT true NOT NULL,
    estimated_stars integer NOT NULL
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
    name character varying(255) NOT NULL,
    is_inhabited boolean DEFAULT false NOT NULL,
    planet_id integer,
    discovered_year integer DEFAULT 1900
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
    name character varying(255) NOT NULL,
    type character varying(50),
    population integer,
    has_water boolean DEFAULT false NOT NULL,
    star_id integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(255) NOT NULL,
    purpose text,
    operational boolean DEFAULT true NOT NULL,
    moon_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(50),
    temperature integer NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    galaxy_id integer
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1.50, true, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1.90, true, 1200000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 0.50, true, 400000000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 0.80, false, 300000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 0.60, true, 300000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 0.70, true, 350000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 1, 1900);
INSERT INTO public.moon VALUES (2, 'Deimos', false, 2, 1900);
INSERT INTO public.moon VALUES (3, 'Phobos', false, 2, 1900);
INSERT INTO public.moon VALUES (4, 'Io', false, 4, 1900);
INSERT INTO public.moon VALUES (5, 'Europa', false, 4, 1900);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 4, 1900);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 4, 1900);
INSERT INTO public.moon VALUES (8, 'Titan', false, 5, 1900);
INSERT INTO public.moon VALUES (9, 'Rhea', false, 5, 1900);
INSERT INTO public.moon VALUES (10, 'Iapetus', false, 5, 1900);
INSERT INTO public.moon VALUES (11, 'Miranda', false, 6, 1900);
INSERT INTO public.moon VALUES (12, 'Ariel', false, 6, 1900);
INSERT INTO public.moon VALUES (13, 'Umbriel', false, 6, 1900);
INSERT INTO public.moon VALUES (14, 'Titania', false, 6, 1900);
INSERT INTO public.moon VALUES (15, 'Oberon', false, 6, 1900);
INSERT INTO public.moon VALUES (16, 'Triton', false, 7, 1900);
INSERT INTO public.moon VALUES (17, 'Nereid', false, 7, 1900);
INSERT INTO public.moon VALUES (18, 'Charon', false, 8, 1900);
INSERT INTO public.moon VALUES (19, 'Dysnomia', false, 13, 1900);
INSERT INTO public.moon VALUES (20, 'Hi’iaka', false, 14, 1900);
INSERT INTO public.moon VALUES (21, 'Namaka', false, 14, 1900);
INSERT INTO public.moon VALUES (22, 'Kerberos', false, 15, 1900);
INSERT INTO public.moon VALUES (23, 'Styx', false, 15, 1900);
INSERT INTO public.moon VALUES (24, 'Nix', false, 15, 1900);
INSERT INTO public.moon VALUES (25, 'Hydra', false, 15, 1900);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 780000, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'Gas Giant', 0, false, 2);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas Giant', 0, false, 2);
INSERT INTO public.planet VALUES (6, 'Uranus', 'Ice Giant', 0, false, 3);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 0, false, 3);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 0, false, 4);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 'Exoplanet', 0, true, 5);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Exoplanet', 0, true, 5);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'Exoplanet', 0, false, 6);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'Exoplanet', 0, false, 6);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 'Exoplanet', 0, true, 7);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1e', 'Exoplanet', 0, true, 7);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1f', 'Exoplanet', 0, true, 8);
INSERT INTO public.planet VALUES (16, 'Ogle-2016-BLG-1195Lb', 'Exoplanet', 0, false, 9);
INSERT INTO public.planet VALUES (17, 'LHS 1140 b', 'Exoplanet', 0, true, 10);
INSERT INTO public.planet VALUES (18, 'K2-18b', 'Exoplanet', 0, true, 11);
INSERT INTO public.planet VALUES (19, 'Teegarden b', 'Exoplanet', 0, false, 12);
INSERT INTO public.planet VALUES (20, 'Wolf 1061c', 'Exoplanet', 0, false, 12);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Lunar Reconnaissance Orbiter', 'Lunar research', true, 1);
INSERT INTO public.satellite VALUES (2, 'Mars Odyssey', 'Mars research', true, 2);
INSERT INTO public.satellite VALUES (3, 'Mars Reconnaissance Orbiter', 'Mars research', true, 2);
INSERT INTO public.satellite VALUES (4, 'Juno', 'Jupiter research', true, 4);
INSERT INTO public.satellite VALUES (5, 'Cassini', 'Saturn system research', false, 5);
INSERT INTO public.satellite VALUES (6, 'Voyager 1', 'Outer solar system exploration', false, 6);
INSERT INTO public.satellite VALUES (7, 'Voyager 2', 'Outer solar system exploration', false, 6);
INSERT INTO public.satellite VALUES (8, 'New Horizons', 'Kuiper belt and beyond', true, 18);
INSERT INTO public.satellite VALUES (9, 'Europa Clipper', 'Europa research', true, 4);
INSERT INTO public.satellite VALUES (10, 'James Webb Space Telescope', 'Deep space observation', true, 1);
INSERT INTO public.satellite VALUES (11, 'Hubble Space Telescope', 'Deep space observation', true, 1);
INSERT INTO public.satellite VALUES (12, 'Parker Solar Probe', 'Sun research', true, 1);
INSERT INTO public.satellite VALUES (13, 'BepiColombo', 'Mercury research', true, 8);
INSERT INTO public.satellite VALUES (14, 'Chandrayaan-2', 'Lunar research', true, 1);
INSERT INTO public.satellite VALUES (15, 'Artemis 1', 'Lunar research', true, 1);
INSERT INTO public.satellite VALUES (16, 'Hayabusa2', 'Asteroid research', true, 1);
INSERT INTO public.satellite VALUES (17, 'OSIRIS-REx', 'Asteroid research', true, 1);
INSERT INTO public.satellite VALUES (18, 'Tianwen-1', 'Mars research', true, 2);
INSERT INTO public.satellite VALUES (19, 'Hope Probe', 'Mars atmosphere research', true, 2);
INSERT INTO public.satellite VALUES (20, 'Perseverance Rover', 'Mars surface research', true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 5778, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-Type', 3042, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-Type', 5790, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'A-Type', 9940, true, 2);
INSERT INTO public.star VALUES (5, 'Vega', 'A-Type', 9602, true, 2);
INSERT INTO public.star VALUES (6, 'Rigel', 'B-Type', 12100, true, 3);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 'M-Type', 3500, true, 3);
INSERT INTO public.star VALUES (8, 'Altair', 'A-Type', 7450, true, 4);
INSERT INTO public.star VALUES (9, 'Aldebaran', 'K-Type', 3910, true, 4);
INSERT INTO public.star VALUES (10, 'Spica', 'B-Type', 22400, true, 5);
INSERT INTO public.star VALUES (11, 'Antares', 'M-Type', 3504, true, 5);
INSERT INTO public.star VALUES (12, 'Capella', 'G-Type', 4900, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- Name: satellite satellite_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

