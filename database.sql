toc.dat                                                                                             0000600 0004000 0002000 00000051327 13634764556 0014472 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       (    3                x            teamit    12.2    12.2 K    w           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         x           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         y           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         z           1262    16393    teamit    DATABASE     �   CREATE DATABASE teamit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Romanian_Romania.1250' LC_CTYPE = 'Romanian_Romania.1250';
    DROP DATABASE teamit;
                postgres    false         �            1259    16526 	   companies    TABLE     �   CREATE TABLE public.companies (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    logo character varying
);
    DROP TABLE public.companies;
       public         heap    postgres    false         �            1259    16524    companies_id_seq    SEQUENCE     y   CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.companies_id_seq;
       public          postgres    false    220         {           0    0    companies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;
          public          postgres    false    219         �            1259    16394    groups    TABLE     �   CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying NOT NULL,
    details character varying,
    company_id bigint
);
    DROP TABLE public.groups;
       public         heap    postgres    false         �            1259    16400    groups_id_seq    SEQUENCE     v   CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    202         |           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    203         �            1259    16402    history    TABLE     �   CREATE TABLE public.history (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    action character varying
);
    DROP TABLE public.history;
       public         heap    postgres    false         �            1259    16408    history_id_seq    SEQUENCE     w   CREATE SEQUENCE public.history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.history_id_seq;
       public          postgres    false    204         }           0    0    history_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;
          public          postgres    false    205         �            1259    16410 	   locations    TABLE     �   CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying,
    contact character varying,
    type character varying NOT NULL,
    group_id bigint,
    company_id bigint NOT NULL
);
    DROP TABLE public.locations;
       public         heap    postgres    false         �            1259    16416    locations_id_seq    SEQUENCE     y   CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    206         ~           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    207         �            1259    16418    notifications    TABLE     �  CREATE TABLE public.notifications (
    type character varying NOT NULL,
    urgent integer,
    title character varying NOT NULL,
    text character varying NOT NULL,
    image character varying,
    user_id character varying NOT NULL,
    seen integer NOT NULL,
    created_at timestamp without time zone,
    redirect character varying,
    company_id bigint,
    id bigint NOT NULL
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false         �            1259    16559    notifications_id_seq    SEQUENCE     }   CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    208                    0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    221         �            1259    16426    old_notifications    TABLE     K   CREATE TABLE public.old_notifications (
)
INHERITS (public.notifications);
 %   DROP TABLE public.old_notifications;
       public         heap    postgres    false    208         �            1259    16432    tasks    TABLE       CREATE TABLE public.tasks (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    location_id bigint NOT NULL,
    assigned_to bigint,
    assigned_time timestamp without time zone,
    finnished_time timestamp without time zone,
    resolution character varying,
    group_id bigint NOT NULL,
    urgent integer NOT NULL,
    company_id bigint,
    closed_by bigint
);
    DROP TABLE public.tasks;
       public         heap    postgres    false         �            1259    16439 	   old_tasks    TABLE     ;   CREATE TABLE public.old_tasks (
)
INHERITS (public.tasks);
    DROP TABLE public.old_tasks;
       public         heap    postgres    false    210         �            1259    16446    permissions    TABLE     �   CREATE TABLE public.permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission character varying NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false         �            1259    16452    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    212         �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    213         �            1259    16454    products    TABLE       CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    image character varying,
    ac_price character varying,
    sell_price character varying,
    qty bigint,
    description character varying,
    location_id bigint,
    company_id bigint
);
    DROP TABLE public.products;
       public         heap    postgres    false         �            1259    16460    products_id_seq    SEQUENCE     x   CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    214         �           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    215         �            1259    16462    tasks_id_seq    SEQUENCE     u   CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public          postgres    false    210         �           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public          postgres    false    216         �            1259    16464    users    TABLE     r  CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    group_id bigint,
    created_at timestamp without time zone,
    profile_picture character varying,
    type character varying,
    company_id bigint,
    name character varying,
    last_login timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    16470    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217         �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218         �
           2604    16529    companies id    DEFAULT     l   ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);
 ;   ALTER TABLE public.companies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220         �
           2604    16513 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202         �
           2604    16514 
   history id    DEFAULT     h   ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);
 9   ALTER TABLE public.history ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204         �
           2604    16515    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206         �
           2604    16561    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    208         �
           2604    16562    old_notifications id    DEFAULT     x   ALTER TABLE ONLY public.old_notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 C   ALTER TABLE public.old_notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    221         �
           2604    16518    old_tasks id    DEFAULT     h   ALTER TABLE ONLY public.old_tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 ;   ALTER TABLE public.old_tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    216         �
           2604    16519    old_tasks created_at    DEFAULT     M   ALTER TABLE ONLY public.old_tasks ALTER COLUMN created_at SET DEFAULT now();
 C   ALTER TABLE public.old_tasks ALTER COLUMN created_at DROP DEFAULT;
       public          postgres    false    211         �
           2604    16520    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212         �
           2604    16521    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214         �
           2604    16522    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    210         �
           2604    16523    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217         s          0    16526 	   companies 
   TABLE DATA           D   COPY public.companies (id, owner_id, name, phone, logo) FROM stdin;
    public          postgres    false    220       2931.dat a          0    16394    groups 
   TABLE DATA           ?   COPY public.groups (id, name, details, company_id) FROM stdin;
    public          postgres    false    202       2913.dat c          0    16402    history 
   TABLE DATA           B   COPY public.history (id, created_at, user_id, action) FROM stdin;
    public          postgres    false    204       2915.dat e          0    16410 	   locations 
   TABLE DATA           [   COPY public.locations (id, name, address, contact, type, group_id, company_id) FROM stdin;
    public          postgres    false    206       2917.dat g          0    16418    notifications 
   TABLE DATA           ~   COPY public.notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM stdin;
    public          postgres    false    208       2919.dat h          0    16426    old_notifications 
   TABLE DATA           �   COPY public.old_notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM stdin;
    public          postgres    false    209       2920.dat j          0    16439 	   old_tasks 
   TABLE DATA           �   COPY public.old_tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM stdin;
    public          postgres    false    211       2922.dat k          0    16446    permissions 
   TABLE DATA           >   COPY public.permissions (id, user_id, permission) FROM stdin;
    public          postgres    false    212       2923.dat m          0    16454    products 
   TABLE DATA           t   COPY public.products (id, name, image, ac_price, sell_price, qty, description, location_id, company_id) FROM stdin;
    public          postgres    false    214       2925.dat i          0    16432    tasks 
   TABLE DATA           �   COPY public.tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM stdin;
    public          postgres    false    210       2921.dat p          0    16464    users 
   TABLE DATA              COPY public.users (id, email, password, group_id, created_at, profile_picture, type, company_id, name, last_login) FROM stdin;
    public          postgres    false    217       2928.dat �           0    0    companies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.companies_id_seq', 1, false);
          public          postgres    false    219         �           0    0    groups_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.groups_id_seq', 1, false);
          public          postgres    false    203         �           0    0    history_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.history_id_seq', 1, false);
          public          postgres    false    205         �           0    0    locations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.locations_id_seq', 1, false);
          public          postgres    false    207         �           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 14, true);
          public          postgres    false    221         �           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          postgres    false    213         �           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    215         �           0    0    tasks_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tasks_id_seq', 28, true);
          public          postgres    false    216         �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 80, true);
          public          postgres    false    218         �
           2606    16534    companies companies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.companies DROP CONSTRAINT companies_pkey;
       public            postgres    false    220         �
           2606    16484    users email 
   CONSTRAINT     G   ALTER TABLE ONLY public.users
    ADD CONSTRAINT email UNIQUE (email);
 5   ALTER TABLE ONLY public.users DROP CONSTRAINT email;
       public            postgres    false    217         �
           2606    16486    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    202         �
           2606    16488    history history_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public            postgres    false    204         �
           2606    16490    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    206         �
           2606    16576     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    208         �
           2606    16494    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    212         �
           2606    16496    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    214         �
           2606    16498    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public            postgres    false    210         �
           2606    16500    users users_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, email);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217    217                                                                                                                                                                                                                                                                                                                 2931.dat                                                                                            0000600 0004000 0002000 00000000053 13634764556 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	78	Team IT Services\n	0762758074	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     2913.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2915.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2917.dat                                                                                            0000600 0004000 0002000 00000000107 13634764556 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Spitalul Victor Babes	Sos. Mihai Bravu	0762758074	objective	1	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         2919.dat                                                                                            0000600 0004000 0002000 00000002264 13634764556 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        task	1	Test	undefined | Thu Mar 19 2020 01:08:08 GMT+0200 (Eastern European Standard Time)	\N	80	0	\N	/tasks/27	1	1
