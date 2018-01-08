--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

-- Started on 2018-01-08 14:02:49 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE csrepo;
--
-- TOC entry 3166 (class 1262 OID 24585)
-- Name: csrepo; Type: DATABASE; Schema: -; Owner: score
--

CREATE DATABASE csrepo WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE csrepo OWNER TO score;

\connect csrepo

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13350)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3169 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 24586)
-- Name: author; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE author (
    id_author integer NOT NULL,
    name_author character varying(255) NOT NULL
);


ALTER TABLE author OWNER TO score;

--
-- TOC entry 186 (class 1259 OID 24589)
-- Name: author_id_author_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE author_id_author_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE author_id_author_seq OWNER TO score;

--
-- TOC entry 3170 (class 0 OID 0)
-- Dependencies: 186
-- Name: author_id_author_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE author_id_author_seq OWNED BY author.id_author;


--
-- TOC entry 187 (class 1259 OID 24591)
-- Name: authorpaper; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE authorpaper (
    id_author integer NOT NULL,
    id_paper integer NOT NULL
);


ALTER TABLE authorpaper OWNER TO score;

--
-- TOC entry 188 (class 1259 OID 24594)
-- Name: conference; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE conference (
    id_conference integer NOT NULL,
    acronym_conference character varying(30) NOT NULL,
    name_conference character varying(255) NOT NULL
);


ALTER TABLE conference OWNER TO score;

--
-- TOC entry 189 (class 1259 OID 24597)
-- Name: conference_id_conference_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE conference_id_conference_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conference_id_conference_seq OWNER TO score;

--
-- TOC entry 3171 (class 0 OID 0)
-- Dependencies: 189
-- Name: conference_id_conference_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE conference_id_conference_seq OWNED BY conference.id_conference;


--
-- TOC entry 190 (class 1259 OID 24599)
-- Name: edition; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE edition (
    id_edition integer NOT NULL,
    year_edition integer NOT NULL,
    conference_edition integer NOT NULL,
    publisher_edition integer NOT NULL
);


ALTER TABLE edition OWNER TO score;

--
-- TOC entry 191 (class 1259 OID 24602)
-- Name: edition_id_edition_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE edition_id_edition_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE edition_id_edition_seq OWNER TO score;

--
-- TOC entry 3172 (class 0 OID 0)
-- Dependencies: 191
-- Name: edition_id_edition_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE edition_id_edition_seq OWNED BY edition.id_edition;


--
-- TOC entry 192 (class 1259 OID 24604)
-- Name: paper; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE paper (
    id_paper integer NOT NULL,
    title_paper character varying(255) NOT NULL,
    pages_paper integer NOT NULL,
    year_publication_paper integer NOT NULL,
    first_page_paper integer NOT NULL,
    last_page_paper integer NOT NULL,
    conference_paper integer,
    publisher_paper integer,
    edition_paper integer
);


ALTER TABLE paper OWNER TO score;

--
-- TOC entry 193 (class 1259 OID 24607)
-- Name: paper_id_paper_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE paper_id_paper_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paper_id_paper_seq OWNER TO score;

--
-- TOC entry 3173 (class 0 OID 0)
-- Dependencies: 193
-- Name: paper_id_paper_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE paper_id_paper_seq OWNED BY paper.id_paper;


--
-- TOC entry 194 (class 1259 OID 24609)
-- Name: publisher; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE publisher (
    id_publisher integer NOT NULL,
    link_publisher character varying(255) NOT NULL,
    name_publisher character varying(255) NOT NULL,
    acronym_publisher character varying(10) NOT NULL
);


ALTER TABLE publisher OWNER TO score;

--
-- TOC entry 195 (class 1259 OID 24615)
-- Name: publisher_id_publisher_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE publisher_id_publisher_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE publisher_id_publisher_seq OWNER TO score;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 195
-- Name: publisher_id_publisher_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE publisher_id_publisher_seq OWNED BY publisher.id_publisher;


--
-- TOC entry 197 (class 1259 OID 24679)
-- Name: report; Type: TABLE; Schema: public; Owner: score
--

CREATE TABLE report (
    id_report integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    error_type integer NOT NULL,
    id_conference integer,
    id_edition integer,
    id_paper integer,
    description text,
    created_on timestamp without time zone NOT NULL
);


ALTER TABLE report OWNER TO score;

--
-- TOC entry 196 (class 1259 OID 24677)
-- Name: report_id_report_seq; Type: SEQUENCE; Schema: public; Owner: score
--

CREATE SEQUENCE report_id_report_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE report_id_report_seq OWNER TO score;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 196
-- Name: report_id_report_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: score
--

ALTER SEQUENCE report_id_report_seq OWNED BY report.id_report;


--
-- TOC entry 2998 (class 2604 OID 24617)
-- Name: author id_author; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY author ALTER COLUMN id_author SET DEFAULT nextval('author_id_author_seq'::regclass);


--
-- TOC entry 2999 (class 2604 OID 24618)
-- Name: conference id_conference; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY conference ALTER COLUMN id_conference SET DEFAULT nextval('conference_id_conference_seq'::regclass);


