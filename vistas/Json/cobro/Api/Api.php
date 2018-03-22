<?php 
 
 //obteniendo la clase dboperation
 require_once '../includes/DbOperation.php';
 
 // función validando todos los parámetros disponibles
// pasaremos los parámetros requeridos a esta función
 function isTheseParametersAvailable($params){
 //suponiendo que todos los parámetros están disponibles
 $available = true; 
 $missingparams = ""; 
 
 foreach($params as $param){
 if(!isset($_POST[$param]) || strlen($_POST[$param])<=0){
 $available = false; 
 $missingparams = $missingparams . ", " . $param; 
 }
 }
 
 //si faltan parámetros 
 if(!$available){
 $response = array(); 
 $response['error'] = true; 
 $response['message'] = 'Parameters ' . substr($missingparams, 1, strlen($missingparams)) . ' missing';
 
 //error de visualización
 echo json_encode($response);
 
 //detener la ejecución adicional
 die();
 }
 }
 
 //una matriz para mostrar la respuesta
 $response = array();
 
 // si se trata de una llamada api
 // que significa que un parámetro get llamado llamada api se establece en la URL
 // y con este parámetro estamos concluyendo que es una llamada api
 if(isset($_GET['apicall'])){
 
 switch($_GET['apicall']){
 
 // la operación CREATE
 // si el valor de la llamada api es 'createContenido'
 // crearemos un registro en la base de datos
 case 'createpago':
 //primero verifique que los parámetros requeridos para esta solicitud estén disponibles o no 
 isTheseParametersAvailable(array('contribuyente', 'comercio', 'importe', 'detalle', 'tipo', 'fecha', 'direccion', 'coordenadas', 'cobrador'));
 
 //crear un nuevo objeto dboperation
 $db = new DbOperation();
 
 //crear un nuevo registro en la base de datos
 $result = $db->createPago(
 $_POST['contribuyente'],
 $_POST['comercio'],
 $_POST['importe'],
 $_POST['detalle'],
 $_POST['tipo'],
 $_POST['fecha'],
 $_POST['direccion'],
 $_POST['coordenadas'],
 $_POST['cobrador']
 );
 
 
 //si el registro se crea añadiendo, éxito a la respuesta
 if($result){
 //registro se crea significa que no hay error
 $response['error'] = false; 
 
 //en mensaje tenemos un mensaje de éxito
 $response['message'] = 'Pago de comercio realizado correctamente!';
 
 //y estamos recibiendo todos los héroes de la base de datos en la respuesta
 //$response['contenido'] = $db->getContenido();
 }else{
 
 //si no se agrega registro que significa que hay un error
 $response['error'] = true; 
 
 //y tenemos el mensaje de error
 $response['message'] = 'Ocurrio un error, intentar nuevamente';
 }
 
 break;

 case 'createpagodomicilio':
 //primero verifique que los parámetros requeridos para esta solicitud estén disponibles o no 
 isTheseParametersAvailable(array('contribuyente', 'importe', 'tipo', 'fecha', 'direccion', 'coordenadas', 'cobrador'));
 
 //crear un nuevo objeto dboperation
 $db = new DbOperation();
 
 //crear un nuevo registro en la base de datos
 $result = $db->createPagoDomicilio(
 $_POST['contribuyente'],
 $_POST['importe'],
 $_POST['tipo'],
 $_POST['fecha'],
 $_POST['direccion'],
 $_POST['coordenadas'],
 $_POST['cobrador']
 );
 
 
 //si el registro se crea añadiendo, éxito a la respuesta
 if($result){
 //registro se crea significa que no hay error
 $response['error'] = false; 
 
 //en mensaje tenemos un mensaje de éxito
 $response['message'] = 'pago de domicilio exitoso';
 
 //y estamos recibiendo todos los héroes de la base de datos en la respuesta
 //$response['contenido'] = $db->getContenido();
 }else{
 
 //si no se agrega registro que significa que hay un error
 $response['error'] = true; 
 
 //y tenemos el mensaje de error
 $response['message'] = 'Ocurrio un error, intentar nuevamente';
 }
 
 break;  
 
 // la operación READ
 // si la llamada es getcontenido
 case 'getcontribuyente':
 $db = new DbOperation();
 $response['error'] = false; 
 $response['message'] = 'Solicitud completada correctamente';
 $response['contenido'] = $db->getContribuyente();
 break; 
 
 
 // la operación UPDATE
 case 'updatecontenido':
 isTheseParametersAvailable(array('id','titulo','descripcion','imagen','fecha','categoria','estado'));
 $db = new DbOperation();
 $result = $db->updateContenido(
 $_POST['id'],
 $_POST['titulo'],
 $_POST['descripcion'],
 $_POST['imagen'],
 $_POST['fecha'],
 $_POST['categoria'],
 $_POST['estado']
 );
 
 if($result){
 $response['error'] = false; 
 $response['message'] = 'Hero updated successfully';
 $response['contenido'] = $db->getContenido();
 }else{
 $response['error'] = true; 
 $response['message'] = 'Some error occurred please try again';
 }
 break; 
 
 //la operación de deletecontenido borrado
 case 'deletecontenido':
 
 //para la operación de borrado estamos obteniendo un parámetro GET de la url que tiene el id del registro que se va a eliminar
 if(isset($_GET['id'])){
 $db = new DbOperation();
 if($db->deleteContenido($_GET['id'])){
 $response['error'] = false; 
 $response['message'] = 'Hero deleted successfully';
 $response['contenido'] = $db->getContenido();
 }else{
 $response['error'] = true; 
 $response['message'] = 'Some error occurred please try again';
 }
 }else{
 $response['error'] = true; 
 $response['message'] = 'Nothing to delete, provide an id please';
 }
 break; 
 }
 
 }else{
 // si no es api que se esta invocando
 // empujar los valores apropiados al array de respuesta
 $response['error'] = true; 
 $response['message'] = 'Invalid API Call';
 }
 
 //mostrando la respuesta en la estructura json
 echo json_encode($response);