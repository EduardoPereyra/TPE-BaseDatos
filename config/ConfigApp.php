<?php
  class ConfigApp
  {
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      '' => 'NavegacionController#ConsultaCliente',
	  'listaclientes' => 'NavegacionController#ListarClientes',
      'consultacliente' => 'NavegacionController#ConsultaCliente',
      'consultafecha' => 'NavegacionController#ConsultaFecha',
      'consultavencimiento' => 'NavegacionController#ConsultaVencimiento'
    ];
  }
?>