task	1	Test	undefined | Thu Mar 19 2020 01:08:08 GMT+0200 (Eastern European Standard Time)	\N	79	0	\N	/tasks/27	1	2
task	1	Test	Claudiu Stancu | Thu Mar 19 2020 01:11:14 GMT+0200 (Eastern European Standard Time)	\N	80	0	\N	/tasks/28	1	3
task	1	Test	Claudiu Stancu | Thu Mar 19 2020 01:11:14 GMT+0200 (Eastern European Standard Time)	\N	79	0	\N	/tasks/28	1	4
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	5
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	6
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	8
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	7
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	10
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	9
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	11
closedTask	0	Test	a fost inchis de undefined.	\N	79	0	\N	/tasks/21	1	12
closedTask	0	Test	a fost inchis de Claudiu Stancu.	\N	79	0	\N	/tasks/21	1	13
closedTask	0	Test	a fost inchis de Claudiu Stancu.	\N	79	0	\N	/tasks/21	1	14
\.


                                                                                                                                                                                                                                                                                                                                            2920.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2922.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014266 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2923.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2925.dat                                                                                            0000600 0004000 0002000 00000000005 13634764556 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2921.dat                                                                                            0000600 0004000 0002000 00000001551 13634764556 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20	79	Test	Test text	2020-03-19 00:35:47.598	1	0	2020-03-19 00:35:47.598	2020-03-19 23:10:22.923	cancel	1	1	1	79
