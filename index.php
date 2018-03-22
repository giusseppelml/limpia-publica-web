<?php

require_once "controladores/plantilla.controlador.php";
require_once "controladores/usuarios.controlador.php";
require_once "controladores/pagos.controlador.php";
require_once "controladores/vivienda.controlador.php";
require_once "controladores/detalles.controlador.php";
require_once "controladores/detallesv.controlador.php";
require_once "controladores/comercio.controlador.php";
require_once "controladores/detallesc.controlador.php";

require_once "modelos/usuarios.modelo.php";
require_once "modelos/pagos.modelo.php";
require_once "modelos/vivienda.modelo.php";
require_once "modelos/detalles.modelo.php";
require_once "modelos/detallesv.modelo.php";
require_once "modelos/comercio.modelo.php";
require_once "modelos/detallesc.modelo.php";


$plantilla = new ControladorPlantilla();
$plantilla -> ctrPlantilla();