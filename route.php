<?php

//Incluimos el archivo de configuracion
require_once 'config/Router.php';
require_once 'config/db-config.php';
require_once 'model/Model.php';
require_once 'view/View.php';
require_once 'controller/Controller.php';
require_once 'controller/NavegacionController.php';

$router = new Router();

$router->AddRoute("", "GET", "NavegacionController", "Home");
$router->AddRoute("home", "GET", "NavegacionController", "Home");
$router->AddRoute("register", "GET", "NavegacionController", "Register");

$route = $_GET['action'];
$array = $router->Route($route);
if(sizeof($array) == 0)
    echo (new NavegacionController())->home();
else
{
    $controller = $array[0];
    $metodo = $array[1];
    $url_params = $array[2];
    echo (new $controller())->$metodo($url_params);
}

 ?>