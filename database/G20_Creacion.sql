CREATE SCHEMA unc_249318;


ALTER SCHEMA unc_249318 OWNER TO unc_249318;

--
-- Name: SCHEMA unc_249318; Type: COMMENT; Schema: -; Owner: unc_249318
--

COMMENT ON SCHEMA unc_249318 IS 'Wesenack, Ezequiel Marcos';

--
-- Name: gr20_alquiler; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_alquiler (
    id_alquiler integer NOT NULL,
    id_cliente integer NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date,
    importe_dia numeric(10,2) NOT NULL
);


ALTER TABLE unc_249318.gr20_alquiler OWNER TO unc_249318;

--
-- Name: gr20_alquiler_posiciones; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_alquiler_posiciones (
    id_alquiler integer NOT NULL,
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    estado boolean NOT NULL
);


ALTER TABLE unc_249318.gr20_alquiler_posiciones OWNER TO unc_249318;

--
-- Name: gr20_cliente; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_cliente (
    cuit_cuil integer NOT NULL,
    apellido character varying(60) NOT NULL,
    nombre character varying(40) NOT NULL,
    fecha_alta date NOT NULL
);


ALTER TABLE unc_249318.gr20_cliente OWNER TO unc_249318;

--
-- Name: gr20_estanteria; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_estanteria (
    nro_estanteria integer NOT NULL,
    nombre_estanteria character varying(80) NOT NULL
);


ALTER TABLE unc_249318.gr20_estanteria OWNER TO unc_249318;

--
-- Name: gr20_fila; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_fila (
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    nombre_fila character varying(80) NOT NULL,
    peso_max_kg numeric(10,2) NOT NULL
);


ALTER TABLE unc_249318.gr20_fila OWNER TO unc_249318;

--
-- Name: gr20_mov_entrada; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_mov_entrada (
    id_movimiento integer NOT NULL,
    transporte character varying(80) NOT NULL,
    guia character varying(80) NOT NULL,
    cod_pallet character varying(20) NOT NULL,
    id_alquiler integer NOT NULL,
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL
);


ALTER TABLE unc_249318.gr20_mov_entrada OWNER TO unc_249318;

--
-- Name: gr20_mov_interno; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_mov_interno (
    id_movimiento integer NOT NULL,
    id_movimiento_entrada integer NOT NULL,
    razon character varying(200),
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    id_movimiento_interno_prev integer
);


ALTER TABLE unc_249318.gr20_mov_interno OWNER TO unc_249318;

--
-- Name: gr20_mov_salida; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_mov_salida (
    id_movimiento integer NOT NULL,
    id_movimiento_entrada integer NOT NULL,
    transporte character varying(80) NOT NULL,
    guia character varying(80) NOT NULL
);


ALTER TABLE unc_249318.gr20_mov_salida OWNER TO unc_249318;

--
-- Name: gr20_movimiento; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_movimiento (
    id_movimiento integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    responsable character varying(80) NOT NULL,
    tipo character(1) NOT NULL
);


ALTER TABLE unc_249318.gr20_movimiento OWNER TO unc_249318;

--
-- Name: gr20_pallet; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_pallet (
    cod_pallet character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL,
    peso numeric(10,2) NOT NULL
);


ALTER TABLE unc_249318.gr20_pallet OWNER TO unc_249318;

--
-- Name: gr20_posicion; Type: TABLE; Schema: unc_249318; Owner: unc_249318
--

CREATE TABLE unc_249318.gr20_posicion (
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    pos_global integer NOT NULL,
    tipo character varying(40) NOT NULL
);


ALTER TABLE unc_249318.gr20_posicion OWNER TO unc_249318;

--
-- Data for Name: gr20_alquiler; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_alquiler VALUES (1, 5, '2018-02-14', '2016-08-27', 1.32);
INSERT INTO unc_249318.gr20_alquiler VALUES (2, 2, '2019-05-09', '2017-09-27', 6.96);
INSERT INTO unc_249318.gr20_alquiler VALUES (3, 1, '2018-02-15', '2017-01-24', 2.61);
INSERT INTO unc_249318.gr20_alquiler VALUES (4, 2, '2015-02-23', '2015-01-29', 8.05);
INSERT INTO unc_249318.gr20_alquiler VALUES (5, 4, '2017-02-21', '2018-04-12', 4.60);


--
-- Data for Name: gr20_alquiler_posiciones; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_alquiler_posiciones VALUES (1, 1, 1, 1, true);
INSERT INTO unc_249318.gr20_alquiler_posiciones VALUES (2, 2, 2, 2, true);
INSERT INTO unc_249318.gr20_alquiler_posiciones VALUES (3, 3, 3, 3, true);
INSERT INTO unc_249318.gr20_alquiler_posiciones VALUES (4, 4, 4, 4, false);
INSERT INTO unc_249318.gr20_alquiler_posiciones VALUES (5, 5, 5, 5, false);


