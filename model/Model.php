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
		
 /*     function __construct()
        {
          try
            { //le decimos al model que cuando se instancie le pegue a la base de datos
              $this->db = new PDO('pgsql:host=dbases.exa.unicen.edu.ar;port=6432;'
              .'dbname=G20_Creacion;charset=utf-8'
              , 'unc_249087', '123456789');
            }
              catch (PDOException $e)
              {
                $this->buildDDBBfromFile(DB_NAME,DB_ARCHIVO);
              }
        }

      public function buildDDBBfromFile()
        {
          try
            {
              $this->db = new PDO('mysql:host='.DB_HOST , DB_USER, DB_PASSWORD);
              $this->db->exec('CREATE DATABASE IF NOT EXISTS '.DB_NAME); //Creacion SQL
              $this->db->exec('USE '.DB_NAME); //Sentencia para usar por defecto la BBDD
              $queries = $this->loadSQLSchema(DB_ARCHIVO); //Cargar el archivo de texto
              $i = 0; // Ejecuto todos los queries
              while ($i < count($queries) && strlen($this->db->errorInfo()[2]) == 0)
                {
                  $this->db->exec($queries[$i]);
                  $i++;
                }
            }
              catch (Exception $e)
              {
                echo $e;
              }
        }

      public function loadSQLSchema($dbfile)
        {
          $queries = fopen("database/$dbfile", "r+");
          $sql = "";
          while (!feof($queries)) {
            $linea = fgets($queries);
            $sql .= $linea;
          }
          fclose($queries);
          $queries = explode(";", $sql);
          return $queries;
        }
*/
	function GetClientes(){
      $sentencia = $this->db->prepare("SELECT * FROM gr20_cliente");
      $sentencia->execute();	
      return $sentencia->fetchAll(PDO::FETCH_ASSOC);
    }

    }
 ?>
