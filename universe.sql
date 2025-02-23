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
    galaxy_types text,
    description text,
    distance_from_earth numeric(10,2)
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
-- Name: galaxy_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_star (
    galaxy_id integer,
    star_id integer,
    name character varying(255) NOT NULL,
    galaxy_star_id integer NOT NULL
);


ALTER TABLE public.galaxy_star OWNER TO freecodecamp;

--
-- Name: galaxy_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_star_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_star_id_seq OWNED BY public.galaxy_star.galaxy_star_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    distance_from_earth numeric(10,2),
    age_in_millions_of_years integer,
    description text,
    is_spherical boolean
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
    star_id integer,
    distance_from_earth numeric(10,2),
    age_in_millions_of_years integer,
    planet_types text,
    is_spherical boolean,
    has_life boolean,
    description text
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric(10,2),
    start_age text,
    is_spherical boolean,
    description text,
    age_in_millions_of_years integer
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
-- Name: galaxy_star galaxy_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star ALTER COLUMN galaxy_star_id SET DEFAULT nextval('public.galaxy_star_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy, containing the Solar System.', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest spiral galaxy to the Milky Way.', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Third-largest member of the Local Group.', NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 'A giant elliptical galaxy with a supermassive black hole.', NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 'A galaxy with a bright nucleus and large central bulge.', NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'A classic example of a spiral galaxy.', NULL);


--
-- Data for Name: galaxy_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_star VALUES (1, 1, 'Sun in Milky Way', 1);
INSERT INTO public.galaxy_star VALUES (1, 2, 'Proxima Centauri in Milky Way', 2);
INSERT INTO public.galaxy_star VALUES (2, 6, 'Alpha Centauri A in Andromeda', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 0.00, 4600, 'Earth’s only natural satellite.', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.00, 4600, 'One of Mars’s small moons.', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 0.00, 4600, 'Another small moon of Mars.', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 0.00, 4600, 'Most volcanically active moon in the Solar System.', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 0.00, 4600, 'Ice-covered ocean world.', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 0.00, 4600, 'Largest moon in the Solar System.', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 0.00, 4600, 'A heavily cratered moon.', true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 0.00, 4600, 'Only moon with a dense atmosphere.', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 0.00, 4600, 'Spews water from its subsurface ocean.', true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 0.00, 4600, 'Has a massive crater resembling the Death Star.', true);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 0.00, 4600, 'Orbits Neptune in a retrograde motion.', true);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 0.00, 4600, 'Largest moon of Pluto.', true);
INSERT INTO public.moon VALUES (13, 'Dysnomia', 10, 0.00, 4600, 'Moon of dwarf planet Eris.', true);
INSERT INTO public.moon VALUES (14, 'Kepler Moon-1', 11, 600.00, 3000, 'Hypothetical moon of Kepler-22b.', true);
INSERT INTO public.moon VALUES (15, 'Gliese Moon-1', 12, 20.40, 7000, 'Hypothetical moon of Gliese 581c.', true);
INSERT INTO public.moon VALUES (16, 'HD Moon-1', 12, 150.00, 5000, 'Hypothetical moon of HD 209458 b.', true);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 0.00, 4600, 'A large moon of Uranus.', true);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 0.00, 4600, 'The largest Uranian moon.', true);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 0.00, 4600, 'Brightest moon of Uranus.', true);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 0.00, 4600, 'A very dark moon.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.00, 4600, 'Terrestrial', true, false, 'Closest planet to the Sun.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.00, 4600, 'Terrestrial', true, false, 'Hot and thick atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 0.00, 4600, 'Terrestrial', true, true, 'Only known planet with life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.00, 4600, 'Terrestrial', true, false, 'The Red Planet.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 0.00, 4600, 'Gas Giant', true, false, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 0.00, 4600, 'Gas Giant', true, false, 'Has a beautiful ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 0.00, 4600, 'Ice Giant', true, false, 'Rotates on its side.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 0.00, 4600, 'Ice Giant', true, false, 'The farthest planet from the Sun.');
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 4.24, 4850, 'Exoplanet', true, false, 'Exoplanet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 3, 600.00, 3000, 'Exoplanet', true, NULL, 'A potentially habitable exoplanet.');
INSERT INTO public.planet VALUES (11, 'Gliese 581c', 3, 20.40, 7000, 'Exoplanet', true, NULL, 'A super-Earth exoplanet.');
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 4, 150.00, 5000, 'Hot Jupiter', true, false, 'First transiting exoplanet discovered.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.00, '4.6 billion years', true, 'The star at the center of our Solar System.', 4600);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4.24, '4.85 billion years', true, 'Closest known exoplanetary system.', 4850);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 8.60, '0.24 billion years', true, 'Brightest star in the night sky.', 240);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 642.50, '10 million years', true, 'A red supergiant in the Orion constellation.', 10);
INSERT INTO public.star VALUES (5, 'Vega', 1, 25.00, '0.45 billion years', true, 'A bright star in the Lyra constellation.', 450);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 2, 4.37, '6 billion years', true, 'A part of the Alpha Centauri star system.', 6000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_star_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_star galaxy_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_pkey PRIMARY KEY (galaxy_star_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy_star unique_galaxy_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT unique_galaxy_star_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: galaxy_star galaxy_star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: galaxy_star galaxy_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_star
    ADD CONSTRAINT galaxy_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


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
-- PostgreSQL database dump complete
--

