<?php
  class ConfigApp
  {
    public static $ACTION = 'action';
    public static $PARAMS = 'params';
    public static $ACTIONS = [
      '' => 'NavegacionController#ListarClientes',
	  'listaclientes' => 'NavegacionController#ListarClientes',
      'consultacliente' => 'NavegacionController#ConsultaCliente',
      'consultafecha' => 'NavegacionController#ConsultaFecha',
      'consultavencimiento' => 'NavegacionController#ConsultaVencimiento',
	  'listarposicionescliente' => 'NavegacionController#ListarPosicionesCliente',
      'posicioneslibresfecha' => 'NavegacionController#PosicionesLibresFecha'/*,
      'clientesvencimientodias' => 'NavegacionController#ClientesVencimientoDias'*/
    ];
  }
?>