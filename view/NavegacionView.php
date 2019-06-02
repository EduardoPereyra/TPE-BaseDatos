<?php

class NavegacionView extends View {

  function Home(){
    $this->smarty->display('templates/home.tpl');
  }

  function ConsultaCliente(){
    $this->smarty->display('templates/consultacliente.tpl');
  }

  function ConsultaFecha(){
    $this->smarty->display('templates/consultafecha.tpl');
  }

  function ConsultaVencimiento(){
    $this->smarty->display('templates/consultavencimiento.tpl');
  } 

    function MostrarPrueba($clientes){
    $this->Smarty->assign('Clientes',$clientes);
    $this->Smarty->display('templates/listado.tpl');
  }
}

?>
