<?php
 
class DbOperation
{
    /*----------------------------------------------------------
    ----------------------------------------------------------
    NOTA IMPORTANTE DEL JSON
    este json tiene utf-8 enconde, retirarlo en caso de que
    no necesite hacer conversion de caracteres especiales
    como las tildes y las ñ
    ----------------------------------------------------------
    ----------------------------------------------------------*/

    //Enlace de conexión de base de datos
    private $con;
 
    //Class constructor
    function __construct()
    {
        //Obtener el archivo DbConnect.php
        require_once dirname(__FILE__) . '/DbConnect.php';
 
        //Creating a DbConnect object to connect to the database
        $db = new DbConnect();
 
    
    // Inicializando nuestro enlace de conexión de esta clase
    // llamando al método connect de la clase DbConnect
        $this->con = $db->connect();
    }
 
 /*
 * La operación create
 * Cuando se llama a este método se crea un nuevo registro en la base de datos
 * SIEMPRE TENER EN CUENTA DE RESPETAR EL SISTEMA BINARIO EN bind_param:
 * las "s" representan cadena, y las "i" los numericos
 */
 function createPago($contribuyente, $comercio, $importe, $detalle, $tipo, $fecha, $direccion, $coordenadas, $cobrador){
 $stmt = $this->con->prepare("INSERT INTO cobros (contribuyente, comercio, importe, detalle, tipo, fecha, direccion, coordenadas, cobrador) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
 $stmt->bind_param("ssisssssi", $contribuyente, $comercio, $importe, $detalle, $tipo, $fecha, $direccion, $coordenadas, $cobrador);
 if($stmt->execute())
 return true; 
 return false; 
 }

 function createPagoDomicilio($contribuyente, $importe, $tipo, $fecha, $direccion, $coordenadas, $cobrador){
 $stmt = $this->con->prepare("INSERT INTO cobros (contribuyente, importe, tipo, fecha, direccion, coordenadas, cobrador) VALUES (?, ?, ?, ?, ?, ?, ?)");
 $stmt->bind_param("sissssi", $contribuyente, $importe, $tipo, $fecha, $direccion, $coordenadas, $cobrador);
 if($stmt->execute())
 return true; 
 return false; 
 }
 
 /*
 * La operación de lectura
 * Cuando se llama a este método está devolviendo todo el registro existente de la base de datos
 */
function getContribuyente(){
 $stmt = $this->con->prepare("SELECT id, contribuyente, direccion FROM contribuyente");
 $stmt->execute();
 $stmt->bind_result($id, $contribuyente, $direccion);
 
 $contribuyentes = array(); 
 
 while($stmt->fetch()){
 $cont  = array();
 $cont['id'] = utf8_encode($id); 
 $cont['titulo'] = utf8_encode($contribuyente); 
 $cont['descripcion'] = utf8_encode($direccion);
 
 array_push($contribuyentes, $cont); 
 }
 
 return $contribuyentes; 
 }
 
 /*
 * La operación de actualización
 * Cuando se llama a este método, el registro con el id dado se actualiza con los nuevos valores dados
 */
 function updateContenido($id, $titulo, $descripcion, $imagen, $fecha, $categoria, $estado){
 $stmt = $this->con->prepare("UPDATE contenido SET titulo = ?, descripcion = ?, imagen = ?, fecha = ?, categoria = ?, estado = ? WHERE id = ?");
 $stmt->bind_param("ssssssi", $titulo, $descripcion, $imagen, $fecha, $categoria, $estado, $id);
 if($stmt->execute())
 return true; 
 return false; 
 }
 
 
 /*
 * La operación de borrado
 * Cuando este método se llama registro se elimina para el id dado
 */
 function deleteContenido($id){
 $stmt = $this->con->prepare("DELETE FROM contenido WHERE id = ? ");
 $stmt->bind_param("i", $id);
 if($stmt->execute())
 return true; 
 
 return false; 
 }
}