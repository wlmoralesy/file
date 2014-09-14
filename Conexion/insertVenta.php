<?php
include_once './DBConnect.php';

function insertVenta(){

if (isset($_POST['id_tipo_documento'])&&isset($_POST['codigo_venta'])&&isset($_POST['total_venta']) && isset($_POST['subtotal_venta']) && isset($_POST['igv_total_venta'])
	 && isset($_POST['fecha_venta']) && isset($_POST['id_cliente']) && isset($_POST['id_usuario']) && isset($_POST['id_local'])) {

	$id_tipo_documento = $_POST['id_tipo_documento'];
	$codigo_venta = $_POST['codigo_venta'];
	$total_venta = $_POST['total_venta'];
	$subtotal_venta = $_POST['subtotal_venta'];
	$igv_total_venta = $_POST['igv_total_venta'];
	$fecha_venta = $_POST['fecha_venta'];
	$id_cliente = $_POST['id_cliente'];
	$id_usuario = $_POST['id_usuario']; 
	$id_local = $_POST['id_local'];

	$db = new DbConnect();

	$response=array();
	/*

	*/
	$query="INSERT INTO tb_venta (id_tipo_documento,codigo_venta,
		total_venta,subtotal_venta,igv_total_venta,fecha_venta,id_cliente,
		id_usuario,id_local) values
			('$id_tipo_documento','$codigo_venta','$total_venta','$subtotal_venta','$igv_total_venta','$fecha_venta','$id_cliente','$id_usuario','$id_local');";

	$result =mysql_query($query) or die(mysql_error());

	if($result){

		$query1="SELECT id_venta from tb_venta order by id_venta desc limit 1 ;";
		$result1 =mysql_query($query1) or die(mysql_error());
		$result1 = mysql_fetch_array($result1);

		$response["success"]=1;
		$response["mensaje"]="Venta ingresada";
		$response["id_venta"]=$result1["id_venta"];

		echo json_encode($response);
	}else{
		$response["sucess"]=0;
		$response["message"]="Error";
		echo json_encode($response);
	}
}else{
    $response["success"]=0;
    $response["message"]="Requiere de datos";

    // haciendo JSON response
    echo json_encode($response);

}	
}
insertVenta();
?>