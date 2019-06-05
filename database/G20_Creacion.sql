CREATE TABLE gr20_alquiler (
    id_alquiler integer NOT NULL,
    id_cliente integer NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date,
    importe_dia numeric(10,2) NOT NULL
);

CREATE TABLE gr20_alquiler_posiciones (
    id_alquiler integer NOT NULL,
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    estado boolean NOT NULL
);

CREATE TABLE gr20_cliente (
    cuit_cuil integer NOT NULL,
    apellido character varying(60) NOT NULL,
    nombre character varying(40) NOT NULL,
    fecha_alta date NOT NULL
);

CREATE TABLE gr20_estanteria (
    nro_estanteria integer NOT NULL,
    nombre_estanteria character varying(80) NOT NULL
);

CREATE TABLE gr20_fila (
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    nombre_fila character varying(80) NOT NULL,
    peso_max_kg numeric(10,2) NOT NULL
);

CREATE TABLE gr20_mov_entrada (
    id_movimiento integer NOT NULL,
    transporte character varying(80) NOT NULL,
    guia character varying(80) NOT NULL,
    cod_pallet character varying(20) NOT NULL,
    id_alquiler integer NOT NULL,
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL
);

CREATE TABLE gr20_mov_interno (
    id_movimiento integer NOT NULL,
    id_movimiento_entrada integer NOT NULL,
    razon character varying(200),
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    id_movimiento_interno_prev integer
);

CREATE TABLE gr20_mov_salida (
    id_movimiento integer NOT NULL,
    id_movimiento_entrada integer NOT NULL,
    transporte character varying(80) NOT NULL,
    guia character varying(80) NOT NULL
);

CREATE TABLE gr20_movimiento (
    id_movimiento integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    responsable character varying(80) NOT NULL,
    tipo character(1) NOT NULL
);

CREATE TABLE gr20_pallet (
    cod_pallet character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL,
    peso numeric(10,2) NOT NULL
);

CREATE TABLE gr20_posicion (
    nro_posicion integer NOT NULL,
    nro_estanteria integer NOT NULL,
    nro_fila integer NOT NULL,
    pos_global integer NOT NULL,
    tipo character varying(40) NOT NULL
);

INSERT INTO gr20_alquiler VALUES (1, 5, '2016-08-27', '2018-02-14', 1.32);
INSERT INTO gr20_alquiler VALUES (2, 2, '2017-09-27', '2019-05-09', 6.96);
INSERT INTO gr20_alquiler VALUES (3, 1, '2017-01-24', '2018-02-15', 2.61);
INSERT INTO gr20_alquiler VALUES (4, 2, '2015-01-29', '2015-02-23', 8.05);
INSERT INTO gr20_alquiler VALUES (5, 4, '2017-02-21', '2018-04-12', 4.60);
INSERT INTO gr20_alquiler VALUES (6, 3, '2018-08-21', '2020-04-12', 10.65);
INSERT INTO gr20_alquiler VALUES (7, 3, '2018-09-21', '2020-04-12', 9.02);

INSERT INTO gr20_alquiler_posiciones VALUES (1, 1, 1, 1, true);
INSERT INTO gr20_alquiler_posiciones VALUES (2, 2, 2, 2, true);
INSERT INTO gr20_alquiler_posiciones VALUES (3, 3, 3, 3, true);
INSERT INTO gr20_alquiler_posiciones VALUES (4, 4, 4, 4, false);
INSERT INTO gr20_alquiler_posiciones VALUES (5, 5, 5, 5, false);

INSERT INTO gr20_cliente VALUES (1, 'Elizabeth', 'Matty', '2018-01-30');
INSERT INTO gr20_cliente VALUES (2, 'Peasnone', 'Athena', '2019-05-15');
INSERT INTO gr20_cliente VALUES (3, 'Kruschev', 'Joella', '2019-01-18');
INSERT INTO gr20_cliente VALUES (4, 'Dumbellow', 'Gran', '2017-09-10');
INSERT INTO gr20_cliente VALUES (5, 'Fronczak', 'Gavra', '2018-02-13');

INSERT INTO gr20_estanteria VALUES (1, 'Western Swamp Saxifrage');
INSERT INTO gr20_estanteria VALUES (2, 'Pignut');
INSERT INTO gr20_estanteria VALUES (3, 'Crucillo');
INSERT INTO gr20_estanteria VALUES (4, 'Clammy Groundcherry');
INSERT INTO gr20_estanteria VALUES (5, 'Silky Cryptantha');

INSERT INTO gr20_fila VALUES (1, 1, 'Jaloo', 18.33);
INSERT INTO gr20_fila VALUES (2, 2, 'Zazio', 83.50);
INSERT INTO gr20_fila VALUES (3, 3, 'Voolith', 80.64);
INSERT INTO gr20_fila VALUES (4, 4, 'Quatz', 24.34);
INSERT INTO gr20_fila VALUES (5, 5, 'Fivespan', 5.33);

