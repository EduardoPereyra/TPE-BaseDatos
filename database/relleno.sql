--estanteria
insert into gr20_estanteria (nro_estanteria, nombre_estanteria) values (1, 'Western Swamp Saxifrage');
insert into gr20_estanteria (nro_estanteria, nombre_estanteria) values (2, 'Pignut');
insert into gr20_estanteria (nro_estanteria, nombre_estanteria) values (3, 'Crucillo');
insert into gr20_estanteria (nro_estanteria, nombre_estanteria) values (4, 'Clammy Groundcherry');
insert into gr20_estanteria (nro_estanteria, nombre_estanteria) values (5, 'Silky Cryptantha');

--fila
insert into gr20_fila (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) values (1, 1, 'Jaloo', 18.33);
insert into gr20_fila (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) values (2, 2, 'Zazio', 83.5);
insert into gr20_fila (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) values (3, 3, 'Voolith', 80.64);
insert into gr20_fila (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) values (4, 4, 'Quatz', 24.34);
insert into gr20_fila (nro_estanteria, nro_fila, nombre_fila, peso_max_kg) values (5, 5, 'Fivespan', 5.33);

--posicion
insert into gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) values (1, 1, 1, 34, 'mTX-13');
insert into gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) values (2, 2, 2, 26, 'R1T-74');
insert into gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) values (3, 3, 3, 38, 'Os4-35');
insert into gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) values (4, 4, 4, 74, 'SL5-04');
insert into gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) values (5, 5, 5, 81, 'yTP-57');

--alquiler_posiciones
insert into gr20_alquiler_posiciones (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) values (1, 1, 1, 1, true);
insert into gr20_alquiler_posiciones (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) values (2, 2, 2, 2, true);
insert into gr20_alquiler_posiciones (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) values (3, 3, 3, 3, true);
insert into gr20_alquiler_posiciones (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) values (4, 4, 4, 4, false);
insert into gr20_alquiler_posiciones (id_alquiler, nro_posicion, nro_estanteria, nro_fila, estado) values (5, 5, 5, 5, false);

--cliente
insert into gr20_cliente (cuit_cuil, apellido, nombre, fecha_alta) values (1, 'Elizabeth', 'Matty', '2018/01/30');
insert into gr20_cliente (cuit_cuil, apellido, nombre, fecha_alta) values (2, 'Peasnone', 'Athena', '2019/05/15');
insert into gr20_cliente (cuit_cuil, apellido, nombre, fecha_alta) values (3, 'Kruschev', 'Joella', '2019/01/18');
insert into gr20_cliente (cuit_cuil, apellido, nombre, fecha_alta) values (4, 'Dumbellow', 'Gran', '2017/09/10');
insert into gr20_cliente (cuit_cuil, apellido, nombre, fecha_alta) values (5, 'Fronczak', 'Gavra', '2018/02/13');

