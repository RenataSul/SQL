--
-- PostgreSQL database dump
--
DROP DATABASE IF EXISTS market;
CREATE DATABASE market ENCODING = 'UTF8';
ALTER DATABASE market OWNER TO postgres;
\connect market


CREATE TABLE public.consumer (
    consumer_id integer NOT NULL,
    surname character(20) NOT NULL,
    name_ character(20) NOT NULL,
    gender character(10) NOT NULL,
    phone bigint NOT NULL,
    email character(50) NOT NULL
);


ALTER TABLE public.consumer OWNER TO postgres;


CREATE SEQUENCE public.consumer_consumer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_consumer_id_seq OWNER TO postgres;

ALTER SEQUENCE public.consumer_consumer_id_seq OWNED BY public.consumer.consumer_id;




CREATE TABLE public.del_adress (
    del_adress_id integer NOT NULL,
    street character(20) NOT NULL,
    house integer NOT NULL,
    entrance integer NOT NULL
);


ALTER TABLE public.del_adress OWNER TO postgres;


CREATE SEQUENCE public.del_adress_del_adress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.del_adress_del_adress_id_seq OWNER TO postgres;

ALTER SEQUENCE public.del_adress_del_adress_id_seq OWNED BY public.del_adress.del_adress_id;


CREATE TABLE public.market (
    market_id integer NOT NULL,
    name_ character(20) NOT NULL
);


ALTER TABLE public.market OWNER TO postgres;


CREATE TABLE public.operation (
    operation_id integer NOT NULL,
    consumer_id integer NOT NULL,
    product_id integer NOT NULL,
    del_adress_id integer NOT NULL
);


ALTER TABLE public.operation OWNER TO postgres;


CREATE SEQUENCE public.operation_consumer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operation_consumer_id_seq OWNER TO postgres;


ALTER SEQUENCE public.operation_consumer_id_seq OWNED BY public.operation.operation_id;


CREATE TABLE public.product (
    product_id integer NOT NULL,
    market_id integer NOT NULL,
    name_ character(20) NOT NULL,
    size_ integer,
    color character(20) NOT NULL,
    price integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price > 0))
);


ALTER TABLE public.product OWNER TO postgres;


CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;
ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
ALTER TABLE ONLY public.consumer ALTER COLUMN consumer_id SET DEFAULT nextval('public.consumer_consumer_id_seq'::regclass);
ALTER TABLE ONLY public.del_adress ALTER COLUMN del_adress_id SET DEFAULT nextval('public.del_adress_del_adress_id_seq'::regclass);
ALTER TABLE ONLY public.operation ALTER COLUMN operation_id SET DEFAULT nextval('public.operation_consumer_id_seq'::regclass);
ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


COPY public.consumer (consumer_id, surname, name_, gender, phone, email) FROM stdin;
1	Aminov              	Artem               	male      	89834783648	alart@mail.ru                                     
2	Krikova             	Daria               	female    	89479347263	krida@mail.ru                                     
3	Zubova              	Maria               	female    	83759827401	zubmar@mail.ru                                    
4	Nikolaev            	Kirill              	male      	89649871034	nikki@mail.ru                                     
5	Alikova             	Zinaida             	female    	89037468275	alizi@mail.ru                                     
6	Sukunov             	Danil               	male      	86286473728	sukundan@mail.ru                                  
7	Rotikov             	Leonid              	male      	83546758305	rotleon@mail.ru                                   
8	Vintik              	Olga                	female    	83245674098	vintikol@mail.ru                                  
9	Bortova             	Alina               	female    	86487239210	bortalin@mail.ru                                  
10	Pupkin              	Vladimir            	male      	89068792961	pupvlad@mail.ru                                   
11	Jordan              	Nick                	male      	89547230583	jordnick@mail.ru                                  
12	Bortova             	Karina              	female    	89372850361	bortkar@mail.ru                                   
13	Fortich             	Oleg                	male      	89052956376	fortoleg@mail.ru                                  
14	Evdokimov           	Sergey              	male      	85436488453	evdser@mail.ru                                    
15	Osipov              	Alexandr            	male      	89663877360	osipal@mail.ru                                    
\.

COPY public.del_adress (del_adress_id, street, house, entrance) FROM stdin;
1	Chicherinskaya      	2	1
2	Peterhofskaya       	8	3
3	Botanicheskaya      	18	2
4	Shakhmatova         	14	2
5	Chicherinskaya      	2	3
6	Chebishevskaya      	14	1
7	Khalturina          	3	1
8	Razvodnaya          	29	4
9	Khalturina          	1	2
10	Razvodnaya          	29	1
\.


COPY public.market (market_id, name_) FROM stdin;
1	Befree              
2	Gloria Jeans        
3	Maag                
4	Re                  
5	Love republic       
6	Sunlight            
7	Golden Apple        
8	SuperStep           
9	RalfRinger          
10	Lacoste             
\.


COPY public.operation (operation_id, consumer_id, product_id, del_adress_id) FROM stdin;
1	1	9	10
2	2	6	2
3	3	7	9
4	4	8	2
5	5	1	4
6	5	11	4
7	6	3	7
8	7	5	3
9	7	2	3
10	7	9	3
11	8	4	1
12	9	10	5
13	10	8	6
14	11	12	8
15	12	1	4
16	13	7	9
17	13	4	9
18	13	2	8
19	14	3	10
20	15	11	1
\.


COPY public.product (product_id, market_id, name_, size_, color, price) FROM stdin;
3	4	t-shirt             	42	blue                	999
4	6	bracelet            	24	silver              	4699
5	2	sweater             	56	white               	3499
6	10	sneakers            	43	black               	5999
7	3	dress               	44	green               	3799
8	9	shoes               	38	black               	5399
9	1	shorts              	48	grey                	899
10	2	jumper              	54	white               	2499
11	5	skirt               	42	black               	2599
12	8	sneakers            	43	grey                	999
13	10	t-shirt             	46	white               	3699
14	4	t-shirt             	54	yellow              	799
1	1	skirt               	46	pink                	1499
2	3	dress               	40	red                 	6799
15	2	jacket              	54	black               	12699
\.


SELECT pg_catalog.setval('public.consumer_consumer_id_seq', 1, false);
SELECT pg_catalog.setval('public.del_adress_del_adress_id_seq', 1, false);
SELECT pg_catalog.setval('public.operation_consumer_id_seq', 20, true);
SELECT pg_catalog.setval('public.product_product_id_seq', 14, true);


ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_email_key UNIQUE (email);


ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_phone_key UNIQUE (phone);


ALTER TABLE ONLY public.consumer
    ADD CONSTRAINT consumer_pkey PRIMARY KEY (consumer_id);


ALTER TABLE ONLY public.del_adress
    ADD CONSTRAINT del_adress_pkey PRIMARY KEY (del_adress_id);


ALTER TABLE ONLY public.market
    ADD CONSTRAINT market_name__key UNIQUE (name_);


ALTER TABLE ONLY public.market
    ADD CONSTRAINT market_pkey PRIMARY KEY (market_id);


ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (operation_id);


ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_consumer_id_fkey FOREIGN KEY (consumer_id) REFERENCES public.operation(operation_id);


ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_del_adress_id_fkey FOREIGN KEY (del_adress_id) REFERENCES public.operation(operation_id);


ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.operation(operation_id);


ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_market_id_fkey FOREIGN KEY (market_id) REFERENCES public.product(product_id);


\connect postgres

DROP DATABASE market;
--
-- PostgreSQL database dump complete
--