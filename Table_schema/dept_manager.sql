--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-12 18:16:08

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
-- TOC entry 220 (class 1259 OID 17084)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 17084)
-- Dependencies: 220
-- Data for Name: dept_manager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dept_manager (dept_no, emp_no) FROM stdin;
d001	110022
d001	110039
d002	110085
d002	110114
d003	110183
d003	110228
d004	110303
d004	110344
d004	110386
d004	110420
d005	110511
d005	110567
d006	110725
d006	110765
d006	110800
d006	110854
d007	111035
d007	111133
d008	111400
d008	111534
d009	111692
d009	111784
d009	111877
d009	111939
\.


--
-- TOC entry 4648 (class 2606 OID 17088)
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (dept_no, emp_no);


--
-- TOC entry 4649 (class 2606 OID 17089)
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 4650 (class 2606 OID 17094)
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2024-09-12 18:16:08

--
-- PostgreSQL database dump complete
--