--pallet
insert into gr20_pallet (cod_pallet, descripcion, peso) values (1, 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 68.76);
insert into gr20_pallet (cod_pallet, descripcion, peso) values (2, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis.', 74.94);
insert into gr20_pallet (cod_pallet, descripcion, peso) values (3, 'Curabitur convallis.', 40.65);
insert into gr20_pallet (cod_pallet, descripcion, peso) values (4, 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 92.94);
insert into gr20_pallet (cod_pallet, descripcion, peso) values (5, 'Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 98.13);

--alquiler
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (1, 5, '2016-08-27', '2018-02-14', 1.32);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (2, 2, '2017-09-27', '2019-05-09', 6.96);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (3, 1, '2017-01-24', '2018-02-15', 2.61);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (4, 2, '2015-01-29', '2015-02-23', 8.05);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (5, 4, '2017-02-21', '2018-04-12', 4.60);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (6, 3, '2018-08-21', '2020-04-12', 10.65);
insert into gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) values (7, 3, '2018-09-21', '2020-04-12', 9.02);
--movimiento
--entrada
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (1, '2017/11/26', 'Hartley Barnfather', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (2, '2017/10/20', 'Dorthea Blewett', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (3, '2016/01/20', 'Karen Dowling', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (4, '2017/03/20', 'Anallise Shurrock', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (5, '2016/09/03', 'Bettye Bransdon', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (16, '2015/09/03', 'Betty Brand', 'e');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (17, '2018/05/06', 'Elton Brand', 'e');
--salida
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (6, '2014/08/26', 'Pepe Argento', 's');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (7, '2010/10/15', 'Moni Argento', 's');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (8, '2014/05/20', 'Coqui Argento', 's');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (9, '2012/07/20', 'Leo Messii', 's');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (10, '2011/02/03', 'Benety Shake', 's');
--interno
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (11, '2010/05/20', 'Joy Spiner', 'i');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (12, '2015/12/11', 'Pepe Landia', 'i');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (13, '2016/07/25', 'Cristian Diaz', 'i');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (14, '2013/06/22', 'Lean Man', 'i');
insert into gr20_movimiento (id_movimiento, fecha, responsable, tipo) values (15, '2016/08/03', 'John Bravo', 'i');

--movimiento_entrada
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (1, 'Schroeder, Jacobi and Keeling', 'Sibbie Dawkes', 5, 2, 2, 2, 2);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (2, 'Hahn Group', 'Pam Stockhill', 2, 1, 1, 1, 1);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (3, 'Kuhic, Cummings and Abernathy', 'Misti Phipard-Shears', 2, 4, 4, 4, 4);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (4, 'Purdy-Thiel', 'Teddie Scorrer', 1, 3, 3, 3, 3);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (5, 'Reynolds Inc', 'Janka Pippard', 5, 5, 5, 5, 5);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (16, 'Reynolds Inc', 'Janka Pippard', 2, 5, 5, 5, 5);
insert into gr20_mov_entrada (id_movimiento, transporte, guia, cod_pallet, id_alquiler, nro_posicion, nro_estanteria, nro_fila) values (17, 'Reynolds Inc', 'Janka Pippard', 3, 5, 5, 5, 5);

--movimiento_salida
insert into gr20_mov_salida (id_movimiento, id_movimiento_entrada, transporte, guia) values (6, 1, 'Purdy, Parisian and Kuvalis', 'Tirrell Masurel');
insert into gr20_mov_salida (id_movimiento, id_movimiento_entrada, transporte, guia) values (7, 2, 'Bechtelar, Blick and Maggio', 'Veronique Castard');
insert into gr20_mov_salida (id_movimiento, id_movimiento_entrada, transporte, guia) values (8, 3, 'Walsh, Bailey and O''Reilly', 'Blancha Mattacks');
insert into gr20_mov_salida (id_movimiento, id_movimiento_entrada, transporte, guia) values (9, 4, 'Maggio, Bartoletti and Hamill', 'Celestyn Crofts');
insert into gr20_mov_salida (id_movimiento, id_movimiento_entrada, transporte, guia) values (10, 5, 'Ritchie Group', 'Lorie Cardenas');

--movimiento_interno
insert into gr20_mov_interno (id_movimiento, id_movimiento_entrada, razon, nro_posicion, nro_estanteria, nro_fila) values (11, 1, 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 1, 1, 1);
insert into gr20_mov_interno (id_movimiento, id_movimiento_entrada, razon, nro_posicion, nro_estanteria, nro_fila, id_movimiento_interno_prev) values (12, 1, 'Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 3, 3, 3, 11);
insert into gr20_mov_interno (id_movimiento, id_movimiento_entrada, razon, nro_posicion, nro_estanteria, nro_fila) values (13, 2, 'Nullam varius.', 5, 5, 5);
insert into gr20_mov_interno (id_movimiento, id_movimiento_entrada, razon, nro_posicion, nro_estanteria, nro_fila, id_movimiento_interno_prev) values (14, 2, 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.', 4, 4, 4, 13);
insert into gr20_mov_interno (id_movimiento, id_movimiento_entrada, razon, nro_posicion, nro_estanteria, nro_fila, id_movimiento_interno_prev) values (15, 2, 'In hac habitasse platea dictumst.', 2, 2, 2, 14);
