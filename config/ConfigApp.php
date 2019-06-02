<?php
  class ConfigApp
  {
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      '' => 'NavegacionController#ConsultaCliente',
      'consultacliente' => 'NavegacionController#MostrarPrueba',
      'consultafecha' => 'NavegacionController#ConsultaFecha',
      'consultavencimiento' => 'NavegacionController#ConsultaVencimiento'
    ];
  }
?>
