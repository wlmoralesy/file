<?php

include_once './DbConnect.php';

function getCorrelativo(){
$db = new DbConnect();

	$response= array();

   if (isset($_GET["id_local"]) && isset($_GET["id_tipo_documento"])){   
        $id_local = $_GET["id_local"];
        $id_tipo_documento = $_GET["id_tipo_documento"];

	$query="SELECT id_documento_correlativo,serie_documento_correlativo,numeracion_documento_correlativo 
			FROM tb_documento_correlativo
			WHERE id_local=$id_local AND id_tipo_documento=$id_tipo_documento";
/*
	$query="SELECT id_documento_correlativo,serie_documento_correlativo,numeracion_documento_correlativo 
			FROM tb_documento_correlativo
			WHERE id_local=1 AND id_tipo_documento=1";
*/
	$result=mysql_query($query) or die(mysql_error());
	$no_of_row = mysql_num_rows($result);
		if ($no_of_row>0) {
			$result = mysql_fetch_array($result);

			$numeracion = array();
			$numeracion["id_doccorrelativo"]=$result["id_documento_correlativo"];
			$numeracion["serie"]=$result["serie_documento_correlativo"];
			$numeracion["numero"]=$result["numeracion_documento_correlativo"];

			//generar $invID = str_pad($invID, 4, '0', STR_PAD_LEFT);


				$serie=$result["serie_documento_correlativo"];
				$serie=str_pad($serie,3,'0',STR_PAD_LEFT);
				$documento=$result["numeracion_documento_correlativo"];
				$documento=str_pad($documento+1,7,'0',STR_PAD_LEFT);
				$numeroDocumento="$serie-$documento";
			$numeracion["numeroDocumento"]="$numeroDocumento";

	        $response["success"] =1;	            
	            //usar el nodo
	        $response["numeracion"]=$numeracion;	


			echo json_encode($response);
		}else{
	        $response["success"]=0;
	        $response["message"]="No encontrado correlativo";		
		}
		
	}else{
	    $response["success"]=0;
	    $response["message"]="Requiere de datos";

	    // haciendo JSON response
	    echo json_encode($response);

	}	

}

getCorrelativo();

?>