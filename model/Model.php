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
			  dbname=cursada;user=unc_249087;password=123456789');

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

    }
 ?>