INSERT INTO gr20_mov_entrada VALUES (1, 'Schroeder, Jacobi and Keeling', 'Sibbie Dawkes', '5', 2, 2, 2, 2);
INSERT INTO gr20_mov_entrada VALUES (2, 'Hahn Group', 'Pam Stockhill', '2', 1, 1, 1, 1);
INSERT INTO gr20_mov_entrada VALUES (3, 'Kuhic, Cummings and Abernathy', 'Misti Phipard-Shears', '2', 4, 4, 4, 4);
INSERT INTO gr20_mov_entrada VALUES (4, 'Purdy-Thiel', 'Teddie Scorrer', '1', 3, 3, 3, 3);
INSERT INTO gr20_mov_entrada VALUES (5, 'Reynolds Inc', 'Janka Pippard', '5', 5, 5, 5, 5);
INSERT INTO gr20_mov_entrada VALUES (16, 'Reynolds Inc', 'Janka Pippard', '2', 5, 5, 5, 5);
INSERT INTO gr20_mov_entrada VALUES (17, 'Reynolds Inc', 'Janka Pippard', '3', 5, 5, 5, 5);

INSERT INTO gr20_mov_interno VALUES (11, 1, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 1, 1, 1, NULL);
INSERT INTO gr20_mov_interno VALUES (12, 1, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 3, 3, 11);
INSERT INTO gr20_mov_interno VALUES (13, 2, 'Nullam varius.', 5, 5, 5, NULL);
INSERT INTO gr20_mov_interno VALUES (14, 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 4, 4, 4, 13);
INSERT INTO gr20_mov_interno VALUES (15, 2, 'In hac habitasse platea dictumst.', 2, 2, 2, 14);

INSERT INTO gr20_mov_salida VALUES (6, 1, 'Purdy, Parisian and Kuvalis', 'Tirrell Masurel');
INSERT INTO gr20_mov_salida VALUES (7, 2, 'Bechtelar, Blick and Maggio', 'Veronique Castard');
INSERT INTO gr20_mov_salida VALUES (8, 3, 'Walsh, Bailey and O''Reilly', 'Blancha Mattacks');
INSERT INTO gr20_mov_salida VALUES (9, 4, 'Maggio, Bartoletti and Hamill', 'Celestyn Crofts');
INSERT INTO gr20_mov_salida VALUES (10, 5, 'Ritchie Group', 'Lorie Cardenas');

INSERT INTO gr20_movimiento VALUES (1, '2017-11-26 00:00:00', 'Hartley Barnfather', 'e');
INSERT INTO gr20_movimiento VALUES (2, '2017-10-20 00:00:00', 'Dorthea Blewett', 'e');
INSERT INTO gr20_movimiento VALUES (3, '2016-01-20 00:00:00', 'Karen Dowling', 'e');
INSERT INTO gr20_movimiento VALUES (4, '2017-03-20 00:00:00', 'Anallise Shurrock', 'e');
INSERT INTO gr20_movimiento VALUES (5, '2016-09-03 00:00:00', 'Bettye Bransdon', 'e');
INSERT INTO gr20_movimiento VALUES (6, '2014-08-26 00:00:00', 'Pepe Argento', 's');
INSERT INTO gr20_movimiento VALUES (7, '2010-10-15 00:00:00', 'Moni Argento', 's');
INSERT INTO gr20_movimiento VALUES (8, '2014-05-20 00:00:00', 'Coqui Argento', 's');
INSERT INTO gr20_movimiento VALUES (9, '2012-07-20 00:00:00', 'Leo Messii', 's');
INSERT INTO gr20_movimiento VALUES (10, '2011-02-03 00:00:00', 'Benety Shake', 's');
INSERT INTO gr20_movimiento VALUES (11, '2010-05-20 00:00:00', 'Joy Spiner', 'i');
INSERT INTO gr20_movimiento VALUES (12, '2015-12-11 00:00:00', 'Pepe Landia', 'i');
INSERT INTO gr20_movimiento VALUES (13, '2016-07-25 00:00:00', 'Cristian Diaz', 'i');
INSERT INTO gr20_movimiento VALUES (14, '2013-06-22 00:00:00', 'Lean Man', 'i');
INSERT INTO gr20_movimiento VALUES (15, '2016-08-03 00:00:00', 'John Bravo', 'i');
INSERT INTO gr20_movimiento VALUES (16, '2015-09-03 00:00:00', 'Betty Brand', 'e');
INSERT INTO gr20_movimiento VALUES (17, '2018-05-06 00:00:00', 'Elton Brand', 'e');
INSERT INTO gr20_movimiento VALUES (18, '2018-05-06 00:00:00', 'Bran Brand', 'e');

INSERT INTO gr20_pallet VALUES ('1', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 68.76);
INSERT INTO gr20_pallet VALUES ('2', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 74.94);
INSERT INTO gr20_pallet VALUES ('3', 'Curabitur convallis.', 40.65);
INSERT INTO gr20_pallet VALUES ('4', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 92.94);
INSERT INTO gr20_pallet VALUES ('5', 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 98.13);
INSERT INTO gr20_pallet VALUES ('6', 'Pallet con mucho peso', 500.65);

