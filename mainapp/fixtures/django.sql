--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-18 00:39:45

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

DROP DATABASE django;
--
-- TOC entry 3173 (class 1262 OID 16394)
-- Name: django; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE django WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';


ALTER DATABASE django OWNER TO postgres;

\connect django

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
-- TOC entry 207 (class 1259 OID 16426)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group
(
    id   integer                NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group
    OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16424)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq
    OWNER TO postgres;

--
-- TOC entry 3174 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 209 (class 1259 OID 16436)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions
(
    id            integer NOT NULL,
    group_id      integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions
    OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16434)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq
    OWNER TO postgres;

--
-- TOC entry 3175 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 205 (class 1259 OID 16418)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission
(
    id              integer                NOT NULL,
    name            character varying(255) NOT NULL,
    content_type_id integer                NOT NULL,
    codename        character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission
    OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16416)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq
    OWNER TO postgres;

--
-- TOC entry 3176 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 211 (class 1259 OID 16470)
-- Name: authapp_shopuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_shopuser
(
    id                   integer                  NOT NULL,
    password             character varying(128)   NOT NULL,
    last_login           timestamp with time zone,
    is_superuser         boolean                  NOT NULL,
    username             character varying(150)   NOT NULL,
    first_name           character varying(30)    NOT NULL,
    last_name            character varying(150)   NOT NULL,
    email                character varying(254)   NOT NULL,
    is_staff             boolean                  NOT NULL,
    is_active            boolean                  NOT NULL,
    date_joined          timestamp with time zone NOT NULL,
    avatar               character varying(100)   NOT NULL,
    age                  integer,
    birthday             date,
    activate_key         character varying(128),
    activate_key_expires timestamp with time zone NOT NULL,
    CONSTRAINT authapp_shopuser_age_check CHECK ((age >= 0))
);


ALTER TABLE public.authapp_shopuser
    OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16484)
-- Name: authapp_shopuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_shopuser_groups
(
    id          integer NOT NULL,
    shopuser_id integer NOT NULL,
    group_id    integer NOT NULL
);


ALTER TABLE public.authapp_shopuser_groups
    OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16482)
-- Name: authapp_shopuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_shopuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_shopuser_groups_id_seq
    OWNER TO postgres;

--
-- TOC entry 3177 (class 0 OID 0)
-- Dependencies: 212
-- Name: authapp_shopuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_shopuser_groups_id_seq OWNED BY public.authapp_shopuser_groups.id;


--
-- TOC entry 210 (class 1259 OID 16468)
-- Name: authapp_shopuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_shopuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_shopuser_id_seq
    OWNER TO postgres;

--
-- TOC entry 3178 (class 0 OID 0)
-- Dependencies: 210
-- Name: authapp_shopuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_shopuser_id_seq OWNED BY public.authapp_shopuser.id;


--
-- TOC entry 215 (class 1259 OID 16492)
-- Name: authapp_shopuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authapp_shopuser_user_permissions
(
    id            integer NOT NULL,
    shopuser_id   integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.authapp_shopuser_user_permissions
    OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16490)
-- Name: authapp_shopuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authapp_shopuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authapp_shopuser_user_permissions_id_seq
    OWNER TO postgres;

--
-- TOC entry 3179 (class 0 OID 0)
-- Dependencies: 214
-- Name: authapp_shopuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authapp_shopuser_user_permissions_id_seq OWNED BY public.authapp_shopuser_user_permissions.id;


--
-- TOC entry 223 (class 1259 OID 16585)
-- Name: basketapp_basket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basketapp_basket
(
    id           integer                  NOT NULL,
    quantity     integer                  NOT NULL,
    add_datetime timestamp with time zone NOT NULL,
    product_id   integer                  NOT NULL,
    user_id      integer                  NOT NULL,
    CONSTRAINT basketapp_basket_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.basketapp_basket
    OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16583)
-- Name: basketapp_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basketapp_basket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basketapp_basket_id_seq
    OWNER TO postgres;

--
-- TOC entry 3180 (class 0 OID 0)
-- Dependencies: 222
-- Name: basketapp_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basketapp_basket_id_seq OWNED BY public.basketapp_basket.id;


--
-- TOC entry 217 (class 1259 OID 16529)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log
(
    id              integer                  NOT NULL,
    action_time     timestamp with time zone NOT NULL,
    object_id       text,
    object_repr     character varying(200)   NOT NULL,
    action_flag     smallint                 NOT NULL,
    change_message  text                     NOT NULL,
    content_type_id integer,
    user_id         integer                  NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log
    OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16527)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq
    OWNER TO postgres;

--
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 203 (class 1259 OID 16408)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type
(
    id        integer                NOT NULL,
    app_label character varying(100) NOT NULL,
    model     character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type
    OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16406)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq
    OWNER TO postgres;

--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 201 (class 1259 OID 16397)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations
(
    id      integer                  NOT NULL,
    app     character varying(255)   NOT NULL,
    name    character varying(255)   NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations
    OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq
    OWNER TO postgres;

--
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 224 (class 1259 OID 16604)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session
(
    session_key  character varying(40)    NOT NULL,
    session_data text                     NOT NULL,
    expire_date  timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session
    OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16566)
-- Name: mainapp_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_product
(
    uid         integer                NOT NULL,
    name        character varying(128) NOT NULL,
    image       character varying(100) NOT NULL,
    short_desc  character varying(60)  NOT NULL,
    description text                   NOT NULL,
    price       numeric(8, 2)          NOT NULL,
    quantity    integer                NOT NULL,
    category_id integer                NOT NULL,
    is_active   boolean                NOT NULL,
    CONSTRAINT mainapp_product_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.mainapp_product
    OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16564)
-- Name: mainapp_product_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_product_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_product_uid_seq
    OWNER TO postgres;

--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 220
-- Name: mainapp_product_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_product_uid_seq OWNED BY public.mainapp_product.uid;


--
-- TOC entry 219 (class 1259 OID 16553)
-- Name: mainapp_productcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mainapp_productcategory
(
    uid         integer               NOT NULL,
    name        character varying(64) NOT NULL,
    description text                  NOT NULL,
    is_active   boolean               NOT NULL
);


ALTER TABLE public.mainapp_productcategory
    OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16551)
-- Name: mainapp_productcategory_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mainapp_productcategory_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mainapp_productcategory_uid_seq
    OWNER TO postgres;

