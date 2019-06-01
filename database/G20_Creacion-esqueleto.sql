-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-05-31 14:40:07.389

-- tables
-- Table: GR20_ALQUILER
CREATE TABLE GR20_ALQUILER (
    id_alquiler int  NOT NULL,
    id_cliente int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NULL,
    importe_dia decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR20_ALQUILER PRIMARY KEY (id_alquiler)
);

-- Table: GR20_ALQUILER_POSICIONES
CREATE TABLE GR20_ALQUILER_POSICIONES (
    id_alquiler int  NOT NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    estado boolean  NOT NULL,
    CONSTRAINT PK_GR20_ALQUILER_POSICIONES PRIMARY KEY (id_alquiler,nro_posicion,nro_estanteria,nro_fila)
);

-- Table: GR20_CLIENTE
CREATE TABLE GR20_CLIENTE (
    cuit_cuil int  NOT NULL,
    apellido varchar(60)  NOT NULL,
    nombre varchar(40)  NOT NULL,
    fecha_alta date  NOT NULL,
    CONSTRAINT PK_GR20_CLIENTE PRIMARY KEY (cuit_cuil)
);

-- Table: GR20_ESTANTERIA
CREATE TABLE GR20_ESTANTERIA (
    nro_estanteria int  NOT NULL,
    nombre_estanteria varchar(80)  NOT NULL,
    CONSTRAINT PK_GR20_ESTANTERIA PRIMARY KEY (nro_estanteria)
);

-- Table: GR20_FILA
CREATE TABLE GR20_FILA (
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    nombre_fila varchar(80)  NOT NULL,
    peso_max_kg decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR20_FILA PRIMARY KEY (nro_estanteria,nro_fila)
);

-- Table: GR20_MOVIMIENTO
CREATE TABLE GR20_MOVIMIENTO (
    id_movimiento int  NOT NULL,
    fecha timestamp  NOT NULL,
    responsable varchar(80)  NOT NULL,
    tipo char(1)  NOT NULL,
    CONSTRAINT PK_GR20_MOVIMIENTO PRIMARY KEY (id_movimiento)
);

-- Table: GR20_MOV_ENTRADA
CREATE TABLE GR20_MOV_ENTRADA (
    id_movimiento int  NOT NULL,
    transporte varchar(80)  NOT NULL,
    guia varchar(80)  NOT NULL,
    cod_pallet varchar(20)  NOT NULL,
    id_alquiler int  NOT NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    CONSTRAINT PK_GR20_MOV_ENTRADA PRIMARY KEY (id_movimiento)
);

-- Table: GR20_MOV_INTERNO
CREATE TABLE GR20_MOV_INTERNO (
    id_movimiento int  NOT NULL,
    id_movimiento_entrada int  NOT NULL,
    razon varchar(200)  NULL,
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    id_movimiento_interno_prev int  NULL,
    CONSTRAINT PK_GR20_MOV_INTERNO PRIMARY KEY (id_movimiento)
);

-- Table: GR20_MOV_SALIDA
CREATE TABLE GR20_MOV_SALIDA (
    id_movimiento int  NOT NULL,
    id_movimiento_entrada int  NOT NULL,
    transporte varchar(80)  NOT NULL,
    guia varchar(80)  NOT NULL,
    CONSTRAINT PK_GR20_MOV_SALIDA PRIMARY KEY (id_movimiento,id_movimiento_entrada)
);

-- Table: GR20_PALLET
CREATE TABLE GR20_PALLET (
    cod_pallet varchar(20)  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    peso decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR20_PALLET PRIMARY KEY (cod_pallet)
);

-- Table: GR20_POSICION
CREATE TABLE GR20_POSICION (
    nro_posicion int  NOT NULL,
    nro_estanteria int  NOT NULL,
    nro_fila int  NOT NULL,
    pos_global int  NOT NULL,
    tipo varchar(40)  NOT NULL,
    CONSTRAINT UQ_GR20_POSICION_pos_global UNIQUE (pos_global) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PK_GR20_POSICION PRIMARY KEY (nro_posicion,nro_estanteria,nro_fila)
);

-- foreign keys
-- Reference: FK_GR20_ALQUILER_CLIENTE (table: GR20_ALQUILER)
ALTER TABLE GR20_ALQUILER ADD CONSTRAINT FK_GR20_ALQUILER_CLIENTE
    FOREIGN KEY (id_cliente)
    REFERENCES GR20_CLIENTE (cuit_cuil)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_ALQUILER_POSICIONES_ALQUILER (table: GR20_ALQUILER_POSICIONES)
