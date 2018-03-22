<?php



$ventas = ControladorVentas::ctrSumaTotalVentas();
$vivienda= ControladorVivienda::ctrSumaTotalVivienda();
$comercio = ControladorComercio::ctrSumaTotalComercio();


?>



<div class="col-lg-3 col-xs-6">

  <div class="small-box bg-aqua">
    
    <div class="inner">
      
      <h3>$<?php echo number_format($ventas["total"],2); ?></h3>

      <p>Total de ingresos</p>
    
    </div>
    
    <div class="icon">
      
      <i class="ion ion-social-usd"></i>
    
    </div>
    
    <a href="vivienda" class="small-box-footer">
      
      Más info <i class="fa fa-arrow-circle-right"></i>
    
    </a>

  </div>

</div>


<div class="col-lg-3 col-xs-6">

  <div class="small-box bg-blue">
    
    <div class="inner">
      
      <h3>$<?php echo number_format($vivienda["total"],2); ?></h3>

      <p>Total de ingresos por vivienda</p>
    
    </div>
    
    <div class="icon">
      
      <i class="ion ion-social-usd"></i>
    
    </div>
    
    <a href="pagos" class="small-box-footer">
      
      Más info <i class="fa fa-arrow-circle-right"></i>
    
    </a>

  </div>

</div>

<div class="col-lg-3 col-xs-6">

  <div class="small-box bg-navy">
    
    <div class="inner">
      
      <h3>$<?php echo number_format($comercio["total"],2); ?></h3>

      <p>Total de ingresos por comercio</p>
    
    </div>
    
    <div class="icon">
      
      <i class="ion ion-social-usd"></i>
    
    </div>
    
    <a href="comercio" class="small-box-footer">
      
      Más info <i class="fa fa-arrow-circle-right"></i>
    
    </a>

  </div>

</div>



