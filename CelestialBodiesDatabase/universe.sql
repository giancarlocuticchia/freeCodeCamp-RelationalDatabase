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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_million_solar_masses integer NOT NULL,
    distance_from_earth_in_million_light_years numeric(5,3),
    galaxy_id integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spiral boolean,
    age_in_billions_of_years integer,
    mass_in_billion_solar_masses integer NOT NULL,
    distance_from_earth_in_million_light_years numeric(5,3)
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    mass_in_10e22_kg integer NOT NULL,
    distance_from_earth_in_au numeric(5,3),
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_millions_of_years integer,
    mass_in_earth_masses integer NOT NULL,
    distance_from_earth_in_au numeric(5,3),
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    mass_in_solar_masses integer NOT NULL,
    distance_from_earth_in_light_years numeric(5,3),
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 'The black hole at the center of the Milky Way.', true, NULL, 4, 0.027, 1);
INSERT INTO public.blackhole VALUES (2, 'M87*', 'Supermassive black hole in the center of the M87 galaxy.', NULL, NULL, 6500, NULL, 3);
INSERT INTO public.blackhole VALUES (3, 'Sombrero Galaxy Black Hole', 'Center of the Sombrero Galaxy. This is among the most massive black holes measured in any nearby galaxy, and is the nearest billion-solar-mass black hole to Earth.', NULL, NULL, 1000, NULL, 4);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Messier 31 or M31 (also designated NGC 224) is a spiral galaxy in the constellation Andromeda.', true, NULL, 350, 2.570);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Also known as Virgo A or NGC 4486, generally abbreviated to M87 is a supergiant elliptical galaxy in the constellation Virgo that contains several trillion stars.', false, NULL, 2700, 54.900);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Messier 104 or M104 (also designated NGC 4594) is a spiral galaxy in the constellation Virgo.', true, NULL, 300, 44.700);
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy', 'Messier 81 or M81 (also designated NGC 3031) is a spiral galaxy in the constellation Ursa Major.', true, NULL, 50, 11.800);
INSERT INTO public.galaxy VALUES (6, 'Messier 49', 'Messier 49 or M49 (also designated NGC 4472) is a elliptical galaxy in the constellation Virgo.', false, NULL, 200, 53.100);
INSERT INTO public.galaxy VALUES (1, 'Milky_Way', 'The Milky Way is a barred spiral galaxy. It includes the Solar System, with the name describing the galaxys appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', true, 14, 1150, 0.027);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (61, 'Moon', 'Earths only natural satellite.', false, 4500, 7, 0.003, 3);
INSERT INTO public.moon VALUES (62, 'Io', 'Most geologically active body.', false, 4500, 11, 4.200, 5);
INSERT INTO public.moon VALUES (63, 'Europa', 'Believed to have a subsurface ocean.', false, 4500, 5, 4.203, 5);
INSERT INTO public.moon VALUES (64, 'Ganymede', 'Largest moon in the Solar System.', false, 4500, 15, 4.204, 5);
INSERT INTO public.moon VALUES (65, 'Callisto', 'Heavily cratered moon.', false, 4500, 11, 4.199, 5);
INSERT INTO public.moon VALUES (66, 'Titan', 'Known for lakes of methane and ethane.', false, 4500, 13, 8.021, 6);
INSERT INTO public.moon VALUES (67, 'Rhea', 'Heavily cratered surface with bright markings.', false, 4500, 2, 8.489, 6);
INSERT INTO public.moon VALUES (68, 'Enceladus', 'Known for geysers and subsurface ocean.', false, 4500, 0, 8.489, 6);
INSERT INTO public.moon VALUES (69, 'Triton', 'Known for retrograde orbit and geysers.', false, 4500, 0, 28.743, 8);
INSERT INTO public.moon VALUES (70, 'Oberon', 'Heavily cratered surface.', false, 4500, 0, 17.380, 7);
INSERT INTO public.moon VALUES (71, 'Titania', 'Features canyons and craters.', false, 4500, 0, 17.380, 7);
INSERT INTO public.moon VALUES (72, 'Miranda', 'Unique surface features.', false, 4500, 0, 17.380, 7);
INSERT INTO public.moon VALUES (73, 'Phobos', 'The larger of Mars two moons.', false, 4500, 0, 0.040, 4);
INSERT INTO public.moon VALUES (74, 'Deimos', 'The smaller moon of Mars.', false, 4500, 0, 0.154, 4);
INSERT INTO public.moon VALUES (75, 'Iapetus', 'Known for two-tone coloration.', false, 4500, 0, 8.690, 6);
INSERT INTO public.moon VALUES (76, 'Charon', 'Plutos largest moon, forming a binary system.', false, 4500, 1, 28.610, 9);
INSERT INTO public.moon VALUES (77, 'Ceres', 'Largest object in the asteroid belt.', false, 4500, 0, 2.761, 4);
INSERT INTO public.moon VALUES (78, 'Mimas', 'Known for its large crater, Herschel.', false, 4500, 0, 8.489, 6);
INSERT INTO public.moon VALUES (79, 'Dione', 'Heavily cratered surface with bright markings.', false, 4500, 1, 8.489, 6);
INSERT INTO public.moon VALUES (80, 'Enceladus2', 'A small icy moon of Saturn, known for its geysers that eject water vapor, indicating a subsurface ocean.', false, 4500, 0, 8.489, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System, Mercury has a very thin atmosphere and extreme temperature variations. It orbits closest to the Sun.', false, 4600, 0, 0.610, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Similar in size to Earth, Venus has a thick, toxic atmosphere composed mainly of carbon dioxide, with surface temperatures hot enough to melt lead.', false, 4600, 1, 0.280, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet to support life, Earth has diverse ecosystems, water in all three states, and a protective atmosphere.', true, 4540, 1, 0.000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Known as the "Red Planet" due to its iron oxide surface, Mars has the largest volcano and canyon in the solar system and evidence of past water.', false, 4540, 0, 0.370, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter ', 'The largest planet in the Solar System, Jupiter is a gas giant known for its Great Red Spot, a giant storm, and its many moons, including the largest, Ganymede.', false, 4540, 318, 4.200, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its stunning ring system, Saturn is a gas giant with a large number of moons, including Titan, which is larger than the planet Mercury.', false, 4540, 95, 8.900, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a unique tilt that causes extreme seasons, Uranus has a faint ring system and many moons, with Miranda being one of the most geologically diverse.', false, 4540, 15, 19.200, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest planet from the Sun, Neptune is known for its deep blue color and strong winds, with storms similar to Jupiters, including the Great Dark Spot.', false, 4540, 17, 30.000, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Once considered the ninth planet in the Solar System, Pluto is now classified as a dwarf planet. It has a thin atmosphere, a complex orbit, and five known moons, with Charon being the largest. Plutos surface is primarily composed of ice and rock, and it has a diverse geology.', false, 4500, 0, 29.200, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'An Earth-sized exoplanet located in the habitable zone of Proxima Centauri, it has the potential for liquid water, but its conditions remain uncertain.', false, 4850, 1, NULL, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'TRAPPIST-1e is one of seven Earth-sized exoplanets orbiting the ultra-cool dwarf star TRAPPIST-1. It is located in the stars habitable zone, where conditions may allow for liquid water to exist on its surface.', false, 7600, 1, NULL, 7);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'Kepler-186f is notable for being the first Earth-sized exoplanet discovered in the habitable zone of another star. It orbits a K-dwarf star and is thought to have conditions suitable for liquid water.', false, 4000, 1, NULL, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'The Sun is the star at the center of the Solar System.', true, 4600, 1, 0.000, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Sirius or Alpha Canis Majoris (Alp CMa) is the brightest naked eye star in the constellation Canis Major.', true, 250, 2, 8.600, 1);
INSERT INTO public.star VALUES (3, 'SN 1993J', 'A supernova observed in Bodes Galaxy. It was discovered on 28 March 1993 by F. Garcia in Spain.', NULL, 12, 20, NULL, 5);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Betelgeuse is one of the largest stars visible to the naked eye. It is nearing the end of its life and is expected to explode as a supernova in the next million years or so.', NULL, 9, 15, 4.240, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'Rigel is one of the most luminous stars visible from Earth and is a key feature in the constellation Orion. It has significantly more massive than the Sun and is nearing the end of its life cycle, like Betelgeuse.', NULL, 8, 21, NULL, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Proxima Centauri is the closest known star to the Sun. Despite its proximity, it is much dimmer than the Sun and can only be seen through a telescope.', NULL, 5, 0, 4.240, 1);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 'TRAPPIST-1 is an ultra-cool dwarf star, significantly smaller and cooler than the Sun. It has seven known planets, three of which are located in the habitable zone where conditions could be suitable for liquid water.', NULL, 8000, 0, 39.500, 1);
INSERT INTO public.star VALUES (8, 'Kepler-186', 'Kepler-186 is a K-dwarf star with a lower temperature and luminosity than the Sun. It is notable for having an Earth-sized planet in its habitable zone, marking a significant discovery in the search for potentially habitable exoplanets.', NULL, 4000, 1, NULL, 1);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 80, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

