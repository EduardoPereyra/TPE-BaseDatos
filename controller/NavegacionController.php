<?php

require_once "./view/NavegacionView.php";
require_once "./model/Model.php";

  class NavegacionController extends Controller{
    function __construct()
    {
      $this->View = new NavegacionView();
	  $this->Model = new Model();
    }

    function ConsultaCliente(){
      $this->View->ConsultaCliente();
    }

	function ConsultaFecha(){
      $this->View->ConsultaFecha();
    }

	function ListarClientes(){
	$clientes = $this->Model->GetClientes();
	$this->View->ListarClientes($clientes);
	}

	//servicios
	function ListarPosicionesCliente(){
	$cuit_cuil = $_POST["cuit_cliente"];
	$clientes = $this->Model->ListarPosicionesCliente($cuit_cuil);
	$this->View->ListarPosicionesCliente($clientes);
	}
	
	function PosicionesLibresFecha(){

		if(($_GET["dia"] > 31)||($_GET["dia"] < 1)||($_GET["mes"] > 12)||($_GET["mes"] < 1)||
		($_GET["anio"] < 1500)||($_GET["dia"] == null)||($_GET["mes"] == null)||($_GET["anio"] == null)){
			$this->View->ConsultaFecha("Fecha Incorrecta.");
		}else{
			$dia = $_GET["dia"];
			$mes = $_GET["mes"];
			$anio = $_GET["anio"];
			$fecha = $dia . "/" . $mes. "/" . $anio; 
			$posiciones = $this->Model->PosicionesLibresFecha($fecha);	
			$this->View->PosicionesLibresFecha($posiciones);
		}
	}
  }

?>
