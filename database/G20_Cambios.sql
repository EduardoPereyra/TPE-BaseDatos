--B. ELARABORACION DE RESTRICCIONES

--
--a) La fecha de todos los alquileres deben ser consistentes, 
--   es decir la fecha a partir de la cual se inicia un alquiler debe ser menor 
--   o igual a la fecha de finalización del mismo.
--   Sentencias que activan la restriccion:
--   UPDATE gr20_alquiler SET fecha_hasta = '2015-02-15' WHERE id_cliente = 3;
--   INSERT INTO gr20_alquiler (id_alquiler, id_cliente, fecha_desde, fecha_hasta, importe_dia) VALUES (8,3,'2018-02-14','2016-08-27', 8.02);
--

ALTER TABLE gr20_alquiler ADD CONSTRAINT chk_gr20_alquiler
  CHECK (fecha_desde <= fecha_hasta);


--
--b) El peso de los pallets de una fila no debe superar al máximo de la fila.
--   Sentencias que activan la restriccion:
--   UPDATE gr20_pallet SET peso = 1000 WHERE cod_pallet = '5';
--   UPDATE gr20_fila SET peso_max_kg = 0 WHERE nro_fila = '5';
--   INSERT INTO gr20_mov_entrada VALUES (18, 'Reynolds Inc', 'Janka Pippard', '6', 5, 5, 5, 5);
--   UPDATE gr20_mov_entrada SET cod_pallet = 6 WHERE nro_fila = '5';
--

CREATE FUNCTION trfn_gr20_peso_pallets_fila()
RETURNS TRIGGER AS $$
BEGIN 
  IF (tg_table_name = 'gr20_pallet') THEN
    IF (EXISTS(SELECT 1
               FROM gr20_fila f
               WHERE f.peso_max_kg < (SELECT SUM(p.peso)
                                      FROM gr20_mov_entrada m
                                      JOIN gr20_pallet p ON (m.cod_pallet = p.cod_pallet)
                                      WHERE p.cod_pallet = new.cod_pallet
                                      AND m.nro_fila = f.nro_fila AND m.nro_estanteria = f.nro_estanteria
                                      GROUP BY m.nro_fila
                                     )
                )
        ) THEN
            raise exception 'No se puede realizar la accion';
    ELSE
      return new;
    END IF;

  ELSE
    IF (EXISTS(SELECT 1
                FROM gr20_fila f
                WHERE f.nro_fila = new.nro_fila
                AND f.peso_max_kg < (SELECT SUM(p.peso)
                                    	FROM gr20_mov_entrada m
                                      JOIN gr20_pallet p ON (m.cod_pallet = p.cod_pallet)
                                      WHERE m.nro_fila = f.nro_fila AND m.nro_estanteria = f.nro_estanteria
                                      GROUP BY m.nro_fila
                                    )
              )
      ) THEN
          raise exception 'No se puede realizar la accion';
    ELSE
      return new;
    END IF;
  END IF;
END; $$
LANGUAGE 'plpgsql';

CREATE TRIGGER tr_gr20_pallet_peso_max
AFTER UPDATE OF peso ON gr20_pallet FOR EACH ROW
EXECUTE PROCEDURE trfn_gr20_peso_pallets_fila();

CREATE TRIGGER tr_gr20_mov_entrada_peso_max
AFTER INSERT OR UPDATE OF cod_pallet, nro_fila ON gr20_mov_entrada FOR EACH ROW
EXECUTE PROCEDURE trfn_gr20_peso_pallets_fila();

CREATE TRIGGER tr_gr20_fila_peso_max
AFTER UPDATE OF peso_max_kg ON gr20_fila FOR EACH ROW
EXECUTE PROCEDURE trfn_gr20_peso_pallets_fila();

--
--c) El tipo de posición puede tomar los siguientes valores “general”, “vidrio”, “insecticidas”, “inflamable”.
--   Sentencias que activan la restriccion:
--   INSERT INTO gr20_posicion (nro_posicion, nro_estanteria, nro_fila, pos_global, tipo) VALUES (6,1,1,90,'otro');
--   UPDATE gr20_posicion SET tipo = 'otro' WHERE nro_posicion = 5;
--

ALTER TABLE gr20_posicion ADD CONSTRAINT chk_gr20_posicion
  CHECK (tipo IN ('general', 'vidrio', 'insecticidas', 'inflamable'));



