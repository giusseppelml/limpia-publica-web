<?php
if($_SERVER['REQUEST_METHOD']=='POST'){

$contribuyente = $_POST['contribuyente'];
$comercio = $_POST['comercio'];
$importe = $_POST['importe'];
$detalle = $_POST['detalle'];
$imagen= $_POST['imagen'];
$tipo = $_POST['tipo'];
$fecha = $_POST['fecha'];
$direccion = $_POST['direccion'];
$coordenadas = $_POST['coordenadas'];
$cobrador = $_POST['cobrador'];

require_once('dbConnect.php');
$sql ="SELECT id FROM cobros ORDER BY id ASC";
$res = mysqli_query($con,$sql);
$id = 0;
while($row = mysqli_fetch_array($res)){
$id = $row['id'];
$lml = $id + 1;
}
$path = "uploads/$lml.png";
$actualpath = "http://192.168.0.4/pagos/vistas/Json/detalle/$path";
$sql = "INSERT INTO cobros (contribuyente, comercio, importe, detalle, imagen, tipo, fecha, direccion, coordenadas, cobrador)
VALUES ('$contribuyente', '$comercio', '$importe', '$detalle', '$actualpath',
'$tipo', '$fecha', '$direccion', '$coordenadas', '$cobrador')";
if(mysqli_query($con,$sql)){
file_put_contents($path,base64_decode($imagen));
echo "Cobro registrado e imagen subida Correctamente";
}
mysqli_close($con);
}else{
echo "Error";
}