--
-- Data for Name: gr20_cliente; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_cliente VALUES (1, 'Elizabeth', 'Matty', '2018-01-30');
INSERT INTO unc_249318.gr20_cliente VALUES (2, 'Peasnone', 'Athena', '2019-05-15');
INSERT INTO unc_249318.gr20_cliente VALUES (3, 'Kruschev', 'Joella', '2019-01-18');
INSERT INTO unc_249318.gr20_cliente VALUES (4, 'Dumbellow', 'Gran', '2017-09-10');
INSERT INTO unc_249318.gr20_cliente VALUES (5, 'Fronczak', 'Gavra', '2018-02-13');


--
-- Data for Name: gr20_estanteria; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_estanteria VALUES (1, 'Western Swamp Saxifrage');
INSERT INTO unc_249318.gr20_estanteria VALUES (2, 'Pignut');
INSERT INTO unc_249318.gr20_estanteria VALUES (3, 'Crucillo');
INSERT INTO unc_249318.gr20_estanteria VALUES (4, 'Clammy Groundcherry');
INSERT INTO unc_249318.gr20_estanteria VALUES (5, 'Silky Cryptantha');


--
-- Data for Name: gr20_fila; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_fila VALUES (1, 1, 'Jaloo', 18.33);
INSERT INTO unc_249318.gr20_fila VALUES (2, 2, 'Zazio', 83.50);
INSERT INTO unc_249318.gr20_fila VALUES (3, 3, 'Voolith', 80.64);
INSERT INTO unc_249318.gr20_fila VALUES (4, 4, 'Quatz', 24.34);
INSERT INTO unc_249318.gr20_fila VALUES (5, 5, 'Fivespan', 5.33);


--
-- Data for Name: gr20_mov_entrada; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_mov_entrada VALUES (1, 'Schroeder, Jacobi and Keeling', 'Sibbie Dawkes', '5', 2, 2, 2, 2);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (2, 'Hahn Group', 'Pam Stockhill', '2', 1, 1, 1, 1);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (3, 'Kuhic, Cummings and Abernathy', 'Misti Phipard-Shears', '2', 4, 4, 4, 4);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (4, 'Purdy-Thiel', 'Teddie Scorrer', '1', 3, 3, 3, 3);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (5, 'Reynolds Inc', 'Janka Pippard', '5', 5, 5, 5, 5);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (16, 'Reynolds Inc', 'Janka Pippard', '2', 5, 5, 5, 5);
INSERT INTO unc_249318.gr20_mov_entrada VALUES (17, 'Reynolds Inc', 'Janka Pippard', '3', 5, 5, 5, 5);


--
-- Data for Name: gr20_mov_interno; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_mov_interno VALUES (11, 1, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 1, 1, 1, NULL);
INSERT INTO unc_249318.gr20_mov_interno VALUES (12, 1, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 3, 3, 11);
INSERT INTO unc_249318.gr20_mov_interno VALUES (13, 2, 'Nullam varius.', 5, 5, 5, NULL);
INSERT INTO unc_249318.gr20_mov_interno VALUES (14, 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 4, 4, 4, 13);
INSERT INTO unc_249318.gr20_mov_interno VALUES (15, 2, 'In hac habitasse platea dictumst.', 2, 2, 2, 14);


--
-- Data for Name: gr20_mov_salida; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_mov_salida VALUES (6, 1, 'Purdy, Parisian and Kuvalis', 'Tirrell Masurel');
INSERT INTO unc_249318.gr20_mov_salida VALUES (7, 2, 'Bechtelar, Blick and Maggio', 'Veronique Castard');
INSERT INTO unc_249318.gr20_mov_salida VALUES (8, 3, 'Walsh, Bailey and O''Reilly', 'Blancha Mattacks');
INSERT INTO unc_249318.gr20_mov_salida VALUES (9, 4, 'Maggio, Bartoletti and Hamill', 'Celestyn Crofts');
INSERT INTO unc_249318.gr20_mov_salida VALUES (10, 5, 'Ritchie Group', 'Lorie Cardenas');