ALTER TABLE GR20_ALQUILER_POSICIONES ADD CONSTRAINT FK_GR20_ALQUILER_POSICIONES_ALQUILER
    FOREIGN KEY (id_alquiler)
    REFERENCES GR20_ALQUILER (id_alquiler)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_ALQUILER_POSICIONES_POSICION (table: GR20_ALQUILER_POSICIONES)
ALTER TABLE GR20_ALQUILER_POSICIONES ADD CONSTRAINT FK_GR20_ALQUILER_POSICIONES_POSICION
    FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR20_POSICION (nro_posicion, nro_estanteria, nro_fila)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_FILA_ESTANTERIA (table: GR20_FILA)
ALTER TABLE GR20_FILA ADD CONSTRAINT FK_GR20_FILA_ESTANTERIA
    FOREIGN KEY (nro_estanteria)
    REFERENCES GR20_ESTANTERIA (nro_estanteria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_ENTRADA_ALQUILER_POSICIONES (table: GR20_MOV_ENTRADA)
ALTER TABLE GR20_MOV_ENTRADA ADD CONSTRAINT FK_GR20_MOV_ENTRADA_ALQUILER_POSICIONES
    FOREIGN KEY (id_alquiler, nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR20_ALQUILER_POSICIONES (id_alquiler, nro_posicion, nro_estanteria, nro_fila)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_ENTRADA_MOVIMIENTO (table: GR20_MOV_ENTRADA)
ALTER TABLE GR20_MOV_ENTRADA ADD CONSTRAINT FK_GR20_MOV_ENTRADA_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR20_MOVIMIENTO (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_ENTRADA_PALLET (table: GR20_MOV_ENTRADA)
ALTER TABLE GR20_MOV_ENTRADA ADD CONSTRAINT FK_GR20_MOV_ENTRADA_PALLET
    FOREIGN KEY (cod_pallet)
    REFERENCES GR20_PALLET (cod_pallet)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_INTERNO_MOVIMIENTO (table: GR20_MOV_INTERNO)
ALTER TABLE GR20_MOV_INTERNO ADD CONSTRAINT FK_GR20_MOV_INTERNO_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR20_MOVIMIENTO (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_INTERNO_MOV_ENTRADA (table: GR20_MOV_INTERNO)
ALTER TABLE GR20_MOV_INTERNO ADD CONSTRAINT FK_GR20_MOV_INTERNO_MOV_ENTRADA
    FOREIGN KEY (id_movimiento_entrada)
    REFERENCES GR20_MOV_ENTRADA (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_INTERNO_MOV_INTERNO (table: GR20_MOV_INTERNO)
ALTER TABLE GR20_MOV_INTERNO ADD CONSTRAINT FK_GR20_MOV_INTERNO_MOV_INTERNO
    FOREIGN KEY (id_movimiento_interno_prev)
    REFERENCES GR20_MOV_INTERNO (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_INTERNO_POSICION (table: GR20_MOV_INTERNO)
ALTER TABLE GR20_MOV_INTERNO ADD CONSTRAINT FK_GR20_MOV_INTERNO_POSICION
    FOREIGN KEY (nro_posicion, nro_estanteria, nro_fila)
    REFERENCES GR20_POSICION (nro_posicion, nro_estanteria, nro_fila)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_SALIDA_MOVIMIENTO (table: GR20_MOV_SALIDA)
ALTER TABLE GR20_MOV_SALIDA ADD CONSTRAINT FK_GR20_MOV_SALIDA_MOVIMIENTO
    FOREIGN KEY (id_movimiento)
    REFERENCES GR20_MOVIMIENTO (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_MOV_SALIDA_MOV_ENTRADA (table: GR20_MOV_SALIDA)
ALTER TABLE GR20_MOV_SALIDA ADD CONSTRAINT FK_GR20_MOV_SALIDA_MOV_ENTRADA
    FOREIGN KEY (id_movimiento_entrada)
    REFERENCES GR20_MOV_ENTRADA (id_movimiento)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_GR20_POSICION_FILA (table: GR20_POSICION)
ALTER TABLE GR20_POSICION ADD CONSTRAINT FK_GR20_POSICION_FILA
    FOREIGN KEY (nro_estanteria, nro_fila)
    REFERENCES GR20_FILA (nro_estanteria, nro_fila)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