INSERT INTO gr20_posicion VALUES (1, 1, 1, 34, 'general');
INSERT INTO gr20_posicion VALUES (2, 2, 2, 26, 'vidrio');
INSERT INTO gr20_posicion VALUES (3, 3, 3, 38, 'insecticidas');
INSERT INTO gr20_posicion VALUES (4, 4, 4, 74, 'inflamable');
INSERT INTO gr20_posicion VALUES (5, 5, 5, 81, 'general');
INSERT INTO gr20_posicion VALUES (6, 3, 3, 10, 'vidrio');


ALTER TABLE ONLY gr20_alquiler
    ADD CONSTRAINT pk_gr20_alquiler PRIMARY KEY (id_alquiler);


ALTER TABLE ONLY gr20_alquiler_posiciones
    ADD CONSTRAINT pk_gr20_alquiler_posiciones PRIMARY KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_cliente
    ADD CONSTRAINT pk_gr20_cliente PRIMARY KEY (cuit_cuil);


ALTER TABLE ONLY gr20_estanteria
    ADD CONSTRAINT pk_gr20_estanteria PRIMARY KEY (nro_estanteria);


ALTER TABLE ONLY gr20_fila
    ADD CONSTRAINT pk_gr20_fila PRIMARY KEY (nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_mov_entrada
    ADD CONSTRAINT pk_gr20_mov_entrada PRIMARY KEY (id_movimiento);


ALTER TABLE ONLY gr20_mov_interno
    ADD CONSTRAINT pk_gr20_mov_interno PRIMARY KEY (id_movimiento);


ALTER TABLE ONLY gr20_mov_salida
    ADD CONSTRAINT pk_gr20_mov_salida PRIMARY KEY (id_movimiento, id_movimiento_entrada);


ALTER TABLE ONLY gr20_movimiento
    ADD CONSTRAINT pk_gr20_movimiento PRIMARY KEY (id_movimiento);


ALTER TABLE ONLY gr20_pallet
    ADD CONSTRAINT pk_gr20_pallet PRIMARY KEY (cod_pallet);


ALTER TABLE ONLY gr20_posicion
    ADD CONSTRAINT pk_gr20_posicion PRIMARY KEY (nro_posicion, nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_posicion
    ADD CONSTRAINT uq_gr20_posicion_pos_global UNIQUE (pos_global);


ALTER TABLE ONLY gr20_alquiler
    ADD CONSTRAINT fk_gr20_alquiler_cliente FOREIGN KEY (id_cliente) REFERENCES gr20_cliente(cuit_cuil);


ALTER TABLE ONLY gr20_alquiler_posiciones
    ADD CONSTRAINT fk_gr20_alquiler_posiciones_alquiler FOREIGN KEY (id_alquiler) REFERENCES gr20_alquiler(id_alquiler);


ALTER TABLE ONLY gr20_alquiler_posiciones
    ADD CONSTRAINT fk_gr20_alquiler_posiciones_posicion FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila) REFERENCES gr20_posicion(nro_posicion, nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_fila
    ADD CONSTRAINT fk_gr20_fila_estanteria FOREIGN KEY (nro_estanteria) REFERENCES gr20_estanteria(nro_estanteria);


ALTER TABLE ONLY gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_alquiler_posiciones FOREIGN KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila) REFERENCES gr20_alquiler_posiciones(id_alquiler, nro_posicion, nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_movimiento FOREIGN KEY (id_movimiento) REFERENCES gr20_movimiento(id_movimiento);


ALTER TABLE ONLY gr20_mov_entrada
    ADD CONSTRAINT fk_gr20_mov_entrada_pallet FOREIGN KEY (cod_pallet) REFERENCES gr20_pallet(cod_pallet);


ALTER TABLE ONLY gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_mov_entrada FOREIGN KEY (id_movimiento_entrada) REFERENCES gr20_mov_entrada(id_movimiento);


ALTER TABLE ONLY gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_mov_interno FOREIGN KEY (id_movimiento_interno_prev) REFERENCES gr20_mov_interno(id_movimiento);


ALTER TABLE ONLY gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_movimiento FOREIGN KEY (id_movimiento) REFERENCES gr20_movimiento(id_movimiento);


ALTER TABLE ONLY gr20_mov_interno
    ADD CONSTRAINT fk_gr20_mov_interno_posicion FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila) REFERENCES gr20_posicion(nro_posicion, nro_estanteria, nro_fila);


ALTER TABLE ONLY gr20_mov_salida
    ADD CONSTRAINT fk_gr20_mov_salida_mov_entrada FOREIGN KEY (id_movimiento_entrada) REFERENCES gr20_mov_entrada(id_movimiento);


ALTER TABLE ONLY gr20_mov_salida
    ADD CONSTRAINT fk_gr20_mov_salida_movimiento FOREIGN KEY (id_movimiento) REFERENCES gr20_movimiento(id_movimiento);


ALTER TABLE ONLY gr20_posicion
    ADD CONSTRAINT fk_gr20_posicion_fila FOREIGN KEY (nro_estanteria, nro_fila) REFERENCES gr20_fila(nro_estanteria, nro_fila);

