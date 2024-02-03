--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg110+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg110+1)

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

--
-- Name: regalias; Type: SCHEMA; Schema: -; Owner: semard
--

CREATE SCHEMA regalias;


ALTER SCHEMA regalias OWNER TO semard;

--
-- Name: get_all(); Type: FUNCTION; Schema: regalias; Owner: semard
--

CREATE FUNCTION regalias.get_all() RETURNS json
    LANGUAGE plpgsql
    AS $$DECLARE
    result JSON;
BEGIN
    SELECT json_agg(node)
    INTO result
    FROM (
        SELECT
            c.id_node,
            c.description,
            json_agg(
                jsonb_build_object(
                    'id_registro', r.id_data,
                    'geolocation',
                    jsonb_build_object(
                        'alt', r.altitud,
                        'lat', r.latitud
                    ),
                    'sensors',
                    jsonb_build_object(
                        'data',
                        jsonb_build_object(
                            'temp', r.tem,
                            'ph', r.ph,
                            'ec', r.ec,
                            'od', r.od,
                            'tds', r.tds
                        )
                    ),
                    'timestamp', r.date
                ) ORDER BY r.date ASC -- Ordenar por fecha descendente
            ) AS data
        FROM
            regalias.node c
        LEFT JOIN
            regalias.data r ON c.id_node = r.id_node
        GROUP BY
            c.id_node, c.description
    ) node;

    RETURN COALESCE(result, '[]'::JSON);
END;$$;


ALTER FUNCTION regalias.get_all() OWNER TO semard;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: data; Type: TABLE; Schema: regalias; Owner: semard
--

CREATE TABLE regalias.data (
    id_data bigint NOT NULL,
    date date NOT NULL,
    tem character varying,
    ph character varying,
    ec character varying,
    od character varying,
    tds character varying,
    id_node integer NOT NULL,
    altitud character varying,
    latitud character varying
);


ALTER TABLE regalias.data OWNER TO semard;

--
-- Name: insert_nodo(date, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: regalias; Owner: semard
--

CREATE FUNCTION regalias.insert_nodo(fechab date, tempp character varying, phb character varying, ecb character varying, odb character varying, tdsb character varying) RETURNS regalias.data
    LANGUAGE plpgsql
    AS $$
DECLARE 
new_nodo regalias.nodo;
BEGIN
	insert into regalias.nodo(fecha, tem, ph, ec, od, tds) values (fechab, tempp, phb, ecb, odb, tdsb) RETURNING * INTO new_nodo;
	return new_nodo;
END;
$$;


ALTER FUNCTION regalias.insert_nodo(fechab date, tempp character varying, phb character varying, ecb character varying, odb character varying, tdsb character varying) OWNER TO semard;

--
-- Name: node; Type: TABLE; Schema: regalias; Owner: semard
--

CREATE TABLE regalias.node (
    id_node integer NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE regalias.node OWNER TO semard;

--
-- Name: nodo_id_seq; Type: SEQUENCE; Schema: regalias; Owner: semard
--

ALTER TABLE regalias.data ALTER COLUMN id_data ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME regalias.nodo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: registros_id_node_seq; Type: SEQUENCE; Schema: regalias; Owner: semard
--

ALTER TABLE regalias.node ALTER COLUMN id_node ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME regalias.registros_id_node_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: data; Type: TABLE DATA; Schema: regalias; Owner: semard
--

COPY regalias.data (id_data, date, tem, ph, ec, od, tds, id_node, altitud, latitud) FROM stdin;
90	2023-11-23	8	1.5	10	14	24	1	28	10
91	2023-12-23	7	1.5	10	14	24	1	28	11
92	2024-01-23	9	1.5	10	14	24	1	28	12
93	2024-01-25	22	1.5	10	14	24	2	28	19
94	2024-01-30	24	1.5	10	41	24	2	48	19
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: regalias; Owner: semard
--

COPY regalias.node (id_node, description) FROM stdin;
1	Laguito
2	Cienaga de la virgen
\.


--
-- Name: nodo_id_seq; Type: SEQUENCE SET; Schema: regalias; Owner: semard
--

SELECT pg_catalog.setval('regalias.nodo_id_seq', 94, true);


--
-- Name: registros_id_node_seq; Type: SEQUENCE SET; Schema: regalias; Owner: semard
--

SELECT pg_catalog.setval('regalias.registros_id_node_seq', 2, true);


--
-- Name: data nodo_pkey; Type: CONSTRAINT; Schema: regalias; Owner: semard
--

ALTER TABLE ONLY regalias.data
    ADD CONSTRAINT nodo_pkey PRIMARY KEY (id_data);


--
-- Name: node registros_pkey; Type: CONSTRAINT; Schema: regalias; Owner: semard
--

ALTER TABLE ONLY regalias.node
    ADD CONSTRAINT registros_pkey PRIMARY KEY (id_node);


--
-- Name: data data_id_node_fkey; Type: FK CONSTRAINT; Schema: regalias; Owner: semard
--

ALTER TABLE ONLY regalias.data
    ADD CONSTRAINT data_id_node_fkey FOREIGN KEY (id_node) REFERENCES regalias.node(id_node) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO regalias_admin;


--
-- Name: SCHEMA regalias; Type: ACL; Schema: -; Owner: semard
--

GRANT ALL ON SCHEMA regalias TO regalias_admin;


--
-- Name: TABLE data; Type: ACL; Schema: regalias; Owner: semard
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE regalias.data TO regalias_admin;


--
-- Name: SEQUENCE nodo_id_seq; Type: ACL; Schema: regalias; Owner: semard
--

GRANT ALL ON SEQUENCE regalias.nodo_id_seq TO regalias_admin;


--
-- Name: DEFAULT PRIVILEGES FOR SCHEMAS; Type: DEFAULT ACL; Schema: -; Owner: semard
--

ALTER DEFAULT PRIVILEGES FOR ROLE semard GRANT USAGE ON SCHEMAS TO regalias_admin;


--
-- PostgreSQL database dump complete
--

