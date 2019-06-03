<?php

  class Model
    {

      protected $db;

	function __construct()
    {
      $this->db = $this->Connect();
    }

    function Connect(){
		try{
			  return new PDO('pgsql:host=dbases.exa.unicen.edu.ar;port=6432;
			  dbname=cursada;user=unc_249087;password=');

		}catch(PDOException $e){
		 print "Error: ".$e->getMessage()."<br/>";
		}
    }

	function GetClientes(){
      $sentencia = $this->db->prepare("SELECT * 
										FROM unc_249087.gr20_cliente;");
      $sentencia->execute();	
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

	function ListarPosicionesCliente($cuit_cuil){
      $sentencia = $this->db->prepare("SELECT * 
										FROM unc_249087.gr20_cliente;");
      $sentencia->execute(array($cuit_cuil));	
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

	function PosicionesLibresFecha($fecha){
	/*pr_gr20_posiciones_libres(fecha character varying)*/
      $sentencia = $this->db->prepare("SELECT * 
										FROM unc_249087.pr_gr20_posiciones_libres(?)");
      $sentencia->execute(array($fecha));	
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

/*	function ClientesVencimientoDias($dias){
	pr_gr20_clientes_vencimiento_dias(dias integer)
      $sentencia = $this->db->prepare("SELECT * 
										FROM unc_249087.gr20_cliente;");
      $sentencia->execute();	
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }
*/
    }
 ?>
