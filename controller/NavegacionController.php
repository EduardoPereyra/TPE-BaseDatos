<?php

require_once "./view/NavegacionView.php";

  class NavegacionController extends Controller{

    private $NavegacionView;

    function __construct()
    {
      $this->NavegacionView = new NavegacionView();
    }

    function ConsultaCliente(){
      $this->NavegacionView->ConsultaCliente();
    }

	function ConsultaFecha(){
      $this->NavegacionView->ConsultaFecha();
    }

	function ConsultaVencimiento(){
      $this->NavegacionView->ConsultaVencimiento();
    }
  }

?>
