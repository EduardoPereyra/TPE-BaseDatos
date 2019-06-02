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

	function ConsultaVencimiento(){
      $this->View->ConsultaVencimiento();
    }

	function ListarClientes(){
	$clientes = $this->Model->GetClientes();
	$this->View->ListarClientes($clientes);
	}
  }

?>