--
-- Data for Name: gr20_movimiento; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_movimiento VALUES (1, '2017-11-26 00:00:00', 'Hartley Barnfather', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (2, '2017-10-20 00:00:00', 'Dorthea Blewett', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (3, '2016-01-20 00:00:00', 'Karen Dowling', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (4, '2017-03-20 00:00:00', 'Anallise Shurrock', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (5, '2016-09-03 00:00:00', 'Bettye Bransdon', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (6, '2014-08-26 00:00:00', 'Pepe Argento', 's');
INSERT INTO unc_249318.gr20_movimiento VALUES (7, '2010-10-15 00:00:00', 'Moni Argento', 's');
INSERT INTO unc_249318.gr20_movimiento VALUES (8, '2014-05-20 00:00:00', 'Coqui Argento', 's');
INSERT INTO unc_249318.gr20_movimiento VALUES (9, '2012-07-20 00:00:00', 'Leo Messii', 's');
INSERT INTO unc_249318.gr20_movimiento VALUES (10, '2011-02-03 00:00:00', 'Benety Shake', 's');
INSERT INTO unc_249318.gr20_movimiento VALUES (11, '2010-05-20 00:00:00', 'Joy Spiner', 'i');
INSERT INTO unc_249318.gr20_movimiento VALUES (12, '2015-12-11 00:00:00', 'Pepe Landia', 'i');
INSERT INTO unc_249318.gr20_movimiento VALUES (13, '2016-07-25 00:00:00', 'Cristian Diaz', 'i');
INSERT INTO unc_249318.gr20_movimiento VALUES (14, '2013-06-22 00:00:00', 'Lean Man', 'i');
INSERT INTO unc_249318.gr20_movimiento VALUES (15, '2016-08-03 00:00:00', 'John Bravo', 'i');
INSERT INTO unc_249318.gr20_movimiento VALUES (16, '2015-09-03 00:00:00', 'Betty Brand', 'e');
INSERT INTO unc_249318.gr20_movimiento VALUES (17, '2018-05-06 00:00:00', 'Elton Brand', 'e');


--
-- Data for Name: gr20_pallet; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_pallet VALUES ('1', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 68.76);
INSERT INTO unc_249318.gr20_pallet VALUES ('2', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 74.94);
INSERT INTO unc_249318.gr20_pallet VALUES ('3', 'Curabitur convallis.', 40.65);
INSERT INTO unc_249318.gr20_pallet VALUES ('4', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 92.94);
INSERT INTO unc_249318.gr20_pallet VALUES ('5', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 98.13);


--
-- Data for Name: gr20_posicion; Type: TABLE DATA; Schema: unc_249318; Owner: unc_249318
--

INSERT INTO unc_249318.gr20_posicion VALUES (1, 1, 1, 34, 'mTX-13');
INSERT INTO unc_249318.gr20_posicion VALUES (2, 2, 2, 26, 'R1T-74');
INSERT INTO unc_249318.gr20_posicion VALUES (3, 3, 3, 38, 'Os4-35');
INSERT INTO unc_249318.gr20_posicion VALUES (4, 4, 4, 74, 'SL5-04');
INSERT INTO unc_249318.gr20_posicion VALUES (5, 5, 5, 81, 'yTP-57');


--
-- Name: gr20_alquiler pk_gr20_alquiler; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_alquiler
    ADD CONSTRAINT pk_gr20_alquiler PRIMARY KEY (id_alquiler);


--
-- Name: gr20_alquiler_posiciones pk_gr20_alquiler_posiciones; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_alquiler_posiciones
    ADD CONSTRAINT pk_gr20_alquiler_posiciones PRIMARY KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila);


--
-- Name: gr20_cliente pk_gr20_cliente; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_cliente
    ADD CONSTRAINT pk_gr20_cliente PRIMARY KEY (cuit_cuil);


--
-- Name: gr20_estanteria pk_gr20_estanteria; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_estanteria
    ADD CONSTRAINT pk_gr20_estanteria PRIMARY KEY (nro_estanteria);


--
-- Name: gr20_fila pk_gr20_fila; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_fila
    ADD CONSTRAINT pk_gr20_fila PRIMARY KEY (nro_estanteria, nro_fila);


--
-- Name: gr20_mov_entrada pk_gr20_mov_entrada; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_entrada
    ADD CONSTRAINT pk_gr20_mov_entrada PRIMARY KEY (id_movimiento);


--
-- Name: gr20_mov_interno pk_gr20_mov_interno; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_interno
    ADD CONSTRAINT pk_gr20_mov_interno PRIMARY KEY (id_movimiento);


--
-- Name: gr20_mov_salida pk_gr20_mov_salida; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_salida
    ADD CONSTRAINT pk_gr20_mov_salida PRIMARY KEY (id_movimiento, id_movimiento_entrada);


--
-- Name: gr20_movimiento pk_gr20_movimiento; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_movimiento
    ADD CONSTRAINT pk_gr20_movimiento PRIMARY KEY (id_movimiento);


--
-- Name: gr20_pallet pk_gr20_pallet; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_pallet
    ADD CONSTRAINT pk_gr20_pallet PRIMARY KEY (cod_pallet);


--
-- Name: gr20_posicion pk_gr20_posicion; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_posicion
    ADD CONSTRAINT pk_gr20_posicion PRIMARY KEY (nro_posicion, nro_estanteria, nro_fila);


--
-- Name: gr20_posicion uq_gr20_posicion_pos_global; Type: CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_posicion
    ADD CONSTRAINT uq_gr20_posicion_pos_global UNIQUE (pos_global);


--
-- Name: gr20_alquiler fk_gr20_alquiler_cliente; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_alquiler
    ADD CONSTRAINT fk_gr20_alquiler_cliente FOREIGN KEY (id_cliente) REFERENCES unc_249318.gr20_cliente(cuit_cuil);


--
-- Name: gr20_alquiler_posiciones fk_gr20_alquiler_posiciones_alquiler; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_alquiler_posiciones
    ADD CONSTRAINT fk_gr20_alquiler_posiciones_alquiler FOREIGN KEY (id_alquiler) REFERENCES unc_249318.gr20_alquiler(id_alquiler);


--
-- Name: gr20_alquiler_posiciones fk_gr20_alquiler_posiciones_posicion; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_alquiler_posiciones
    ADD CONSTRAINT fk_gr20_alquiler_posiciones_posicion FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila) REFERENCES unc_249318.gr20_posicion(nro_posicion, nro_estanteria, nro_fila);


--
-- Name: gr20_fila fk_gr20_fila_estanteria; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_fila
    ADD CONSTRAINT fk_gr20_fila_estanteria FOREIGN KEY (nro_estanteria) REFERENCES unc_249318.gr20_estanteria(nro_estanteria);


--
-- Name: gr20_mov_entrada fk_gr20_mov_entrada_alquiler_posiciones; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_alquiler_posiciones FOREIGN KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila) REFERENCES unc_249318.gr20_alquiler_posiciones(id_alquiler, nro_posicion, nro_estanteria, nro_fila);


--
-- Name: gr20_mov_entrada fk_gr20_mov_entrada_movimiento; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_movimiento FOREIGN KEY (id_movimiento) REFERENCES unc_249318.gr20_movimiento(id_movimiento);


--
-- Name: gr20_mov_entrada fk_gr20_mov_entrada_pallet; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_pallet FOREIGN KEY (cod_pallet) REFERENCES unc_249318.gr20_pallet(cod_pallet);


--
-- Name: gr20_mov_interno fk_gr20_mov_interno_mov_entrada; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_mov_entrada FOREIGN KEY (id_movimiento_entrada) REFERENCES unc_249318.gr20_mov_entrada(id_movimiento);


--
-- Name: gr20_mov_interno fk_gr20_mov_interno_mov_interno; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_mov_interno FOREIGN KEY (id_movimiento_interno_prev) REFERENCES unc_249318.gr20_mov_interno(id_movimiento);


--
-- Name: gr20_mov_interno fk_gr20_mov_interno_movimiento; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_movimiento FOREIGN KEY (id_movimiento) REFERENCES unc_249318.gr20_movimiento(id_movimiento);


--
-- Name: gr20_mov_interno fk_gr20_mov_interno_posicion; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_posicion FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila) REFERENCES unc_249318.gr20_posicion(nro_posicion, nro_estanteria, nro_fila);


--
-- Name: gr20_mov_salida fk_gr20_mov_salida_mov_entrada; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_salida
    ADD CONSTRAINT fk_gr20_mov_salida_mov_entrada FOREIGN KEY (id_movimiento_entrada) REFERENCES unc_249318.gr20_mov_entrada(id_movimiento);


--
-- Name: gr20_mov_salida fk_gr20_mov_salida_movimiento; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_mov_salida
    ADD CONSTRAINT fk_gr20_mov_salida_movimiento FOREIGN KEY (id_movimiento) REFERENCES unc_249318.gr20_movimiento(id_movimiento);


--
-- Name: gr20_posicion fk_gr20_posicion_fila; Type: FK CONSTRAINT; Schema: unc_249318; Owner: unc_249318
--

ALTER TABLE ONLY unc_249318.gr20_posicion
    ADD CONSTRAINT fk_gr20_posicion_fila FOREIGN KEY (nro_estanteria, nro_fila) REFERENCES unc_249318.gr20_fila(nro_estanteria, nro_fila);


--
-- PostgreSQL database dump complete
--