<?php
 if(isset($_POST['tag']) && $_POST['tag']!=''){
 	// tag
 	$tag = $_POST['tag'];

 	// include db
 	require_once 'DB_FunctionsU.php';
 	$db = new DB_FunctionsU();

 	//response Array
 	$response= array("tag" =>$tag ,"success" =>0, "error"=>0 );

 	//check for tag type
 	if ($tag=='login'){
 		//Request type is check Login
 		$user = $_POST['user'];
 		$password=$_POST['password'];
 		//check for user
 		$user=$db->getUserByUsuarioAndPassword($user, $password);
 		if ($user != false) {
 			// user found
 			// echo json w/ success =1
 			$response["success"] =1;
 			$response["uid"] = $user["id_usuario"];
 			$response["user"]["usu"] = $user["usu_usuario"];
 			$response["user"]["nombre"] = $user["nombre_usuario"];
 			$response["user"]["ape1"] = $user["ape1_usuario"];
 			$response["user"]["ape2"] = $user["ape2_usuario"];
 			$response["user"]["id_local"] = $user["id_local"];
 			$response["user"]["id_usuario_tipo"] = $user["id_usuario_tipo"];
 			echo json_encode($response);
 		}else{
 			// user not found
 			// echo json w/ error = 1
 			$response["error"] = 1;
 			$response["error_msg"] = "Incorrecto usuario o password!";
 			echo json_encode($response);
 		}

	 }else {
	        echo "Invalid Request";
	    }
} else {
    echo "Access Denied";
}
?>