22	79	Test	Test text	2020-03-19 00:50:22.84	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
23	79	Test	Test text	2020-03-19 00:51:02.567	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
24	79	Test	Test text	2020-03-19 00:51:47.223	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
25	79	Test	Test text	2020-03-19 00:59:17.935	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
26	79	Test	Test text	2020-03-19 01:02:34.29	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
27	79	Test	Test text	2020-03-19 01:08:08.05	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
28	79	Test	Test text	2020-03-19 01:11:14.798	1	0	\N	2020-03-19 23:10:22.923	cancel	1	1	1	79
21	79	Test	Test text	2020-03-19 00:38:06.328	1	80	2020-03-19 22:25:49.854	2020-03-19 23:10:22.923	cancel	1	1	1	79
\.


                                                                                                                                                       2928.dat                                                                                            0000600 0004000 0002000 00000000477 13634764556 0014311 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        80	lucian.vladut@teamitforce.ro	$2b$05$.mNaeCJriTL6SYvPJBQP4e9JjYUkTINGtafd5.f.hd0GN3O8btoaG	1	2020-03-18 22:09:50.679	\N	user\n	1	Lucian Vladut	\N
79	claudiustancu@outlook.com	$2b$05$rxkTizFYkkgrVrqJ7opdUOmulKFWkw8f3sbdZsqN.efbXRdJf94tm	1	2020-03-14 14:26:13.573	\N	admin	1	Claudiu Stancu	2020-03-19 23:09:02.096
\.


                                                                                                                                                                                                 restore.sql                                                                                         0000600 0004000 0002000 00000042765 13634764556 0015425 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

DROP DATABASE teamit;
--
-- Name: teamit; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE teamit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Romanian_Romania.1250' LC_CTYPE = 'Romanian_Romania.1250';


