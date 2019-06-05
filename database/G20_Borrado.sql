DROP FUNCTION IF EXISTS trfn_gr20_peso_pallets_fila() CASCADE;

DROP FUNCTION IF EXISTS pr_gr20_posiciones_libres(fecha varchar);

DROP FUNCTION IF EXISTS pr_gr20_clientes_vencimiento_dias(dias integer);

DROP FUNCTION IF EXISTS pr_gr20_cliente_posiciones(cuit_cuil integer);

DROP VIEW IF EXISTS gr20_posiciones_estado;

DROP VIEW IF EXISTS gr20_clientes_alquiler_inversion;

DROP TABLE IF EXISTS gr20_alquiler, gr20_alquiler_posiciones, gr20_cliente, gr20_estanteria, gr20_fila, 
gr20_mov_entrada, gr20_mov_interno, gr20_mov_salida, gr20_movimiento, gr20_pallet, gr20_posicion CASCADE;