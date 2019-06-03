<?php

class NavegacionView extends View {

  function Home(){
    $this->smarty->display('templates/home.tpl');
  }

  function ConsultaCliente(){
    $this->smarty->display('templates/consultacliente.tpl');
  }

  function ConsultaFecha($Message  = ''){
  	$this->smarty->assign('Message',$Message);
    $this->smarty->display('templates/consultafecha.tpl');
  }

  function ConsultaVencimiento(){
    $this->smarty->display('templates/consultavencimiento.tpl');
  } 

    function ListarClientes($Clientes){
	$this->smarty->assign('Clientes',$Clientes);
    $this->smarty->display('templates/listado.tpl');
  }
  	//servicios
	function ListarPosicionesCliente($Clientes){
	$this->smarty->assign('Clientes',$Clientes);
    $this->smarty->display('templates/listado.tpl');
	}
	
	function PosicionesLibresFecha($Posiciones){
	$this->smarty->assign('Posiciones',$Posiciones);
    $this->smarty->display('templates/listadoposicioneslibresfecha.tpl');
	}
	
/*	function ClientesVencimientoDias($Clientes){
	$this->smarty->assign('Clientes',$Clientes);
    $this->smarty->display('templates/listado.tpl');
	}
*/
}
?>