ALTER DATABASE teamit OWNER TO postgres;

\connect teamit

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
-- Name: companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companies (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    logo character varying
);


ALTER TABLE public.companies OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.companies_id_seq OWNER TO postgres;

--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id bigint NOT NULL,
    name character varying NOT NULL,
    details character varying,
    company_id bigint
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    action character varying
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying NOT NULL,
    address character varying,
    contact character varying,
    type character varying NOT NULL,
    group_id bigint,
    company_id bigint NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notifications (
    type character varying NOT NULL,
    urgent integer,
    title character varying NOT NULL,
    text character varying NOT NULL,
    image character varying,
    user_id character varying NOT NULL,
    seen integer NOT NULL,
    created_at timestamp without time zone,
    redirect character varying,
    company_id bigint,
    id bigint NOT NULL
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: old_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.old_notifications (
)
INHERITS (public.notifications);


ALTER TABLE public.old_notifications OWNER TO postgres;

--
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks (
    id bigint NOT NULL,
    author_id bigint NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    location_id bigint NOT NULL,
    assigned_to bigint,
    assigned_time timestamp without time zone,
    finnished_time timestamp without time zone,
    resolution character varying,
    group_id bigint NOT NULL,
    urgent integer NOT NULL,
    company_id bigint,
    closed_by bigint
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- Name: old_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.old_tasks (
)
INHERITS (public.tasks);


ALTER TABLE public.old_tasks OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission character varying NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    image character varying,
    ac_price character varying,
    sell_price character varying,
    qty bigint,
    description character varying,
    location_id bigint,
    company_id bigint
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    group_id bigint,
    created_at timestamp without time zone,
    profile_picture character varying,
    type character varying,
    company_id bigint,
    name character varying,
    last_login timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- Name: history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: old_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: old_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: old_tasks created_at; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_tasks ALTER COLUMN created_at SET DEFAULT now();


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.companies (id, owner_id, name, phone, logo) FROM stdin;
\.
COPY public.companies (id, owner_id, name, phone, logo) FROM '$$PATH$$/2931.dat';

--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, details, company_id) FROM stdin;
\.
COPY public.groups (id, name, details, company_id) FROM '$$PATH$$/2913.dat';

--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (id, created_at, user_id, action) FROM stdin;
\.
COPY public.history (id, created_at, user_id, action) FROM '$$PATH$$/2915.dat';

--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name, address, contact, type, group_id, company_id) FROM stdin;
\.
COPY public.locations (id, name, address, contact, type, group_id, company_id) FROM '$$PATH$$/2917.dat';

--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM stdin;
\.
COPY public.notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM '$$PATH$$/2919.dat';

--
-- Data for Name: old_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.old_notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM stdin;
\.
COPY public.old_notifications (type, urgent, title, text, image, user_id, seen, created_at, redirect, company_id, id) FROM '$$PATH$$/2920.dat';

--
-- Data for Name: old_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.old_tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM stdin;
\.
COPY public.old_tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM '$$PATH$$/2922.dat';

--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, user_id, permission) FROM stdin;
\.
COPY public.permissions (id, user_id, permission) FROM '$$PATH$$/2923.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, image, ac_price, sell_price, qty, description, location_id, company_id) FROM stdin;
\.
COPY public.products (id, name, image, ac_price, sell_price, qty, description, location_id, company_id) FROM '$$PATH$$/2925.dat';

--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM stdin;
\.
COPY public.tasks (id, author_id, title, text, created_at, location_id, assigned_to, assigned_time, finnished_time, resolution, group_id, urgent, company_id, closed_by) FROM '$$PATH$$/2921.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, group_id, created_at, profile_picture, type, company_id, name, last_login) FROM stdin;
\.
COPY public.users (id, email, password, group_id, created_at, profile_picture, type, company_id, name, last_login) FROM '$$PATH$$/2928.dat';

--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.companies_id_seq', 1, false);


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 1, false);


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notifications_id_seq', 14, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 80, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: users email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email UNIQUE (email);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, email);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           