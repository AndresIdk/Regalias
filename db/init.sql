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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: nodo; Type: TABLE; Schema: regalias; Owner: semard
--

CREATE TABLE regalias.nodo (
    id_nodo bigint NOT NULL,
    fecha date NOT NULL,
    tem character varying,
    ph character varying,
    ec character varying,
    od character varying,
    tds character varying
);


ALTER TABLE regalias.nodo OWNER TO semard;

--
-- Name: get_all(); Type: FUNCTION; Schema: regalias; Owner: semard
--

CREATE FUNCTION regalias.get_all() RETURNS SETOF regalias.nodo
    LANGUAGE plpgsql
    AS $$

DECLARE
	nodo_row regalias.nodo%ROWTYPE;
BEGIN
	FOR nodo_row IN SELECT * FROM regalias.nodo LOOP
    	RETURN NEXT nodo_row;
    END LOOP;
END;
$$;


ALTER FUNCTION regalias.get_all() OWNER TO semard;

--
-- Name: insert_nodo(date, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: regalias; Owner: semard
--

CREATE FUNCTION regalias.insert_nodo(fechab date, tempp character varying, phb character varying, ecb character varying, odb character varying, tdsb character varying) RETURNS regalias.nodo
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
-- Name: nodo_id_seq; Type: SEQUENCE; Schema: regalias; Owner: semard
--

ALTER TABLE regalias.nodo ALTER COLUMN id_nodo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME regalias.nodo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: nodo; Type: TABLE DATA; Schema: regalias; Owner: semard
--

COPY regalias.nodo (id_nodo, fecha, tem, ph, ec, od, tds) FROM stdin;
1	2023-10-15	10.5	10.2	10.1	10.3	10.4
2	2023-10-15	10.5	10.2	10.1	10.3	10.4
8	2023-10-15	10.5	10.2	10.1	10.3	10.4
9	2023-10-15	10.5	10.2	10.1	10.3	10.4
10	2023-10-28	1.1	2.2	3.3	4.4	5.5
11	2023-10-28	1.1	2.2	3.3	4.4	5.5
12	2023-10-28	1.1	2.2	3.3	4.4	5.5
13	2023-10-28	1.1	2.3	3.3	4.4	5.5
14	2023-10-28	1.1	2.3	3.3	4.4	None
15	2023-10-28	1.1	2.3	None	4.4	5.5
16	2023-10-30	1.1	2.3	3.3	4.4	5.5
17	2023-10-30	1.1	2.3	3.3	4.4	5.5
18	2023-10-30	1.1	2.3	3.3	4.4	5.5
19	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
20	2023-10-30	1.1	2.3	3.3	4.4	5.5
21	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
22	2023-10-30	1.1	2.3	3.3	4.4	5.5
23	2023-10-30	1.1	2.3	3.3	4.4	5.5
24	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
25	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
26	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
27	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
28	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
29	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
30	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
31	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
32	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
33	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
34	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
35	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
36	2023-10-30	1.1	2.3	3.3	4.4	5.5
37	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
38	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
39	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
40	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
41	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
42	2023-10-30	21.4375	11.0734396	-0.064319998	-138	0
43	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
44	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
45	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
46	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
47	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
48	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
49	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
50	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
51	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
52	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
53	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
54	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
55	2023-10-31	1.1	2.3	3.3	4.4	5.5
56	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
57	2023-10-31	21.4375	11.0734396	-0.064319998	-138	0
58	2023-10-31	1.1	2.3	3.3	4.4	5.5
59	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
60	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
61	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
62	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
63	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
64	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
65	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
66	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
67	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
68	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
69	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
70	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
71	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
72	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
73	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
74	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
75	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
76	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
77	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
78	2023-11-14	21.4375	11.0734396	-0.064319998	-138	0
79	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
80	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
81	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
82	2023-11-15	21.4375	11.0734396	-0.064319998	-138	0
83	2023-11-17	21.4375	11.0734396	-0.064319998	-138	0
84	2023-11-17	21.4375	11.0734396	-0.064319998	-138	0
85	2023-11-16	21.4375	11.0734396	-0.064319998	-138	0
86	2023-11-16	21.4375	11.0734396	-0.064319998	-138	0
87	2023-11-17	21.4375	11.0734396	-0.064319998	-138	0
88	2023-11-17	21.4375	11.0734396	-0.064319998	-138	0
\.


--
-- Name: nodo_id_seq; Type: SEQUENCE SET; Schema: regalias; Owner: semard
--

SELECT pg_catalog.setval('regalias.nodo_id_seq', 88, true);


--
-- Name: nodo nodo_pkey; Type: CONSTRAINT; Schema: regalias; Owner: semard
--

ALTER TABLE ONLY regalias.nodo
    ADD CONSTRAINT nodo_pkey PRIMARY KEY (id_nodo);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO regalias_admin;


--
-- Name: SCHEMA regalias; Type: ACL; Schema: -; Owner: semard
--

GRANT ALL ON SCHEMA regalias TO regalias_admin;


--
-- Name: TABLE nodo; Type: ACL; Schema: regalias; Owner: semard
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE regalias.nodo TO regalias_admin;


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

