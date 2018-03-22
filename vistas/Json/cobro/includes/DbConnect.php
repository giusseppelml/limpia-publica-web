<?php 
 
 //Class DbConnect
 class DbConnect
 {
 //Variable para almacenar el enlace de base de datos
 private $con;
 
 //Class constructor
 function __construct()
 {
 
 }
 
 //Este método se conectará a la base de datos
 function connect()
 {
 //Incluyendo el archivo constants.php para obtener las constantes de la base de datos
 include_once dirname(__FILE__) . '/Constants.php';
 
 //conexión a la base de datos mysql
 $this->con = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
 
 //Comprobación de si se ha producido algún error durante la conexión
 if (mysqli_connect_errno()) {
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
 }
 
 //devolviendo finalmente el enlace de conexión
 return $this->con;
 }
 
 }