--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 218
-- Name: mainapp_productcategory_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mainapp_productcategory_uid_seq OWNED BY public.mainapp_productcategory.uid;


--
-- TOC entry 2929 (class 2604 OID 16429)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 16439)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 16421)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 16473)
-- Name: authapp_shopuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser
    ALTER COLUMN id SET DEFAULT nextval('public.authapp_shopuser_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 16487)
-- Name: authapp_shopuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_groups
    ALTER COLUMN id SET DEFAULT nextval('public.authapp_shopuser_groups_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 16495)
-- Name: authapp_shopuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_user_permissions
    ALTER COLUMN id SET DEFAULT nextval('public.authapp_shopuser_user_permissions_id_seq'::regclass);


--
-- TOC entry 2940 (class 2604 OID 16588)
-- Name: basketapp_basket id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketapp_basket
    ALTER COLUMN id SET DEFAULT nextval('public.basketapp_basket_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 16532)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 16411)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 16400)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 16569)
-- Name: mainapp_product uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_product
    ALTER COLUMN uid SET DEFAULT nextval('public.mainapp_product_uid_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 16556)
-- Name: mainapp_productcategory uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_productcategory
    ALTER COLUMN uid SET DEFAULT nextval('public.mainapp_productcategory_uid_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 16426)
-- Dependencies: 207
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3152 (class 0 OID 16436)
-- Dependencies: 209
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3148 (class 0 OID 16418)
-- Dependencies: 205
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (21, 'Can add product category', 6, 'add_productcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (22, 'Can change product category', 6, 'change_productcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (23, 'Can delete product category', 6, 'delete_productcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (24, 'Can view product category', 6, 'view_productcategory');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (25, 'Can add product', 7, 'add_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (26, 'Can change product', 7, 'change_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (27, 'Can delete product', 7, 'delete_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (28, 'Can view product', 7, 'view_product');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (29, 'Can add user', 8, 'add_shopuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (30, 'Can change user', 8, 'change_shopuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (31, 'Can delete user', 8, 'delete_shopuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (32, 'Can view user', 8, 'view_shopuser');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (33, 'Can add basket', 9, 'add_basket');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (34, 'Can change basket', 9, 'change_basket');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (35, 'Can delete basket', 9, 'delete_basket');
INSERT INTO public.auth_permission (id, name, content_type_id, codename)
VALUES (36, 'Can view basket', 9, 'view_basket');


--
-- TOC entry 3154 (class 0 OID 16470)
-- Dependencies: 211
-- Data for Name: authapp_shopuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.authapp_shopuser (id, password, last_login, is_superuser, username, first_name, last_name, email,
                                     is_staff, is_active, date_joined, avatar, age, birthday, activate_key,
                                     activate_key_expires)
VALUES (1, 'pbkdf2_sha256$150000$2cekHcuy9NAg$zVHceAgCbSUjBHpkyVvOHQrPlWpPjIGSv8yByedoJGk=',
        '2021-01-17 23:53:27.703057+03', true, 'admin', 'Виталий', 'Шакиров', 'shakirov.vitaliy@gmail.com', true, true,
        '2020-12-10 16:18:31+03', 'users_avatars/admin.jpg', 38, '1981-12-30', '', '2021-01-19 22:18:57.421583+03');
INSERT INTO public.authapp_shopuser (id, password, last_login, is_superuser, username, first_name, last_name, email,
                                     is_staff, is_active, date_joined, avatar, age, birthday, activate_key,
                                     activate_key_expires)
VALUES (20, 'pbkdf2_sha256$150000$vtzh6Aa3VhpM$GIUOsbXnC6B7YSWQb91qJs8+KxeyQsX+boB8SJsdmT4=',
        '2021-01-18 00:26:58.643038+03', false, 'GeekBrains', 'GeekBrains', 'GeekBrains', '123@123.ru', false, true,
        '2021-01-18 00:26:39.732389+03', '', 34, NULL, NULL, '2021-01-20 00:15:31.747735+03');


--
-- TOC entry 3156 (class 0 OID 16484)
-- Dependencies: 213
-- Data for Name: authapp_shopuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3158 (class 0 OID 16492)
-- Dependencies: 215
-- Data for Name: authapp_shopuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 3166 (class 0 OID 16585)
-- Dependencies: 223
-- Data for Name: basketapp_basket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.basketapp_basket (id, quantity, add_datetime, product_id, user_id)
VALUES (104, 1, '2021-01-18 00:16:31.240435+03', 26, 1);


--
-- TOC entry 3160 (class 0 OID 16529)
-- Dependencies: 217
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (1, '2020-12-24 22:11:18.359103+03', '8', 'Электроника', 2, '[]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (2, '2020-12-24 22:53:49.978178+03', '9', 'Какая то  хрень', 3, '', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (3, '2020-12-24 23:28:47.168813+03', '10', 'Зоотовары', 2, '[]', 6, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (4, '2020-12-24 23:47:04.420703+03', '4', 'GeekBrains', 2,
        '[{"changed": {"fields": ["password", "is_superuser"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (5, '2020-12-25 20:09:19.644506+03', '4', 'GeekBrains', 2, '[{"changed": {"fields": ["is_superuser"]}}]', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (6, '2021-01-17 22:57:58.460933+03', '12', 'GeekBrains2254', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (7, '2021-01-17 22:58:06.843535+03', '11', 'GeekBrains22', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (8, '2021-01-17 22:58:13.970848+03', '10', 'GeekBrains2', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (9, '2021-01-17 23:07:44.293421+03', '15', 'mylistjk564', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (10, '2021-01-17 23:07:49.588276+03', '14', 'mylistjk', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (11, '2021-01-17 23:07:54.868662+03', '13', '6854', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (12, '2021-01-17 23:21:46.944839+03', '9', 'mylist', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (13, '2021-01-17 23:21:53.428683+03', '8', 'galina2', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (14, '2021-01-17 23:21:59.537612+03', '7', 'galina', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (15, '2021-01-17 23:22:06.423522+03', '6', 'adminroot119633', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (16, '2021-01-17 23:22:12.52033+03', '5', 'anna', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (17, '2021-01-17 23:22:19.056533+03', '4', 'GeekBrains', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (18, '2021-01-17 23:22:26.895062+03', '16', '2010_complang_ru', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (19, '2021-01-17 23:30:38.336788+03', '17', 'tyrrannt', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (20, '2021-01-17 23:51:33.735656+03', '18', '2010_complang_ru', 3, '', 8, 1);
INSERT INTO public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message,
                                     content_type_id, user_id)
VALUES (21, '2021-01-18 00:25:58.51656+03', '19', '2010_complang_ru', 3, '', 8, 1);


--
-- TOC entry 3146 (class 0 OID 16408)
-- Dependencies: 203
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type (id, app_label, model)
VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (6, 'mainapp', 'productcategory');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (7, 'mainapp', 'product');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (8, 'authapp', 'shopuser');
INSERT INTO public.django_content_type (id, app_label, model)
VALUES (9, 'basketapp', 'basket');


--
-- TOC entry 3144 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (1, 'contenttypes', '0001_initial', '2020-12-23 14:19:26.542575+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-12-23 14:19:26.570882+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (3, 'auth', '0001_initial', '2020-12-23 14:19:26.600161+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-12-23 14:19:26.639199+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-12-23 14:19:26.661647+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-12-23 14:19:26.671409+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-12-23 14:19:26.679215+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-12-23 14:19:26.682144+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-12-23 14:19:26.688976+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-12-23 14:19:26.695811+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-12-23 14:19:26.70264+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-12-23 14:19:26.71728+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-12-23 14:19:26.724112+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (14, 'authapp', '0001_initial', '2020-12-23 14:19:26.759247+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (15, 'admin', '0001_initial', '2020-12-23 14:19:26.816832+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (16, 'admin', '0002_logentry_remove_auto_add', '2020-12-23 14:19:26.837328+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (17, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-23 14:19:26.845136+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (18, 'mainapp', '0001_initial', '2020-12-23 14:19:26.86759+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (19, 'mainapp', '0002_auto_20201220_2232', '2020-12-23 14:19:26.880279+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (20, 'basketapp', '0001_initial', '2020-12-23 14:19:26.894917+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (21, 'sessions', '0001_initial', '2020-12-23 14:19:26.913461+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (22, 'mainapp', '0003_productcategory_is_active', '2020-12-24 21:49:50.637589+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (23, 'mainapp', '0004_product_is_active', '2020-12-25 01:10:37.39474+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (24, 'authapp', '0002_auto_20210117_2218', '2021-01-17 22:19:05.71541+03');
INSERT INTO public.django_migrations (id, app, name, applied)
VALUES (25, 'authapp', '0003_auto_20210117_2350', '2021-01-17 23:50:38.633506+03');


--
-- TOC entry 3167 (class 0 OID 16604)
-- Dependencies: 224
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session (session_key, session_data, expire_date)
VALUES ('6cwyss4om16yecvoan8xag2tp0b8i0lc',
        'ZDZlY2U5ODg4ZDM4ZjkxZDE3M2I5NTk3YTEwNTM4MDRkMDU4ZjI2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OWQ1YmU0MThhN2Q0NGYyZTFlYWFhZTVmY2ZjZWVhMjVjZDFlMTNiIn0=',
        '2021-01-09 13:12:35.266441+03');
INSERT INTO public.django_session (session_key, session_data, expire_date)
VALUES ('i24advspdwr4uj9bxopdtkblv0eph8on',
        'ZDZlY2U5ODg4ZDM4ZjkxZDE3M2I5NTk3YTEwNTM4MDRkMDU4ZjI2Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5OWQ1YmU0MThhN2Q0NGYyZTFlYWFhZTVmY2ZjZWVhMjVjZDFlMTNiIn0=',
        '2021-01-22 22:24:57.325128+03');
INSERT INTO public.django_session (session_key, session_data, expire_date)
VALUES ('g238866eoz0qen0zc9kknst5xtx15im0',
        'ZmY2NjgwYzEzNTE5NDQ4NjRiMTZlZmQxZTJlNmZiNzQyZjcyOWNkYzp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTk0NzFiZDZiZmE5N2VhYWYyZDRiMjZlOGNjMGFjMDAwZDUwMmE1MCJ9',
        '2021-02-01 00:26:58.651046+03');


--
-- TOC entry 3164 (class 0 OID 16566)
-- Dependencies: 221
-- Data for Name: mainapp_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (2, 'Куртка Зимняя', 'products_images/IMG_434ef3bb4261aa00d40f0e8610fe4a8590c3a3f890c8d092e318fe7825cb1345.jpg',
        'Envy Lab / Куртка Зимняя/ Пуховик зимний',
        'Стеганая мужская куртка с утеплителем из холлофайбер хорошо сохраняет тепло. Плотный, износостойкий материал обеспечивает максимальную теплозащиту. Обладает высокими водоотталкивающими характеристиками, защищает от проникновения влаги. Гарантирует климат-контроль всего тела.. Материал адаптирован к морозам. Внутренняя Ветрозащитная планка, трикотажные манжеты и дополнительные кулиски на капюшоне защитят даже при сильном ветре и обеспечат дополнительный комфорт.',
        6943.00, 150, 1, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (3, 'Ветровка PURSUIT JACKET',
        'products_images/IMG_d7574c3fbcd71e9dec6232d4f762e96bd5f70a8bfcccc4e4cd66180f0368ae83.jpg',
        'Helly Hansen / Ветровка PURSUIT JACKET',
        'Легкий мужской дождевик с яркими цветовыми блоками и крупным нанесением логотипов HELLY HANSEN спереди и сзади на капюшоне. Создана из мембранного материала Helly Tech Protection, который является водонепроницаемым, ветрозащитным и дышащим. Коэффициент водонепроницаемости до: 5000 мм водного столба. Герметичные швы, передние карманы на молнии, регулируемый капюшон и эластичные манжеты.',
        4720.00, 350, 1, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (4, 'GEOX / Пальто', 'products_images/IMG_2686c5c477a39623606bdfe066c6d12545513fefafae3d267b83eb7cd36ff629.jpg',
        'GEOX / Пальто', 'полиэстер 100%', 13306.00, 200, 1, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (5, 'Дафлкот Classic',
        'products_images/IMG_f0239ab994168ede3ea0a6b86bda0e03059aeb8f2f5bf863c7f2fcbc02136083.jpg',
        'Original Montgomery / Дафлкот Classic',
        'В РАЗМЕРНОЙ СЕТКЕ УКАЗАН АНГЛИЙСКИЙ РАЗМЕР ПРОИЗВОДИТЕЛЯ (НЕ ЕВРОПЕЙСКИЙ), ПОЭТОМУ ОРИЕНТИРУЙТЕСЬ НА РОССИЙСКИЙ РАЗМЕР. ПАРАМЕТРЫ В СМ ОБЩИЕ НА ВСЮ ВЕРХНЮЮ ОДЕЖДУ НА ЭТОЙ ПЛОЩАДКЕ. ДЛЯ ДАННОГО БРЕНДЫ НЕ СОВСЕМ КОРРЕКТНО. Женский дафлкот (duffle coat) Оriginal Montgomery Classic классического кроя на четырёх пуговицах. Качество от производителя с 1896 года. На ярлыке каждого дафлкота Original Montgomery написано "The world''s oldest duffel coat company. Made with pride in England". И это не пустые слова. Компания Original Montgomery является самым первым производителем дафлкотов в мире. Каждый обладатель этих пальто может быть на 100% уверен в их исключительном качестве. Петли застёжек сделаны из качественной натуральной кожи, пуговицы-клыки из рога. Женская модель дафлкота Classic Duffle имеет скрытую молнию дополнительно к застёжкам-клыкам. Капюшон удобно регулируется ремешками и пуговицами и может застегиваться для дополнительной защиты от ветра и дождя.',
        17550.00, 66, 1, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (6, 'Карнавальный костюм "Снегурочка вышивка"',
        'products_images/IMG_cfed5403d59465ef42f1a17b7c3ff510fe2d3a08aa136f00ca731fc00dcbb259.jpg',
        'Батик / Карнавальный костюм "Снегурочка вышивка"', 'текстиль 100%', 4147.00, 1000, 1, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (7, 'Кроссовки DURAMO SL FTWWHT',
        'products_images/IMG_7dbc4847a18b8022af0d38c3876d27b66170f39a7c7d6b0261ceb262effc3f49.jpg',
        'adidas / Кроссовки DURAMO SL FTWWHT/FTWWHT/SIGPNK', 'текстиль 60%, синтетический материал 40%', 2699.00, 400,
        2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (8, 'Сапоги', 'products_images/IMG_f2af6d844a2cdeffd8b024f8e0da2b09e623f2514ecc3b263a168b39dd3931b3.jpg',
        'T.TACCARDI / Сапоги', 'микрофибра 100%', 2499.00, 150, 2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (10, 'Ботинки', 'products_images/IMG_698144b7db380483c09f3f4ba5cc9da83e016a5da7e2e616cb288422996dfd5b.jpg',
        'CROCS / Ботинки', 'Сапоги CROCS ОллКаст II Люкс Бут M.', 7559.00, 460, 2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (11, 'CROCS / Сабо', 'products_images/IMG_6e1c964c63bdc26ccb3c886d9bbb71f6b95c80dd05c5e3513f9215d957a54d8d.jpg',
        'CROCS / Сабо',
        'Полоса черная, полоса белая... А как насчет оранжевой? или мятной? Сабо Crocband отличает контрастная полоска на высокой литой подошве, которая придает еще больше неудержимости их спортивному духу. Невероятно легкая и комфортная модель с массажной стелькой и практичным пяточным ремешком. В этих сабо вы не почувствуете ни скуки, ни усталости! Для вашего комфорта при получении заказа, отмечаем, что на обуви обозначен американский размер. Другие международные размеры указаны на элементах упаковки.',
        1574.00, 25, 2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (9, 'Угги Yose', 'products_images/IMG_0ab7d6125580f86073aa86f4a5dd9dd0e3731b46288d650eaacea4507f9c082c.jpg',
        'UGG / Угги Yose', 'натуральная кожа 65%, искусственная кожа 35%', 9354.00, 500, 2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (12, 'Берцы Омон м.905',
        'products_images/IMG_d9e53d6d741151cf5478bc7aaa05ce0c4a87474fbfb70f0e2c5fb6e873e5278c.jpg',
        'БУТЕКС / Берцы Омон м.905 зимние из натуральной кожи на нату',
        'Зимние ботинки Омон изготовлены из натуральной хромовой кожи толщиной 1.4-1,6 мм. Высота берца 24 см. Подошва из ТЭП (термоэластопласт) клее-прошивного метода крепления. Удобная широкая колодка. В качестве утеплителя используется натуральный мех овчина. Носочная и пяточная часть ботинка для сохранения формы усилены термопластическим материалом. Эта модель удобна для людей с высоким подъёмом ноги. Глухой клапан препятствует попаданию внутрь ботинка посторонних предметов и снега. Данная модель пользуется успехом у сотрудников силовых структур и у людей, увлекающихся активными видами отдыха на природе. Для подбора размера: наш размер 36 на длину стопы 24,0см, 37р. - 24,6см, 38р. - 25,5см, 39р. - 25,9см, 40р. - 26,6см, 41р.- 27,2см, 42р. - 27,8см, 43р. - 28,4см, 44р.- 29,1см, 45р. - 29,8см, 46р. - 30,5см',
        2808.00, 1000, 2, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (13, 'Перчатки мужские классические',
        'products_images/IMG_94eaf46ebe4a59be361a9b6d52c28b0cc7c5c9d0a140c472e1b2e04617beb06a.jpg',
        'Malgrado / Перчатки/ Перчатки мужские классические/ Натураль',
        'Перчатки торговой марки Malgrado из натуральной кожи на шерстяной подкладке. Отделка-декоративные швы три полоски. Нижний край перчатки окантован. Длина пальцев средняя.',
        823.00, 1000, 3, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (14, 'Именной набор столовых приборов "Анна"',
        'products_images/IMG_b18814853b84cba75f5fe509c1e1afa8b516f51bc60864cb89147ca8a15b3791.jpg',
        'BestRoyalGift / Именной набор столовых приборов "Анна"',
        'Именной набор столовых приборов с лазерной гравировкой "Анна". Набор состоит из столовой ложки, чайной ложки и столовой вилки, а также подарочной коробки с флокированным ложементом. Столовые приборы из нержавеющей стали производства Павловского завода им. Кирова классической серии "Тройка" с локальным нитрид-титановым покрытием(на ручке) отличаются высоким промышленным качеством, зеркально отполированы и имеют традиционную элегантную форму и изгиб ручки. Лазерная гравировка с именем полностью безопасна и не стирается даже после нескольких лет активного использования, а главное, делает этот набор очень приятным, индивидуальным и полезным подарком, который всегда будет напоминать адресату о памятном событии или дате.',
        920.00, 15, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (15, 'Конструктор LEGO City Police',
        'products_images/IMG_cf4dcbbdfc594104635499ae33027b81e2dcaababddd9bf4e8be548015ba1a9d.jpg',
        'LEGO / Конструктор LEGO City Police 60139 Мобильный командны',
        'Конструктор LEGO City Police 60139 Мобильный командный центр поможет маленьким героям восстановить справедливость! Случилась неприятность: из тюрьмы, благодаря своему помощнику, сбежал опасный преступник. В наборе имеется вездеход с цепью, при помощи которой сообщник злодея выломал дверь тюрьмы и освободил подельника. Теперь нужно действовать быстро: выкатить полицейский мотоцикл, который тоже входит в конструктор, и отправиться в погоню. Верный полицейский пес оперативно возьмет след и укажет направление преследования. Данный набор станет отличным подарком на день рождения. - В комплект входит много моделей, среди которых и сам полицейский участок с тюремной камерой, и грузовик, который может его перевозить. - В качестве дополнительных транспортных средств представлены вездеход преступников и полицейский мотоцикл. - В наборе имеются минифигурки: служебная собака, полицейские и преступники. - С конструктором LEGO City Police у ребенка хорошо развивается воображение.',
        1799.00, 200, 6, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (16, 'A.Karina / Платье',
        'products_images/IMG_3605f40feaa5f47f54a13daee840db347886b23660a945c29e06ed773e9fae60.jpg', 'A.Karina / Платье',
        'Роскошное коктейльное платье с глубоким блеском сделает Вас королевой праздника в любом обществе. Платье великолепно сидит на фигурах разного типа, запАх на линии декольте делает грудь пышнее и соблазнительнее, тонкий пояс подчеркивает талию, а элегантная длина миди во французском стиле визуально вытягивает силуэт.',
        2804.00, 10, 5, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (17, 'Подарочный набор конфет на Новый год', 'products_images/15857189-1.jpg',
        'Центр Сладостей / Подарочный набор конфет на Новый год, 500',
        'Новогодний сладкий подарок 500 гр., 31 конфета. Твикс minis (1 шт), Милки вей minis (1 шт), Марс minis (1 шт), Красный Октябрь: Шоколад Аленка с воздушной начинкой вкус Крем-брюле (1 шт), Orion: Бисквит Orion "Чоко Пай" в шоколаде Славянка: Батончик Степ золотой (1 шт), КДВ-Групп: Мармелад "Крут Фрут" жевательный (1 шт), Конфета ВерSаль (1 шт), Конфета Яшкинская картошка (1 шт), Конфета Евгеша (2 шт), Конфета Белая черемуха (2 шт), Конфета Глэйс со сливочным вкусом (2 шт), Конфета Jets с печеньем (1 шт), Конфета Lusso со вкусом черной смородины (2 шт), Конфета глазированная с комбинированным корпусом Super (1 шт), Жевательная ириска Нота Бум с ореховой начинкой (2 шт), Карамель Страйк ассорти на палочке (2 шт), Конфета Мексикана (1 шт), Конфета Золотая стрекоза (2 шт), Конфета Му-муйка парное молочко (2 шт), Карамель Кремка клубника и сливки (2 шт), Карамель Кремка с молочным вкусом (2 шт).',
        255.00, 250, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (18, 'Винный бокал', 'products_images/14767776-1.jpg', 'Artskills / Винный бокал Мама не бухает',
        'Бенджамин Франклин однажды сказал Вино это доказательство того, что Бог любит нас и хочет видеть нас счастливыми. С этим согласятся все ценители благородного напитка, однако они согласятся и с тем, что процесс винопития обязательно должен быть красивым. А без специальной посуды и правильной закуски это вряд ли будет возможным.',
        773.00, 100, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (19, 'Подарочный набор бокалов', 'products_images/9593052-1.jpg', 'Whiskoff / Подарочный набор бокалов',
        'Современный и оригинальный подарочный набор для мужчин: cостоит из бокалов, изготовленных из высококачественных и безопасных материалов, предназначенных для бурбона, бренди, скотча, виски, коньяка и других алкогольных напитков в баре или дома. Для настоящих ценителей богатого вкуса, таких как ваш папа, друг, муж, брат, дедушка! Мы рады предложить вам набор из 15 предметов в креативной сувенирной шкатулке. Превосходное качество, неординарный дизайн, красивая упаковка делают подарок универсальным. Разделите важные моменты в вашей жизни с другом! День рождения, свадьба, день отца, 23 февраля, новый год, или подарок на юбилей для вашего босса, парня, жены, сестры или друзей, которые полюбят все предметы из этого набора. Сохраняйте оригинальный аромат и вкус напитка! В отличие от кубиков льда, эти охлаждающие натуральные камни не разбавляют водой ваш напиток, а охлаждают его для того, чтобы вы могли наслаждаться неразбавленным вкусом. Мы гарантируем, что ваш подарок понравится близким!',
        3390.00, 50, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (20, 'Эксмо / НЕ НОЙ', 'products_images/7171854-1.jpg',
        'Эксмо / НЕ НОЙ. Только тот, кто перестал сетовать на судьбу,',
        'Если даже такая нищебродская тушка, как я сумела поправить свое финансовое положение, сможет кто угодно! - заявляет Джен Синсеро. И ей сложно не верить. До сорока с лишнем лет она жила в переделанном гараже, одевалась в секонд-хэнде и не могла себе позволить вылечить зубы. Сейчас Джен путешествует по всему миру, останавливаясь только в пятизвездочных отелях. Ее книга - это квинтэссенция методик и стратегий по перенастройке финансового мышления. Она не только снимает психологические блоки на пути к достойному доходу, но и отвешивает энергетический пинок, который придает сил для достижения самых смелых целей.',
        667.00, 20, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (21, 'Набор юного художника для рисования и творчества с мольбертом', 'products_images/12178365-1.jpg',
        'Shenzhen Toys and Craft / Набор юного художника для рисовани',
        'Прекрасный подарок юным художникам, в наборе собрано более 200 предметов для рисования. Он выполнен из дерева, что гарантирует высокую прочность при использовании, в отличие от наборов из пластика. Вес 2600 грамм, размер: 35,5х30х9,5 см. Он обладает большим функционалом, имеет мольберт, две выдвижные полки и раскладывается как книга. Отлично подойдет для школьников и детей всех возрастов. Для формирования правильной осанки в набор включена подставка под бумагу, так Вашей дочке или сыну будет удобнее рисовать. В комплекте: масляная пастель - 24шт.; водная пастель (можно использовать как обычную пастель, а можно с водой) - 12шт.; цветные ударопрочные карандаши - 24шт.; двусторонние маркеры - 16шт.; подставка; ножки - 2шт; 27 карточек - трафаретов; 24 краски; 2 кисточки разных размеров; точилка; ластик; 2 карандаша HB; 35 скрепок; 3 зажима для бумаги; 36 наклеек; 20 листов А4; книжка-подсказка как раскрасить карточки. Идеальный подарок для мальчика и девочки.',
        3811.00, 240, 4, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (22, 'Игровая приставка Xbox One S', 'products_images/8902760-1.jpg',
        'Microsoft / Игровая приставка Xbox One S 1TB + Forza Horizon',
        'Игровая консоль Microsoft Xbox One S - обновлённая версия знаменитого девайса, которая значительно уменьшилась в размерах при смене поколения, но получила ряд усовершенствований. Более мощная техническая платформа позволяет ей воспроизводить видео и трёхмерную графику с разрешением 4K. Поддержка HDR значительно улучшает цветовую насыщенность изображения, а также повышает детализацию светлых и тёмных участков, делая игры ещё более реалистичными.',
        23990.00, 150, 6, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (23, '3D ручка MyRiwell RP100B', 'products_images/9963928-1.jpg',
        'MyRiwell / 3D ручка MyRiwell RP100B с набором пластика PLA 1',
        'Для комплекта мы выбрали самую популярную и надежную в Мире 3D-ручку Myriwell RP100B, с помощью которой Вы можете создавать яркие, объемные фигуры, которым будет так рад Ваш ребенок. Функционал 3D ручки MyRiwell позволяет регулировать скорость подачи пластика и настраивать температурный режим, для комфортной работы с 3D ручкой. Набор разноцветного пластика PLA отлично подойдет не только для рисования в воздухе или на плоскости, но и для декорирования различных предметов - он быстро сохнет и с ним удобно работать. В состав набора входит пластик PLA 10 цветов по 10 м. + 20 метров пластика в подарок и набор из 20 трафаретов многоразового использования, которые помогут Вашему ребенку научиться основным приемам работы с 3D-ручкой MyRiwell RP100B. Каждый трафарет напечатан на плотной качественной мелованной. С помощью трафаретов обучение работы с 3D ручкой будет более простым и интересным, и вскоре ребенок будет готов перейти к самостоятельному пространственному рисованию.',
        2960.00, 150, 6, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (24, 'Эксмо / НИ СЫ', 'products_images/5720055-1.jpg',
        'Эксмо / НИ СЫ. Будь уверен в своих силах и не позволяй сомне',
        'Хочешь жить так, как никогда не жил - начни делать то, что никогда не делал. Главная формула саморазвития, которую можно свести к "восточной мудрости" - НИ СЫ. Именно к этому призывает Джен Синсеро, автор культового бестселлера, вышедшего в 28 странах и проданного общим тиражом 1 000 000 экземпляров. Ее книга - это настоящий электрошокер. Она состоит из 25 самых действенных методик саморазвития, каждая из которых, будучи проверенной Джен Синсеро на собственном опыте, дала результат. Добавьте еще соленый авторский юмор, бесшабашную дерзость, подкупающую самоиронию и получите самую мощную из существующих книг по преображению жизни.',
        669.00, 0, 5, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (25, 'TOMMY JEANS / Куртка', 'products_images/17462382-1.jpg', 'TOMMY JEANS / Куртка', 'полиамид 100%', 23990.00,
        50, 5, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (26, 'Forte / Ремень', 'products_images/17231532-1.jpg', 'Forte / Ремень',
        'Женский джинсовый ремень из натуральной кожи с тиснением "Цветы". Модель идеально подойдет для повседневного образа с брюками или джинсами, а так же отлично дополнит любой наряд в женственном платье. Полотно ремня матовое. Ширина - 3.5 см. Возможна самостоятельная регулировка длины ремня. Пряжка классическая. Вид пряжки может незначительно отличаться от представленного на фотографии. Изделие упаковано в фирменную подарочную коробку FORTE.',
        560.00, 15, 3, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (27, 'Legna / Компьютерные очки Legna унисекс S6206A для компьютера',
        'products_images/IMG_c4aaec18c691fb62c021bd5f67bd3bcb8d15a288eca2f9a2028c6c603cb619fa.jpg',
        'Legna / Компьютерные очки Legna унисекс S6206A для компьютер',
        'Компьютерные очки Legna со специальными линзами Nano-Blue блокируют вредный синий свет, сохраняя баланс и контрастность остальных цветов. Это позволяет снимать зрительное утомление, дискомфорт человека, контактирующего с мониторами компьютеров и прочих устройств. Компьютерные очки Legna повышают контрастность и улучшают восприятие предметов за счет уменьшения светопропускания синего диапазона волн при вождении автомобиля в темное время суток. Именно этот свет исходит от фар встречных машин и вызывает усталость и сухость глаз за рулем. Таким образом, мы рекомендуем носить компьютерные очки Legna с линзами Nano-Blue: 1. Детям, школьникам, студентам, которые проводят большое количество времени за экранами цифровых устройств. 2. Офисным работникам. 3. Водителям 4. Людям старше 55 лет, использующим цифровые устройства.',
        1479.00, 500, 3, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (28, 'Игровой комплекс "Комфорт два домика +гамак "',
        'products_images/IMG_bc173263ee1b554a6975f531258f28e50d8fe5de2331bdf778283e6df64ecf2f.jpg',
        'Pet БМФ / Игровой комплекс "Комфорт два домика +гамак " для',
        'Комплекс подойдет большинству пород кошек, в нем могут сразу жить, играть, спать и отдыхать несколько кошек, при этом не мешая друг другу. Он имеет удобное расположение элементов для беспрепятственного перемещения с верху в низ и наоборот. А также устойчивую и крепкую конструкцию. Этот Комплекс отлично подойдет как для активных кошек, так и для пассивных. Особенности модели "Комфорт два домика +гамак: -Размеры комплекса (Длина х Глубина х Высота): 75 х 50 х 161 см -Множество мест для игр: Уютный гамак, шар и сизаль канат и т.д. Достаточно большой для вашего большой кошки и в то же время будет очень интересным для котенка. -Качественное Мехово покрытие: состоит из высококачественного мехового материала, который очень мягкий и приятный. - Комплекс гармонично впишется в любой интерьер дома, как часть мебели. Он спроектирован так что его легко может собрать даже девушка, которая до этого не когда не собирала мебель. Инструкция и все детали для сборки в комплекте.',
        14998.00, 5, 10, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (29, 'Массажная рукавица для груминга',
        'products_images/IMG_63447d42ebcb002bcb42800f21d4f4ce94fcf885ec74092f543db2a4689dfcb0.jpg',
        'Перчатка щетка / варежка для вычесывания шерсти у кошек',
        'Щетка-перчатка для вычесывания шерсти оснащена 255 улучшенными силиконовыми насадками, имитирующими прикосновение руки, для мягкого и расслабляющего массажа Вашего питомца во время груминга! Эта гибкая перчатка на застежке-липучке вокруг запястья позволяет идеально зафиксировать щетку на любой руке и вычесывать длинную и/или пушистую шерсть кошек и собак. Эта перчатка с силиконовым слоем насадок идеально подходит для домашнего ухода за любой длиной и вьющейся шерстью животных, делая процедуру обоюдно приятной. Вся вычесанная шерсть остается на перчатке, откуда затем ее легко можно удалить и помыть перчатку. С помощью этой перчатки для животных можно эффективно мыть кошек и собак: изделие заменит обычную мочалку или щетку, которую неудобно держать во время мытья. Дизайн перчатки с пятью пальцами позволяет ухаживать за труднодоступными местами, такими как хвост или морда, не повреждая кожу питомца. Мягкая резина обеспечивает нежный массаж и уход без болезненных ощущений и царапин.',
        303.00, 100, 10, true);
INSERT INTO public.mainapp_product (uid, name, image, short_desc, description, price, quantity, category_id, is_active)
VALUES (1, 'Парка Север', 'products_images/IMG_efb5495170f9bc6f7a6d3e4325bc647c5d065ebd5729fbad5c76bbf43f9865a4.jpg',
        'Город Горький / Парка Север/Парка мужская зимняя',
        'Замерз? У нас для тебя есть обновленная версия классической парки. Парка Север — это 250 г/кв. м утеплителя, накладные карманы и свободный крой! Легкая, как перышко, но надежная и непродуваемая, как скала! Удлиненная спинка прикроет тыл и не даст застудить самое ценное. Мы убрали с пояса кулиску, чтобы под курткой осталось место для крутого худи. Не забудь: носить парку на голое тело — дурной тон. В подкладке капюшона больше нет искусственного меха. Теперь ничто не будет цепляться за твою трендовую щетину. Когда надумаешь устроить большую стирку, отстегни опушку и ставь температуру не выше 30 градусов.',
        4826.00, 100, 1, true);


--
-- TOC entry 3162 (class 0 OID 16553)
-- Dependencies: 219
-- Data for Name: mainapp_productcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (6, 'Детям', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (10, 'Зоотовары', 'питание для животных, клетки, аквариумы, различные аксессуары', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (8, 'Электроника', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (7, '18+', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (5, 'Новинки', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (4, 'Подарки', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (2, 'Обувь', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (3, 'Аксессуары', '', true);
INSERT INTO public.mainapp_productcategory (uid, name, description, is_active)
VALUES (1, 'Одежда', '', true);


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3187 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 204
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- TOC entry 3189 (class 0 OID 0)
-- Dependencies: 212
-- Name: authapp_shopuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_shopuser_groups_id_seq', 1, false);


--
-- TOC entry 3190 (class 0 OID 0)
-- Dependencies: 210
-- Name: authapp_shopuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_shopuser_id_seq', 20, true);


--
-- TOC entry 3191 (class 0 OID 0)
-- Dependencies: 214
-- Name: authapp_shopuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authapp_shopuser_user_permissions_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 0)
-- Dependencies: 222
-- Name: basketapp_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basketapp_basket_id_seq', 104, true);


--
-- TOC entry 3193 (class 0 OID 0)
-- Dependencies: 216
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 21, true);


--
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 200
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 25, true);


--
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 220
-- Name: mainapp_product_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_product_uid_seq', 29, true);


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 218
-- Name: mainapp_productcategory_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mainapp_productcategory_uid_seq', 10, true);


--
-- TOC entry 2955 (class 2606 OID 16466)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2960 (class 2606 OID 16462)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2963 (class 2606 OID 16441)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2957 (class 2606 OID 16431)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 16448)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2952 (class 2606 OID 16423)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2971 (class 2606 OID 16489)
-- Name: authapp_shopuser_groups authapp_shopuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_groups
    ADD CONSTRAINT authapp_shopuser_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 16510)
-- Name: authapp_shopuser_groups authapp_shopuser_groups_shopuser_id_group_id_cfcfec7c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_groups
    ADD CONSTRAINT authapp_shopuser_groups_shopuser_id_group_id_cfcfec7c_uniq UNIQUE (shopuser_id, group_id);


--
-- TOC entry 2965 (class 2606 OID 16479)
-- Name: authapp_shopuser authapp_shopuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser
    ADD CONSTRAINT authapp_shopuser_pkey PRIMARY KEY (id);


--
-- TOC entry 2976 (class 2606 OID 16524)
-- Name: authapp_shopuser_user_permissions authapp_shopuser_user_pe_shopuser_id_permission_i_ca4507bb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_user_permissions
    ADD CONSTRAINT authapp_shopuser_user_pe_shopuser_id_permission_i_ca4507bb_uniq UNIQUE (shopuser_id, permission_id);


--
-- TOC entry 2979 (class 2606 OID 16497)
-- Name: authapp_shopuser_user_permissions authapp_shopuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_user_permissions
    ADD CONSTRAINT authapp_shopuser_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2968 (class 2606 OID 16481)
-- Name: authapp_shopuser authapp_shopuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser
    ADD CONSTRAINT authapp_shopuser_username_key UNIQUE (username);


--
-- TOC entry 2994 (class 2606 OID 16591)
-- Name: basketapp_basket basketapp_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketapp_basket
    ADD CONSTRAINT basketapp_basket_pkey PRIMARY KEY (id);


--
-- TOC entry 2983 (class 2606 OID 16538)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 16415)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2947 (class 2606 OID 16413)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 16405)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2999 (class 2606 OID 16611)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2992 (class 2606 OID 16575)
-- Name: mainapp_product mainapp_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_product
    ADD CONSTRAINT mainapp_product_pkey PRIMARY KEY (uid);


--
-- TOC entry 2987 (class 2606 OID 16563)
-- Name: mainapp_productcategory mainapp_productcategory_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_productcategory
    ADD CONSTRAINT mainapp_productcategory_name_key UNIQUE (name);


--
-- TOC entry 2989 (class 2606 OID 16561)
-- Name: mainapp_productcategory mainapp_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_productcategory
    ADD CONSTRAINT mainapp_productcategory_pkey PRIMARY KEY (uid);


--
-- TOC entry 2953 (class 1259 OID 16467)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2958 (class 1259 OID 16463)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2961 (class 1259 OID 16464)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2948 (class 1259 OID 16449)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2969 (class 1259 OID 16512)
-- Name: authapp_shopuser_groups_group_id_fc5030ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_shopuser_groups_group_id_fc5030ad ON public.authapp_shopuser_groups USING btree (group_id);


--
-- TOC entry 2972 (class 1259 OID 16511)
-- Name: authapp_shopuser_groups_shopuser_id_7a0af1c1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_shopuser_groups_shopuser_id_7a0af1c1 ON public.authapp_shopuser_groups USING btree (shopuser_id);


--
-- TOC entry 2977 (class 1259 OID 16526)
-- Name: authapp_shopuser_user_permissions_permission_id_238998d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_shopuser_user_permissions_permission_id_238998d0 ON public.authapp_shopuser_user_permissions USING btree (permission_id);


--
-- TOC entry 2980 (class 1259 OID 16525)
-- Name: authapp_shopuser_user_permissions_shopuser_id_22ed2dc5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_shopuser_user_permissions_shopuser_id_22ed2dc5 ON public.authapp_shopuser_user_permissions USING btree (shopuser_id);


--
-- TOC entry 2966 (class 1259 OID 16498)
-- Name: authapp_shopuser_username_f8791d94_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authapp_shopuser_username_f8791d94_like ON public.authapp_shopuser USING btree (username varchar_pattern_ops);


--
-- TOC entry 2995 (class 1259 OID 16602)
-- Name: basketapp_basket_product_id_8c0a26f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX basketapp_basket_product_id_8c0a26f8 ON public.basketapp_basket USING btree (product_id);


--
-- TOC entry 2996 (class 1259 OID 16603)
-- Name: basketapp_basket_user_id_50368e18; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX basketapp_basket_user_id_50368e18 ON public.basketapp_basket USING btree (user_id);


--
-- TOC entry 2981 (class 1259 OID 16549)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2984 (class 1259 OID 16550)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2997 (class 1259 OID 16613)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3000 (class 1259 OID 16612)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2990 (class 1259 OID 16582)
-- Name: mainapp_product_category_id_adb0278b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_product_category_id_adb0278b ON public.mainapp_product USING btree (category_id);


--
-- TOC entry 2985 (class 1259 OID 16576)
-- Name: mainapp_productcategory_name_1e27fc70_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mainapp_productcategory_name_1e27fc70_like ON public.mainapp_productcategory USING btree (name varchar_pattern_ops);


--
-- TOC entry 3003 (class 2606 OID 16456)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3002 (class 2606 OID 16451)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3001 (class 2606 OID 16442)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3004 (class 2606 OID 16499)
-- Name: authapp_shopuser_groups authapp_shopuser_gro_shopuser_id_7a0af1c1_fk_authapp_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_groups
    ADD CONSTRAINT authapp_shopuser_gro_shopuser_id_7a0af1c1_fk_authapp_s FOREIGN KEY (shopuser_id) REFERENCES public.authapp_shopuser (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3005 (class 2606 OID 16504)
-- Name: authapp_shopuser_groups authapp_shopuser_groups_group_id_fc5030ad_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_groups
    ADD CONSTRAINT authapp_shopuser_groups_group_id_fc5030ad_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3007 (class 2606 OID 16518)
-- Name: authapp_shopuser_user_permissions authapp_shopuser_use_permission_id_238998d0_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_user_permissions
    ADD CONSTRAINT authapp_shopuser_use_permission_id_238998d0_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3006 (class 2606 OID 16513)
-- Name: authapp_shopuser_user_permissions authapp_shopuser_use_shopuser_id_22ed2dc5_fk_authapp_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authapp_shopuser_user_permissions
    ADD CONSTRAINT authapp_shopuser_use_shopuser_id_22ed2dc5_fk_authapp_s FOREIGN KEY (shopuser_id) REFERENCES public.authapp_shopuser (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3011 (class 2606 OID 16592)
-- Name: basketapp_basket basketapp_basket_product_id_8c0a26f8_fk_mainapp_product_uid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketapp_basket
    ADD CONSTRAINT basketapp_basket_product_id_8c0a26f8_fk_mainapp_product_uid FOREIGN KEY (product_id) REFERENCES public.mainapp_product (uid) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3012 (class 2606 OID 16597)
-- Name: basketapp_basket basketapp_basket_user_id_50368e18_fk_authapp_shopuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basketapp_basket
    ADD CONSTRAINT basketapp_basket_user_id_50368e18_fk_authapp_shopuser_id FOREIGN KEY (user_id) REFERENCES public.authapp_shopuser (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3008 (class 2606 OID 16539)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3009 (class 2606 OID 16544)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_authapp_shopuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authapp_shopuser_id FOREIGN KEY (user_id) REFERENCES public.authapp_shopuser (id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3010 (class 2606 OID 16577)
-- Name: mainapp_product mainapp_product_category_id_adb0278b_fk_mainapp_p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mainapp_product
    ADD CONSTRAINT mainapp_product_category_id_adb0278b_fk_mainapp_p FOREIGN KEY (category_id) REFERENCES public.mainapp_productcategory (uid) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-01-18 00:39:45

--
-- PostgreSQL database dump complete
--

