<aside class="main-sidebar">

	 <section class="sidebar">

		<ul class="sidebar-menu">

		<?php

		if($_SESSION["rol"] == "Administrador"){

			echo '<li class="active">

				<a href="inicio">

					<i class="fa fa-home"></i>
					<span>Inicio</span>

				</a>

			</li>

			<li>

				<a href="usuarios">

					<i class="fa fa-user"></i>
					<span>Usuarios</span>

				</a>

			</li>';

		}




		if($_SESSION["rol"] == "Administrador" || $_SESSION["rol"] == "Supervisor" ){

			echo '<li class="treeview">

				<a href="#">

					<i class="fa fa-list-ul"></i>
					
					<span>Pagos</span>
					
					<span class="pull-right-container">
					
						<i class="fa fa-angle-left pull-right"></i>

					</span>

				</a>

				<ul class="treeview-menu">
					
					<li>

						<a href="pagos">
							
							<i class="fa fa-circle-o"></i>
							<span>Total de Pagos</span>

						</a>

					</li>

					<li>

						<a href="vivienda">
							
							<i class="fa fa-circle-o"></i>
							<span>Pagos de viviendas</span>

						</a>

					</li>';

					if($_SESSION["rol"] == "Administrador"){

					echo '<li>

						<a href="comercio">
							
							<i class="fa fa-circle-o"></i>
							<span>Pagos de comercios</span>

						</a>

					</li>';

					}

				

				echo '</ul>

			</li>';

		}

		?>

		</ul>

	 </section>

</aside>