--
--C.SERVICIOS
--

--
--1. Para una fecha determinada dar la lista de las posiciones libres;
--   esto es número de estantería, número de fila y nro de posición.
--

CREATE FUNCTION pr_gr20_posiciones_libres(fecha varchar) 
  RETURNS TABLE(nro_estanteria integer, nro_fila integer, nro_posicion integer)
    AS $$
BEGIN
RETURN QUERY SELECT p.nro_estanteria, p.nro_fila, p.nro_posicion
              FROM gr20_posicion p
              WHERE NOT EXISTS(SELECT 1
                                FROM gr20_alquiler_posiciones ap
                                JOIN gr20_alquiler a ON (a.id_alquiler = ap.id_alquiler)
                                WHERE p.nro_posicion = ap.nro_posicion AND p.nro_fila = ap.nro_fila 
                                AND p.nro_estanteria = ap.nro_estanteria
                                AND (a.fecha_hasta IS NULL 
                                OR a.fecha_hasta > TO_DATE(fecha, 'DD/MM/YYYY')));
END; $$ LANGUAGE 'plpgsql';


--
--2. Dar la lista de los clientes que en una cierta cantidad de días (configurable)
--   se les debe avisar que se vence su alquiler.
--

CREATE FUNCTION pr_gr20_clientes_vencimiento_dias(dias integer)
  RETURNS TABLE (nombre VARCHAR, apellido VARCHAR, cuit_cuil integer)
AS $$
BEGIN
RETURN QUERY SELECT c.nombre, c.apellido, c.cuit_cuil
             FROM gr20_cliente c
             JOIN gr20_alquiler a ON(c.cuit_cuil = a.id_cliente)
             WHERE (a.fecha_hasta - a.fecha_desde) = dias
             AND a.fecha_hasta IS NOT NULL;
END; $$ LANGUAGE 'plpgsql';


--
--D.DEFINICION DE VISTAS
--

--
--1. Realizar una vista que para cada una de las posiciones indique su estado libre u ocupada, 
--   y para éste último caso se indique la cantidad de días que  restan de alquiler. 
--   Indicar los datos completos de la posición, fila y estantería.
--

CREATE VIEW gr20_posiciones_estado
AS SELECT ap.nro_posicion, ap.nro_fila, ap.nro_estanteria, ap.estado, 
          CASE ap.estado 
            WHEN '0' THEN '0'
            WHEN '1' THEN a.fecha_hasta-a.fecha_desde
          END
          AS dias
FROM gr20_alquiler_posiciones ap
JOIN gr20_alquiler a ON(ap.id_alquiler = a.id_alquiler);


--
--2. Realizar una vista que liste los 10 clientes que más dinero han invertido en el último año 
--   (tomar el momento en el que se ejecuta la consulta hacia atrás).
--

CREATE VIEW gr20_clientes_alquiler_inversion
AS SELECT c.cuit_cuil, c.apellido||', '||c.nombre AS "Apellido, Nombre",
    SUM(a.importe_dia * (now()::date - a.fecha_desde)::numeric) AS "Inversion ult. Año"
 FROM gr20_cliente c
 JOIN gr20_alquiler a ON c.cuit_cuil = a.id_cliente
 WHERE a.fecha_desde > (now() - '1 year'::interval)
 GROUP BY c.cuit_cuil
 ORDER BY "Inversion ult. Año" DESC
 LIMIT 10;


--
-- Funcion agregada para que en el sitio web realizado se puede cumlir con lo siguiente:
-- Y dado el código de cliente, de que posiciones tiene este ocupado actualmente 
-- (tomar la fecha de cuando se ejecuta la consulta).
--

CREATE FUNCTION pr_gr20_cliente_posiciones(cuit_cuil integer)
  RETURNS TABLE (id_alquiler integer, nro_posicion integer, nro_fila integer, nro_estanteria integer)
    AS $$
    BEGIN
    RETURN QUERY SELECT a.id_alquiler, ap.nro_posicion, ap.nro_fila, ap.nro_estanteria
                  FROM gr20_alquiler a
                  JOIN gr20_alquiler_posiciones ap ON(a.id_alquiler = ap.id_alquiler)
                  WHERE a.id_cliente = cuit_cuil
                  AND a.fecha_hasta IS NOT NULL
                  AND ap.estado = true AND a.fecha_hasta <= NOW();
END; $$ LANGUAGE 'plpgsql';