<div class="content-wrapper">

  <section class="content-header">
    
    <h1>
      
      Administrar Pagos por Vivienda
    
    </h1>

    <ol class="breadcrumb">
      
      <li><a href="inicio"><i class="fa fa-dashboard"></i> Inicio</a></li>
      
      <li class="active">Administrar pagos</li>
    
    </ol>

  </section>

  <section class="content">

    <div class="box">

      <div class="box-header with-border">
  

         <button type="button" class="btn btn-default pull-right" id="daterangev-btn">
           
            <span>
              <i class="fa fa-calendar"></i> Rango de fecha
            </span>

            <i class="fa fa-caret-down"></i>

         </button>

      </div>

      <div class="box-body">
        
       <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
         
        <thead>
         
         <tr>
           
           <th style="width:10px">#</th>
           <th>Contribuyente</th>
           <th>Comercio</th>
           <th>Importe</th>
           <th>Detalle</th>
           <th>Imagen</th>
           <th>Tipo</th> 
           <th>Fecha</th>
           <th>Dirección</th>
           <th>Coordenadas</th>
           <th>Cobrador</th>
           <th>Acciones</th>

         </tr> 

        </thead>

        <tbody>

        <?php

          if(isset($_GET["fechaInicial"])){

            $fechaInicial = $_GET["fechaInicial"];
            $fechaFinal = $_GET["fechaFinal"];

          }else{

            $fechaInicial = null;
            $fechaFinal = null;

          }

          

          $respuesta = ControladorVivienda::ctrRangoFechasVentas($fechaInicial, $fechaFinal);

          $total=0;
          
          foreach ($respuesta as $key => $value) {
           
           echo '<tr>


                  <td>'.$value["id"].'</td>
                  <td>'.utf8_decode($value["contribuyente"]).'</td>
                  <td>'.$value["comercio"].'</td>
                  <td>'.$value["importe"].'</td>
                  <td>'.$value["detalle"].'</td>';

                  if($value["imagen"] != ""){

                    echo '<td><img src="'.$value["imagen"].'" class="img-thumbnail" width="40px"></td>';

                  }else{

                    echo '<td><img src="vistas/img/usuarios/default/anonymous.png" class="img-thumbnail" width="40px"></td>';

                  }

                  echo '<td>'.$value["tipo"].'</td>
                        <td>'.$value["fecha"].'</td>
                        <td>'.utf8_decode($value["direccion"]).'</td>
                        <td>'.$value["coordenadas"].'</td>';



                  $itemUsuario = "id";
                  $valorUsuario = $value["cobrador"];

                  $respuestaUsuario = ControladorUsuarios::ctrMostrarUsuarios($itemUsuario, $valorUsuario);

                  echo '<td><a href="index.php?ruta=detallesv&variable='.$value["cobrador"].'">'.$respuestaUsuario["nombre"].'</a></td>



                  <td>

                    <div class="btn-group">
                        
                      <button class="btn btn-info btnImprimirFactura" codigoVenta="'.$value["id"].'">

                        <i class="fa fa-print"></i>

                      </button>';

                      if($_SESSION["rol"] == "Administrador"){

                      echo '
                      <button class="btn btn-danger btnEliminarVenta" idVenta="'.$value["id"].'"><i class="fa fa-times"></i></button>';

                    }

                    echo '</div>  

                  </td>

                </tr>';

                 $total = $value["importe"] + $total;


            }

            echo'

        <div class="panel panel-primary">
            <div class="panel-body">
              <b>Total de ingresos: $'.$total.'</b>
            </div>
        </div>

        ' ;


        ?>
               
        </tbody>

       </table>

       <?php

      $eliminarVenta = new ControladorVivienda();
      $eliminarVenta -> ctrEliminarVenta();

      ?>
       

      </div>

    </div>

  </section>

</div>




