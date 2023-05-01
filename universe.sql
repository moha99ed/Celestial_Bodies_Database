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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    diameter_in_km real,
    distance_from_sun_in_au real,
    orbital_period_in_years real,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    galaxy_type text
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
    name character varying NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_kg numeric,
    diameter_in_km integer,
    planet_id integer
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
    name character varying NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    mass_in_kg numeric,
    diameter_in_km numeric,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    mass_in_kg numeric,
    diameter_in_km numeric,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the asteroid belt between Mars and Jupiter', 939, 2.77, 4.6, 4);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the brightest objects in the asteroid belt', 525, 2.36, 3.63, 4);
INSERT INTO public.asteroid VALUES (3, 'Eros', 'The first asteroid ever orbited by a spacecraft', 16.8, 1.46, 1.76, NULL);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 'A potentially hazardous asteroid that was visited by the OSIRIS-REx spacecraft', 0.492, 1.13, 1.2, NULL);
INSERT INTO public.asteroid VALUES (5, 'Itokawa', 'A small asteroid visited by the Japanese Hayabusa spacecraft', 0.535, 1.31, 1.52, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System', false, true, 13000, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest galaxy to the Milky Way', false, false, 10500, 'Spiral');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'A galaxy that is interacting with a smaller companion galaxy', false, false, 23000, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 'A galaxy with a distinctive ring-like structure', false, false, 40000, 'Ring');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'A small galaxy in the Local Group of galaxies', false, false, 13000, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A galaxy with a distinct bulge and disk structure', false, true, 12000, 'Lenticular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (12, 'Triton', 'The largest moon of Neptune, with a retrograde orbit and a surface covered in nitrogen ice.', false, true, 4500, 21400000000000000000000, 2707, 8);
INSERT INTO public.moon VALUES (21, 'Mimas', 'A moon of Saturn with a large impact crater named Herschel.', false, true, 4500, 374930000000000, 396, 6);
INSERT INTO public.moon VALUES (22, 'Enceladus', 'A moon of Saturn with active geysers that spew water vapor and icy particles into space.', false, true, 4500, 10802200000000000, 504, 6);
INSERT INTO public.moon VALUES (23, 'Tethys', 'A heavily cratered moon of Saturn with a large valley named Ithaca Chasma.', false, true, 4500, 617410000000000, 1062, 6);
INSERT INTO public.moon VALUES (24, 'Dione', 'A moon of Saturn with a heavily cratered surface and a large ice ridge named Janiculum Dorsa.', false, true, 4500, 1095450000000000, 1123, 6);
INSERT INTO public.moon VALUES (25, 'Rhea', 'A moon of Saturn with a heavily cratered and scarred surface.', false, true, 4500, 2307800000000000, 1529, 6);
INSERT INTO public.moon VALUES (26, 'Iapetus', 'A moon of Saturn with a two-toned surface and a large impact basin named Turgis.', false, true, 4500, 1805630000000000, 1469, 6);
INSERT INTO public.moon VALUES (27, 'Miranda', 'A moon of Uranus with a heavily faulted and fragmented surface.', false, true, 4500, 65910000000000, 473, 9);
INSERT INTO public.moon VALUES (28, 'Ariel', 'A moon of Uranus with a heavily cratered and scarred surface.', false, true, 4500, 1292000000000000, 1158, 9);
INSERT INTO public.moon VALUES (29, 'Umbriel', 'A moon of Uranus with a heavily cratered and scarred surface and a large canyon named Wunda.', false, true, 4500, 1192900000000000, 1169, 9);
INSERT INTO public.moon VALUES (30, 'Titania', 'The largest of the moons of Uranus, with a heavily cratered and scarred surface.', false, true, 4500, 35270000000000000, 1578, 9);
INSERT INTO public.moon VALUES (31, 'Oberon', 'The outermost of the five major moons of Uranus, with a heavily cratered and ancient surface.', false, true, 4500, 30140000000000000, 1523, 9);
INSERT INTO public.moon VALUES (32, 'Charon', 'The largest moon of Pluto and the only known satellite in the Solar System to be tidally locked.', false, true, 4500, 160000000000000000, 1207, 7);
INSERT INTO public.moon VALUES (33, 'Io', 'The most geologically active moon in the Solar System, with over 400 active volcanoes.', false, true, 4000, 8931900000000000000, 3643, 4);
INSERT INTO public.moon VALUES (34, 'Europa', 'The smallest of the four Galilean moons of Jupiter, with a surface covered in ice and cracks.', false, true, 4500, 480000000, 3122, 5);
INSERT INTO public.moon VALUES (40, 'Ganymede', 'The largest moon in the Solar System, with a surface that contains both craters and grooved terrain.', false, true, 4500, 14819000000000000, 5262, 4);
INSERT INTO public.moon VALUES (41, 'Callisto', 'The second-largest moon of Jupiter, with a heavily cratered surface and some areas of bright terrain.', false, true, 4500, 10759000000000000, 4821, 4);
INSERT INTO public.moon VALUES (42, 'Phobos', 'A small, irregularly shaped moon of Mars with a heavily cratered surface.', false, false, 4538, 101800000000, 22, 5);
INSERT INTO public.moon VALUES (43, 'Deimos', 'The smaller of the two moons of Mars, with a heavily cratered and irregular surface.', false, false, 4538, 14761000000, 12, 5);
INSERT INTO public.moon VALUES (44, 'Chariklo', 'A small asteroid with two small moons, discovered in 1997.', false, true, 4500, 210000000000000, 252, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Third planet from the sun', true, true, 4500, 5970000000000000000000000, 12756, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Fourth planet from the sun', false, true, 4500, 639000000000000000000000, 6779, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Fifth planet from the sun', false, false, 4500, 1898000000000000000000000000, 139822, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Sixth planet from the sun', false, false, 4500, 568300000000000000000000000, 116460, 2);
INSERT INTO public.planet VALUES (5, 'Venus', 'The second planet from the sun, known for its thick, toxic atmosphere.', false, true, 4500, 4870000000000000000000000, 12104, 1);
INSERT INTO public.planet VALUES (6, 'Mars', 'The fourth planet from the sun, often referred to as the Red Planet.', false, true, 4500, 639000000000000000000000, 6779, 1);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'The largest planet in the solar system, known for its giant red spot.', false, true, 4500, 1898000000000000000000000000, 139822, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', 'The second-largest planet in the solar system, known for its rings.', false, true, 4500, 569000000000000000000000000, 116460, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 'The seventh planet from the sun, known for its distinct tilt.', false, true, 4500, 86800000000000000000000000, 50724, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', 'The eighth planet from the sun, known for its blue color and strong winds.', false, true, 4500, 102000000000000000000000000, 49244, 1);
INSERT INTO public.planet VALUES (11, 'Mercury', 'The smallest planet in the solar system, closest to the sun.', false, true, 4500, 330110000000000000000000, 4879, 1);
INSERT INTO public.planet VALUES (12, 'Pluto', 'A dwarf planet located in the Kuiper Belt beyond Neptune.', false, true, 4500, 13030000000000000000000, 2376, 1);
INSERT INTO public.planet VALUES (13, 'Kepler-452b', 'An exoplanet located about 1,400 light-years from Earth, in the habitable zone of its star.', true, true, 6000, 5385000000000000000000000, 20000, 2);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 'An exoplanet located about 4.24 light-years from Earth, in the habitable zone of its star.', true, true, 1000, 33000000000000000000000, 10000, 3);
INSERT INTO public.planet VALUES (15, 'Gliese 581g', 'An exoplanet located about 20 light-years from Earth, in the habitable zone of its star.', true, true, 8000, 3100000000000000000000000, 12800, 4);
INSERT INTO public.planet VALUES (16, 'HD 209458 b', 'An exoplanet located about 150 light-years from Earth, the first exoplanet to have its atmosphere detected.', false, true, 5000, 2224300000000000000000000000, 131470, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The closest star to Earth and the center of the solar system', true, 4.6, 1989000000000000000000000000000, 1392700, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'The brightest star in the night sky', false, 0.3, 2020000000000000000000000000000, 1711000, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'The closest star to Earth (other than the Sun)', true, 4.85, 244700000000000000000000000000, 198900, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'A close neighbor of the Sun', false, 6.5, 2189000000000000000000000000000, 1711000, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 'A close neighbor of the Sun', false, 6.5, 1684000000000000000000000000000, 1440000, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A blue-white main-sequence star located in the Lyra constellation', true, 455, 2100000000000000000000000000000, 2360000, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 44, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_unique UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

