<?php

include_once './DbConnect.php';

function insertDetallVenta(){

	if (isset($_POST['id_producto'])&&isset($_POST['id_venta'])&&isset($_POST['cantidad_venta_detalle'])&&isset($_POST['valor_unitario_venta_detalle'])){
		
		$id_producto = $_POST['id_producto'];
		$id_venta = $_POST['id_venta'];
		$cantidad_venta_detalle = $_POST['cantidad_venta_detalle'];
		$valor_unitario_venta_detalle = $_POST['valor_unitario_venta_detalle'];



		$db = new DbConnect();

		$response=array();

		$query="INSERT INTO tb_venta_detalle (id_producto,id_venta,cantidad_venta_detalle,valor_unitario_venta_detalle)
				VALUES ('$id_producto','$id_venta','$cantidad_venta_detalle','$valor_unitario_venta_detalle');";

		$result =mysql_query($query) or die(mysql_error());

		if($result){

			$response["success"]=1;
			$response["mensaje"]="Venta ingresada";

			echo json_encode($response);
		}else{
			$response["sucess"]=0;
			$response["message"]="Error insert";
			echo json_encode($response);
		}
	}else{
    $response["success"]=0;
    $response["message"]="Requiere de datos";

    // haciendo JSON response
    echo json_encode($response);

	}	
}

insertDetallVenta();
?>