--
-- TOC entry 3000 (class 2604 OID 24619)
-- Name: edition id_edition; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY edition ALTER COLUMN id_edition SET DEFAULT nextval('edition_id_edition_seq'::regclass);


--
-- TOC entry 3001 (class 2604 OID 24620)
-- Name: paper id_paper; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY paper ALTER COLUMN id_paper SET DEFAULT nextval('paper_id_paper_seq'::regclass);


--
-- TOC entry 3002 (class 2604 OID 24621)
-- Name: publisher id_publisher; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY publisher ALTER COLUMN id_publisher SET DEFAULT nextval('publisher_id_publisher_seq'::regclass);


--
-- TOC entry 3003 (class 2604 OID 24682)
-- Name: report id_report; Type: DEFAULT; Schema: public; Owner: score
--

ALTER TABLE ONLY report ALTER COLUMN id_report SET DEFAULT nextval('report_id_report_seq'::regclass);


--
-- TOC entry 3149 (class 0 OID 24586)
-- Dependencies: 185
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 186
-- Name: author_id_author_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('author_id_author_seq', 0, true);


--
-- TOC entry 3151 (class 0 OID 24591)
-- Dependencies: 187
-- Data for Name: authorpaper; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3152 (class 0 OID 24594)
-- Dependencies: 188
-- Data for Name: conference; Type: TABLE DATA; Schema: public; Owner: score
--

INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (2, 'A-MOST', 'Advances in Model-Based Software Testing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (3, 'ACII', 'Affective Computing and Intelligent Interaction ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (4, 'ACoTA', 'Automated Configuration and Tailoring of Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (5, 'ACSD', 'International Conference on Application of Concurrency to System Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (6, 'ADS', 'Agent-Directed Simulation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (7, 'ADSN', 'Assurance in Grids and Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (8, 'AICCSA', 'ACS/IEEE International Conference on Computer Systems and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (9, 'AICT', 'Advanced Industrial Conference on Telecommunications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (10, 'AIPR', 'Applied Imagery Pattern Recognition Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (11, 'AMT', 'Active Media Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (12, 'ANCS', 'Architectures for Networking and Communications Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (13, 'ANSS', 'Annual Simulation Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (14, 'APBC', 'Asia-Pacific Bioinformatics Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (15, 'APCCAS', 'Asia Pacific Conference on Circuits and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (16, 'APNOMS', 'Asia-Pacific Network Operations and Management Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (17, 'APSCC', 'Asia-Pacific Services Computing Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (18, 'APWCS', 'Asia-Pacific Conference on Wearable Computing Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (19, 'ARES', 'Availability, Reliability and Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (20, 'ASAP', 'Application-Specific Systems, Architectures, and Processors ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (21, 'ASIACCS', 'ACM Symposium on Information, Computer and Communications Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (22, 'ASMTA', 'Analytical and Stochastic Modeling Techniques and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (23, 'ASONAM', 'Advances in Social Networks Analysis and Mining ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (24, 'AST', 'Automation of Software Test ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (25, 'ASWEC', 'Australian Software Engineering Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (26, 'ASYNC', 'Symposium on Asynchronous Circuits and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (27, 'ATC', 'Autonomic and Trusted Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (28, 'ATS', 'Asian Test Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (29, 'AVSS', 'Advanced Video and Signal Based Surveillance ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (30, 'BCB', 'Bioinformatics and Computational Biology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (31, 'BHI', 'Biomedical and Health Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (32, 'BIBE', 'Bioinformatics and Bioengineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (33, 'BIBM', 'Bioinformatics and Biomedicine ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (34, 'BIOKDD', 'Biological Knowledge Discovery and Data Mining ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (35, 'BIOSIG', 'Biometrics and Electronic Signatures ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (36, 'BNCOD', 'British National Conference on Databases ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (37, 'BPS', 'Business Processes Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (38, 'BSN', 'Wearable and Implantable Body Sensor Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (39, 'C5', 'Conference on Creating, Connecting and Collaborating through Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (40, 'CAD/Graphics', 'Computer-Aided Design and Computer Graphics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (41, 'CAMAD', 'Computer Aided Modeling and Design of Communication Links and Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (42, 'CASE', 'Conference on Automation Science and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (43, 'CBMI', 'Content-Based Multimedia Indexing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (44, 'CCE', 'Coordination of Collaborative Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (45, 'CCE', 'International Conference on Electrical Engineering, Computing Science and Automatic Control ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (46, 'CCECE', 'Canadian Conference on Electrical and Computer Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (47, 'CCGRID', 'Cluster Computing and the Grid ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (48, 'CCNC', 'Consumer Communications and Networking Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (49, 'CCP', 'Data Compression, Communications and Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (50, 'CDVE', 'Cooperative Design, Visualization, and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (51, 'CGAMES', 'Computer Games ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (52, 'CGIV', 'Computer Graphics, Imaging and Visualization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (53, 'CGO', 'Symposium on Code Generation and Optimization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (54, 'CHASE', 'Cooperative and Human Aspects of Software Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (55, 'CIBCB', 'Computational Intelligence in Bioinformatics and Computational Biology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (56, 'CICC', 'Custom Integrated Circuits Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (57, 'CIDM', 'Computational Intelligence and Data Mining ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (58, 'CIG', 'Computational Intelligence and Games ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (59, 'CIMCA', 'Computational Intelligence for Modelling, Control and Automation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (60, 'CIRA', 'Computational Intelligence in Robotics and Automation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (61, 'CISIS', 'Computational Intelligence in Security for Information Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (62, 'CISS', 'Conference on Information Sciences and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (63, 'CISSE', 'Computer, Information, and Systems Sciences, and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (64, 'CISWSN', 'Collective Intelligence in Semantic Web and Social Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (65, 'CIT', 'Computer and Information Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (66, 'CITA', 'Conference on Information Technology in Asia ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (67, 'CloudCom', 'Cloud Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (68, 'CLUSTER', 'International Conference on Cluster Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (69, 'CMC', 'Communications and Mobile Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (70, 'CMSB', 'Computational Methods in Systems Biology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (71, 'CNSR', 'Conference on Communication Networks and Services Research ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (72, 'CogART', 'Cognitive Radio and Advanced Spectrum Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (73, 'CompSysTech', 'Computer Systems and Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (74, 'CONIELECOMP', 'International Conference on Electronics, Communications, and Computers ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (75, 'CRV', 'Canadian Conference on Computer and Robot Vision ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (76, 'CSCWD', 'Computer Supported Cooperative Work in Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (77, 'CSE', 'Computational Science and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (78, 'CSF', 'IEEE Computer Security Foundations Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (79, 'CSIE', 'Computer Science and Information Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (80, 'CSMR', 'Conference on Software Maintenance and Reengineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (81, 'CSO', 'Computational Sciences and Optimization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (82, 'CTS', 'Collaboration Technologies and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (83, 'CW', 'Cyberworlds ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (84, 'CyberC', 'Cyber-Enabled Distributed Computing and Knowledge Discovery ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (85, 'DARS', 'Distributed Autonomous Robotic Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (86, 'DASC', 'Dependable Autonomic and Secure Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (87, 'DBLM', 'Database Technology for Data Management in Life Sciences and Medicine ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (88, 'DCAI', 'Distributed Computing and Artificial Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (89, 'DCIBI', 'Database Challenges in Biodiversity Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (90, 'DCOSS', 'Distributed Computing in Sensor Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (91, 'DCperf', 'Data Center Performance ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (92, 'DDECS', 'Design and Diagnostics of Electronic Circuits and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (93, 'DFMA', 'Distributed Frameworks for Multimedia Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (94, 'DFT', 'Defect and Fault Tolerance in VLSI and Nanotechnology Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (95, 'DICTA', 'Digital Image Computing:Techniques and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (96, 'DICTAP', 'Digital Information and Communication Technology and Its Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (97, 'DMO', 'Data Mining and Optimization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (98, 'DMVE', 'Data Management in Virtual Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (99, 'DRCN', 'Design of Reliable Communication Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (100, 'DS-RT', 'Distributed Simulation and Real-Time Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (101, 'DSD', 'Digital Systems Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (102, 'DSDE', 'Data Storage and Data Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (103, 'DSN', 'Dependable Systems and Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (104, 'DSOM', 'Distributed Systems:Operations and Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (105, 'E-Science', 'e-Science and Grid Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (106, 'ECOWS', 'European Conference on Web Services ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (107, 'ECSA', 'European Conference on Software Architecture ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (108, 'EDACS', 'Embedded Data-Centric Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (109, 'EDCC', 'European Dependable Computing Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (110, 'EDOC', 'Enterprise Distributed Object Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (111, 'EGPGV', 'Eurographics Workshop on Parallel Graphics and Visualization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (112, 'eHealth', 'Electronic Healthcare ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (113, 'EISIC', 'European Intelligence and Security Informatics Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (114, 'EIT', 'Electro/Information Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (115, 'EmbeddedCom', 'International Conference on Embedded Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (116, 'ENC', 'Mexican International Conference on Computer Science ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (117, 'ESEM', 'Empirical Software Engineering and Measurement ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (118, 'ESTIMedia', 'Embedded Systems for Real-Time Multimedia ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (119, 'eTELEMED', 'International Conference on eHealth, Telemedicine, and Social Medicine ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (120, 'ETFA', 'Emerging Technologies and Factory Automation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (121, 'ETS', 'European Test Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (122, 'EUC', 'Embedded and Ubiquitous Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (123, 'EUROCON', 'Conference on Computer as a Tool ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (124, 'EuroSSC', 'European Conference on Smart Sensing and Context ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (125, 'EuroVis', 'Joint Eurographics/IEEE-VGTC Symposium on Visualization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (126, 'FCCM', 'Field-Programmable Custom Computing Machines ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (127, 'FCST', 'Frontier of Computer Science and Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (128, 'FDL', 'Forum on specification and Design Languages ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (129, 'FedCSIS', 'Federated Conference on Computer Science and Information Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (130, 'FIT', 'Frontiers of Information Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (131, 'FlexDBIST', 'Flexible Database and Information Systems Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (132, 'FMCAD', 'Formal Methods in Computer-Aided Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (133, 'FMN', 'Future Multimedia Networking ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (134, 'FOCI', 'Foundations of Computational Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (135, 'FOCS', 'Foundations of Computer Science ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (136, 'FPL', 'Field-Programmable Logic and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (137, 'FUZZ-IEEE', 'IEEE International Conference on Fuzzy Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (138, 'GCC', 'Grid and Cooperative Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (139, 'GCE', 'Grid Computing Environments ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (140, 'GD', 'Graph Drawing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (141, 'GHTC', 'Global Humanitarian Technology Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (142, 'GLOBECOM', 'Global Communications Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (143, 'GrC', 'Granular Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (144, 'GreenCom', 'Green Computing and Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (145, 'GRID', 'Grid Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (146, 'HAI', 'Human Aspects in Ambient Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (147, 'HBU', 'Human Behavior Unterstanding ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (148, 'HiPC', 'High Performance Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (149, 'HIS', 'Hybrid Intelligent Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (150, 'HISB', 'Healthcare Informatics, Imaging and Systems Biology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (151, 'HLDVT', 'High Level Design Validation and Test ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (152, 'HoloMAS', 'Holonic and Multi-Agent Systems for Manufacturing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (153, 'HOST', 'Hardware-Oriented Security and Trust ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (154, 'HOTI', 'High Performance Interconnects ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (155, 'HPCA', 'High-Performance Computer Architecture ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (156, 'HPCC', 'High Performance Computing and Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (157, 'HPCS', 'High Performance Computing Systems and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (158, 'HRI', 'Human-Robot Interaction ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (159, 'HRPR', 'Human-Robot Personal Relationships ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (160, 'IA', 'Intelligent Agents ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (161, 'IALP', 'International Conference on Asian Language Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (162, 'IAS', 'Information Assurance and Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (163, 'IAS', 'Annual Meeting of the IEEE Industry Applications Society ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (164, 'IAT', 'International Agent Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (165, 'IAWTIC', 'Intelligent Agents, Web Technologies and Internet Commerce ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (166, 'IC3', 'International Conference on Contemporary Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (167, 'ICA3PP', 'International Conference on Algorithms and Architectures for Parallel Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (168, 'ICAART', 'International Conference on Agents and Artificial Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (169, 'ICAC', 'International Conference on Automation and Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (170, 'ICAL', 'International Conference on Automation and Logistics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (171, 'ICALT', 'International Conference on Advanced Learning Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (172, 'ICARA', 'International Conference on Automation, Robotics and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (173, 'ICARCV', 'International Conference on Control, Automation, Robotics and Vision ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (174, 'ICB', 'International Conference on Biometrics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (175, 'ICC', 'International Conference on Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (176, 'ICCA', 'International Conference on Control and Automation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (177, 'ICCABS', 'International Conference on Computational Advances in Bio and Medical Sciences ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (178, 'ICCCI', 'International Conference on Computational Collective Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (179, 'ICCD', 'International Conference on Computer Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (180, 'ICCE', 'International Conference on Computers in Education ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (181, 'ICCI', 'International Conference on Cognitive Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (182, 'ICCMS', 'International Conference on Computer Modeling and Simulation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (183, 'ICCPS', 'International Conference on Cyber-Physical Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (184, 'ICCSCE', 'International Conference on Control System, Computing and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (185, 'ICDE', 'International Conference on Data Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (186, 'ICDIM', 'International Conference on Digital Information Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (187, 'ICDM', 'International Conference on Data Mining ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (188, 'ICEBE', 'International Conference on e-Business Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (189, 'ICECCS', 'International Conference on Engineering of Complex Computer Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (190, 'ICECS', 'International Conference on Electronics, Circuits, and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (191, 'ICEEI', 'International Conference on Electrical Engineering and Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (192, 'ICESS', 'International Conference on Embedded Software and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (193, 'ICETE', 'International Conference on E-Business and Telecommunication Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (194, 'ICGSE', 'International Conference on Global Software Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (195, 'ICGT', 'International Conference on Graph Transformation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (196, 'ICHL', 'International Conference on Hybrid Learning and Education ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (197, 'ICIP', 'International Conference on Image Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (198, 'ICIT', 'International Conference in Information Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (199, 'ICITST', 'International Conference for Internet Technology and Secured Transactions ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (200, 'ICMCS', 'International Conference on Multimedia Computing and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (201, 'ICMENS', 'International Conference on MEMS, NANO, and Smart Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (202, 'ICMLC', 'International Conference on Machine Learning and Cybernetics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (203, 'ICNC', 'International Conference on Natural Computation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (204, 'ICNSC', 'International Conference on Networking, Sensing and Control ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (205, 'ICOIN', 'International Conference on Information Networking ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (206, 'ICON', 'International Conference on Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (207, 'ICPADS', 'International Conference on Parallel and Distributed Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (208, 'ICPC', 'International Conference on Program Comprehension ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (209, 'ICPS', 'International Conference on Pervasive Services ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (210, 'ICQT', 'Internet Charging and QoS Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (211, 'ICRA', 'International Conference on Robotics and Automation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (212, 'ICSC', 'International Conference on Semantic Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (213, 'ICSDM', 'International Conference on Spatial Data Mining and Geographical Knowledge Services ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (214, 'ICSEng', 'International Conference on Systems Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (215, 'ICSI', 'International Conference on Swarm Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (216, 'ICSIPA', 'International Conference on Signal and Image Processing Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (217, 'ICSM', 'International Conference on Software Maintenance ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (218, 'ICST', 'International Conference on Software Testing, Verification, and Validation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (219, 'ICT', 'International Conference on Telecommunications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (220, 'ICUMT', 'International Conference on Ultra Modern Telecommunications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (221, 'IE', 'Australasian Conference on Interactive Entertainment ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (222, 'IE', 'Intelligent Environments ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (223, 'IGARSS', 'International Geoscience and Remote Sensing Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (224, 'IIH-MSP', 'Intelligent Information Hiding and Multimedia Signal Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (225, 'IISWC', 'IEEE International Symposium on Workload Characterization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (226, 'IITA', 'Intelligent Information Technology Application ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (227, 'IJCNN', 'International Joint Conference on Neural Network ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (228, 'IM', 'Integrated Network Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (229, 'IMC', 'Internet Measurement Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (230, 'IMPRESS', 'Interactive Multimodal Pattern Recognition in Embedded Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (231, 'INCoS', 'Intelligent Networking and Collaborative Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (232, 'INFOCOM', 'International Conference on Computer Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (233, 'INFOVIS', 'IEEE Symposium on Information Visualization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (234, 'IOLTS', 'International On-Line Testing Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (235, 'IPCC', 'International Professional Communication Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (236, 'IPCCC', 'International Performance, Computing, and Communications Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (237, 'IPOM', 'IP Operations and Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (238, 'IPSN', 'Information Processing in Sensor Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (239, 'IPTC', 'Information Processing and Trusted Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (240, 'IRI', 'Information Reuse and Integration ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (241, 'IS', 'Intelligent Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (242, 'ISA', 'Information Security and Assurance ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (243, 'ISBI', 'International Symposium on Biomedical Imaging ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (244, 'ISBRA', 'International Symposium on Bioinformatics Research and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (245, 'ISCC', 'International Symposium on Computers and Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (246, 'ISDA', 'Intelligent Systems Design and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (247, 'ISI', 'Intelligence and Security Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (248, 'ISM', 'International Symposium on Multimedia ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (249, 'ISMAR', 'International Symposium on Mixed and Augmented Reality ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (250, 'ISMVL', 'International Symposium on Multiple-Valued Logic ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (251, 'ISORC', 'International Symposium on Object/Component/Service-Oriented Real-Time Distributed Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (252, 'ISPA', 'International Symposium on Parallel and Distributed Processing and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (253, 'ISPASS', 'International Symposium on Performance Analysis of Systems and Software ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (254, 'ISQED', 'International Symposium on Quality Electronic Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (255, 'ISSA', 'Information Security for South Africa ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (256, 'ISSPA', 'Information Sciences, Signal Processing and their Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (257, 'ISSPIT', 'International Symposium on Signal Processing and Information Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (258, 'ISSRE', 'International Symposium on Software Reliability Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (259, 'ISVLSI', 'IEEE Computer Society Annual Symposium on VLSI ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (260, 'ISWCS', 'International Symposium on Wireless Communication Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (261, 'ITI', 'Information Technology Interfaces ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (262, 'ITNG', 'International Conference on Information Technology:New Generations ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (263, 'IWCMC', 'International Conference on Wireless Communications and Mobile Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (264, 'IWQoS', 'International Workshop on Quality of Service ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (265, 'IWSC', 'International Workshop on Software Clones ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (266, 'JCDL', 'ACM/IEEE Joint Conference on Digital Libraries ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (267, 'KSE', 'Knowledge and Systems Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (268, 'LA-WEB', 'Latin American Web Congress ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (269, 'LADC', 'Latin-American Symposium on Dependable Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (270, 'LCN', 'Local Computer Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (271, 'MACE', 'Modelling Autonomic Communications Environments ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (272, 'MASS', 'Mobile Adhoc and Sensor Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (273, 'MATES', 'Multiagent System Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (274, 'MCS', 'Meta-Synthesis and Complex Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (275, 'MDM', 'Mobile Data Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (276, 'MDMM', 'Multimedia Data Mining and Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (277, 'MEMOCODE', 'International Conference on Formal Methods and Models for Co-Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (278, 'MICAI', 'Mexican International Conference on Artificial Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (279, 'MOBILWARE', 'Mobile Wireless Middleware, Operating Systems, and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (280, 'MobiMedia', 'International Conference on Mobile Multimedia Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (281, 'MobiSys', 'International Conference on Mobile Systems, Applications, and Services ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (282, 'MOMPES', 'Model-based Methodologies for Pervasive and Embedded Software ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (283, 'MONAMI', 'Mobile Networks and Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (284, 'MoViX', 'Modelling and Visualization of XML and Semantic Web Data ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (285, 'MS', 'Multimedia Semantics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (286, 'MSE', 'Microelectronics Systems Education ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (287, 'MSN', 'Mobile Ad-hoc and Sensor Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (288, 'MSST', 'IEEE Conference on Mass Storage Systems and Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (289, 'MTAGS', 'Many-Task Computing on Grids and Supercomputers ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (290, 'MVA', 'Machine Vision Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (291, 'NAS', 'Networking, Architecture and Storages ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (292, 'NATW', 'North Atlantic Test Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (293, 'NCA', 'Network Computing and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (294, 'NEMS', 'Nano/Micro Engineered and Molecular Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (295, 'NESEA', 'Networked Embedded Systems for Enterprise Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (296, 'NETGAMES', 'Network and System Support for Games ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (297, 'NGMAST', 'Next Generation Mobile Applications, Services and Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (298, 'NLPKE', 'Natural Language Processing and Knowledge Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (299, 'NOCS', 'Networks-on-Chips ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (300, 'NSS', 'Network and System Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (301, 'NTMS', 'New Technologies, Mobility and Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (302, 'OMBI', 'Opinion Mining for Business Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (303, 'ONDM', 'Optical Network Design and Modelling ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (304, 'P2P', 'International Conference on Peer-to-Peer Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (305, 'PacificVis', 'IEEE Pacific Visualization Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (306, 'PACIIA', 'Pacific-Asia Workshop on Computational Intelligence and Industrial Application ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (307, 'PAISI', 'Pacific Asia Workshop on Intelligence and Security Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (308, 'PCI', 'Panhellenic Conference on Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (309, 'PDCAT', 'Parallel and Distributed Computing:Applications and Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (310, 'PDP', 'Parallel, Distributed and Network-Based Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (311, 'PDPTA', 'Parallel and Distributed Processing Techniques and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (312, 'PDSW', 'Petascale Data Storage Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (313, 'PIMRC', 'Personal, Indoor and Mobile Radio Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (314, 'POLICY', 'Policies for Distributed Systems and Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (315, 'PRDC', 'Pacific Rim International Symposium on Dependable Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (316, 'PST', 'Conference on Privacy, Security and Trust ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (317, 'QSHINE', 'Quality of Service in Heterogeneous Wired/Wireless Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (318, 'QSIC', 'International Conference on Quality Software ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (319, 'QUATIC', 'Quality of Information and Communications Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (320, 'RAW', 'Reconfigurable Architectures Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (321, 'RCIS', 'Research Challenges in Information Science ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (322, 'RE', 'Requirements Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (323, 'ReConFig', 'Reconfigurable Computing and FPGAs ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (324, 'ReCoSoC', 'Reconfigurable Communication-centric Systems-on-Chip ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (325, 'RFID-TA', 'RFID-Technologies and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (326, 'RIVF', 'Rencontres en Informatique Vietnam-France ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (327, 'RO-MAN', 'Robot and Human Interactive Communication ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (328, 'ROBOTIK', 'German Conference on Robotics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (329, 'RSP', 'Rapid System Prototyping ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (330, 'RSS', 'Robotics:Science and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (331, 'RTAS', 'Real Time Technology and Applications Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (332, 'RTCSA', 'Embedded and Real-Time Computing Systems and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (333, 'SACI', 'Symposium on Applied Computational Intelligence and Informatics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (334, 'SAHNS', 'Specialized Ad Hoc Networks and Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (335, 'SAINT', 'Symposium on Applications and the Internet ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (336, 'SAMOS', 'International Conference / Workshop on Embedded Computer Systems:Architectures, Modeling and Simulation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (337, 'SASO', 'Self-Adaptive and Self-Organizing Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (338, 'SASP', 'Symposium on Application Specific Processors ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (339, 'SBAC-PAD', 'Symposium on Computer Architecture and High Performance Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (340, 'SBCCI', 'Symposium on Integrated Circuits and Systems Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (341, 'ScalCom', 'International Conference on Scalable Computing and Communications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (342, 'SCAM', 'Source Code Analysis and Manipulation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (343, 'SCCC', 'International Conference of the Chilean Computer Science Society ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (344, 'SEAA', 'Software Engineering and Advanced Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (345, 'SEAL', 'Simulated Evolution and Learning ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (346, 'SEAMS', 'Software Engineering for Adaptive and Self-Managing Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (347, 'SECON', 'Sensor, Mesh and Ad Hoc Communications and Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (348, 'SECURWARE', 'International Conference on Emerging Security Information, Systems and Technologies ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (349, 'SeGAH', 'Serious Games and Applications for Health ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (350, 'SERA', 'Software Engineering Research and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (351, 'SEUS', 'Software Technologies for Embedded and Ubiquitous Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (352, 'SEW', 'Annual Software Engineering Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (353, 'SHARK', 'Sharing and Reusing Architectural Knowledge ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (354, 'SIES', 'International Symposium on Industrial Embedded Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (355, 'SIMPLEX', 'Simplifying Complex Networks for Practitioners ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (356, 'SiPS', 'Signal Processing Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (357, 'SITIS', 'Signal-Image Technology and Internet-Based Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (358, 'SKG', 'Semantics, Knowledge and Grid ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (359, 'SLIP', 'System-Level Interconnect Prediction ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (360, 'SLT', 'Spoken Language Technology Workshop ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (361, 'SMARTGREENS', 'International Conference on Smart Grids and Green IT Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (362, 'SN', 'Sensor Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (363, 'SOCA', 'Service-Oriented Computing and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (364, 'SocialCom', 'International Conference on Social Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (365, 'SOCO', 'Soft Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (366, 'SOFTVIS', 'Software Visualization ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (367, 'SPattern', 'Secure Systems Methodologies Using Patterns ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (368, 'SpringSim', 'Spring Simulation Multiconference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (369, 'SRDS', 'Symposium on Reliable Distributed Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (370, 'SSIAI', 'Southwest Symposium on Image Analysis and Interpretation ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (371, 'SSIRI', 'Secure Software Integration and Reliability Improvement ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (372, 'SSME', 'Services Science, Management and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (373, 'SUTC', 'Sensor Networks, Ubiquitous, and Trustworthy Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (374, 'SwSTE', 'Software - Science, Technology and Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (375, 'SYNASC', 'Symbolic and Numeric Algorithms for Scientific Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (376, 'Tabletop', 'Workshop on Tabletops and Interactive Surfaces ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (377, 'TAMoCo', 'Techniques and Applications for Mobile Commerce ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (378, 'TEAR', 'Trends in Enterprise Architecture Research ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (379, 'TIR', 'Text-based Information Retrieval ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (380, 'TMA', 'Traffic Monitoring and Analysis ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (381, 'TSP', 'Telecommunications and Signal Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (382, 'UCC', 'Utility and Cloud Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (383, 'UCS', 'Ubiquitous Computing Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (384, 'UIC', 'Ubiquitous Intelligence and Computing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (385, 'UPGRADE-CN', 'Use of P2P, GRID and Agents for the Development of Content Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (386, 'VAST', 'Visual Analytics Science and Technology ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (387, 'VCIP', 'Visual Communications and Image Processing ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (388, 'VISM', 'Visualization and Information Security Management ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (389, 'VISSOFT', 'Visualizing Software for Understanding and Analysis ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (390, 'VizSEC', 'Visualization for Computer Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (391, 'VLSI-SOC', 'Very Large Scale Integration of System-on-Chip ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (392, 'VLSID', 'International Conference on VLSI Design ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (393, 'VNC', 'Vehicular Networking Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (394, 'VR', 'IEEE Virtual Reality Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (395, 'VS-GAMES', 'Games and Virtual Worlds for Serious Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (396, 'VSMM', 'Virtual Systems and MultiMedia ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (397, 'VTC', 'Vehicular Technology Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (398, 'VTS', 'VLSI Test Symposium ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (399, 'WACV', 'Workshop on Applications of Computer Vision ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (400, 'WASA', 'Wireless Algorithms, Systems, and Applications ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (401, 'WASPAA', 'Workshop on Applications of Signal Processing to Audio and Acoustics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (402, 'WCNIS', 'Wireless Communications, Networking and Information Security ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (403, 'WCPS', 'Workshop on Cyber-Physical Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (404, 'WCRE', 'Working Conference on Reverse Engineering ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (405, 'WebPRES', 'Web Personalization and Recommender Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (406, 'WebS', 'Web Semantics ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (407, 'WETICE', 'Workshops on Enabling Technologies:Infrastracture for Collaborative Enterprises ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (408, 'WHPCF', 'High Performance Computational Finance ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (409, 'WI', 'Web Intelligence ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (410, 'WIAMIS', 'Workshop on Image Analysis for Multimedia Interactive Services ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (411, 'WICSA', 'Working IEEE/IFIP Conference on Software Architecture ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (412, 'WiMAN', 'Wireless Mesh and Ad Hoc Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (413, 'WiOpt', 'Modeling and Optimization in Mobile, Ad-Hoc and Wireless Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (414, 'WISES', 'Workshop on Intelligent Solutions in Embedded Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (415, 'WISM', 'Web Information Systems and Mining ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (416, 'WLIAMAS', 'Workshop on Logics for Intelligent Agents and Multi-agent Systems ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (417, 'WMUTE', 'Wireless, Mobile and Ubiquitous Technologies in Education ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (418, 'WOCC', 'Wireless and Optical Communications Conference ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (419, 'WONS', 'Wireless on Demand Network Systems and Service ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (420, 'WORKS', 'Workflows in Support of Large-Scale Science ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (421, 'WoT', 'Web of Things ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (422, 'WoWMoM', 'World of Wireless, Mobile and Multimedia Networks ');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (423, 'WPMC', 'Wireless Personal Multimedia Communications');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (424, 'WPNC', 'Workshop on Positioning Navigation and Communication');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (425, 'WSC', 'Winter Simulation Conference');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (426, 'WSE', 'Symposium on Web Systems Evolution');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (427, 'WWV', 'Workshop on Automated Specification and Verification of Web Sites');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (428, 'avg', 'Testeste');
INSERT INTO conference (id_conference, acronym_conference, name_conference) VALUES (431, 'avg', 'Testesteee');


--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 189
-- Name: conference_id_conference_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('conference_id_conference_seq', 431, true);


--
-- TOC entry 3154 (class 0 OID 24599)
-- Dependencies: 190
-- Data for Name: edition; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 191
-- Name: edition_id_edition_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('edition_id_edition_seq', 1, false);


--
-- TOC entry 3156 (class 0 OID 24604)
-- Dependencies: 192
-- Data for Name: paper; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 193
-- Name: paper_id_paper_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('paper_id_paper_seq', 0, true);


--
-- TOC entry 3158 (class 0 OID 24609)
-- Dependencies: 194
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 195
-- Name: publisher_id_publisher_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('publisher_id_publisher_seq', 1, false);


--
-- TOC entry 3161 (class 0 OID 24679)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: score
--



--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 196
-- Name: report_id_report_seq; Type: SEQUENCE SET; Schema: public; Owner: score
--

SELECT pg_catalog.setval('report_id_report_seq', 1, false);


--
-- TOC entry 3005 (class 2606 OID 24623)
-- Name: author author_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id_author);


--
-- TOC entry 3009 (class 2606 OID 24625)
-- Name: authorpaper authorpaper_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_pkey PRIMARY KEY (id_author, id_paper);


--
-- TOC entry 3011 (class 2606 OID 24627)
-- Name: conference conference_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY conference
    ADD CONSTRAINT conference_pkey PRIMARY KEY (id_conference);


--
-- TOC entry 3015 (class 2606 OID 24629)
-- Name: edition edition_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY edition
    ADD CONSTRAINT edition_pkey PRIMARY KEY (id_edition);


--
-- TOC entry 3007 (class 2606 OID 24631)
-- Name: author name_author_un; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY author
    ADD CONSTRAINT name_author_un UNIQUE (name_author);


--
-- TOC entry 3013 (class 2606 OID 24633)
-- Name: conference name_un; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY conference
    ADD CONSTRAINT name_un UNIQUE (name_conference);


--
-- TOC entry 3017 (class 2606 OID 24635)
-- Name: paper paper_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT paper_pkey PRIMARY KEY (id_paper);


--
-- TOC entry 3019 (class 2606 OID 24637)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id_publisher);


--
-- TOC entry 3021 (class 2606 OID 24687)
-- Name: report report_pkey; Type: CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id_report);


--
-- TOC entry 3022 (class 2606 OID 24638)
-- Name: authorpaper authorpaper_id_author_fkey; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_id_author_fkey FOREIGN KEY (id_author) REFERENCES author(id_author);


--
-- TOC entry 3023 (class 2606 OID 24643)
-- Name: authorpaper authorpaper_id_paper_fkey; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY authorpaper
    ADD CONSTRAINT authorpaper_id_paper_fkey FOREIGN KEY (id_paper) REFERENCES paper(id_paper);


--
-- TOC entry 3026 (class 2606 OID 24648)
-- Name: paper id_conference; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT id_conference FOREIGN KEY (conference_paper) REFERENCES conference(id_conference);


--
-- TOC entry 3024 (class 2606 OID 24653)
-- Name: edition id_conference; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY edition
    ADD CONSTRAINT id_conference FOREIGN KEY (conference_edition) REFERENCES conference(id_conference);


--
-- TOC entry 3029 (class 2606 OID 24688)
-- Name: report id_conference; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY report
    ADD CONSTRAINT id_conference FOREIGN KEY (id_conference) REFERENCES conference(id_conference);


--
-- TOC entry 3027 (class 2606 OID 24658)
-- Name: paper id_edition; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT id_edition FOREIGN KEY (edition_paper) REFERENCES edition(id_edition);


--
-- TOC entry 3030 (class 2606 OID 24693)
-- Name: report id_edition; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY report
    ADD CONSTRAINT id_edition FOREIGN KEY (id_edition) REFERENCES edition(id_edition);


--
-- TOC entry 3031 (class 2606 OID 24698)
-- Name: report id_paper; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY report
    ADD CONSTRAINT id_paper FOREIGN KEY (id_paper) REFERENCES paper(id_paper);


--
-- TOC entry 3028 (class 2606 OID 24663)
-- Name: paper id_publisher; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY paper
    ADD CONSTRAINT id_publisher FOREIGN KEY (publisher_paper) REFERENCES publisher(id_publisher);


--
-- TOC entry 3025 (class 2606 OID 24668)
-- Name: edition id_publisher; Type: FK CONSTRAINT; Schema: public; Owner: score
--

ALTER TABLE ONLY edition
    ADD CONSTRAINT id_publisher FOREIGN KEY (publisher_edition) REFERENCES publisher(id_publisher);


--
-- TOC entry 3168 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO score;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-01-08 14:02:49 -03

--
-- PostgreSQL database dump complete
--

