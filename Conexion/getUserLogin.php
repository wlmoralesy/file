<?php
include_once './DbConnect.php';

function getUsuarioLogin(){
//

    $response = array();
   if (isset($_GET["usuario"]) && isset($_GET["contrasena"])){   

    $db = new DbConnect();

        $usuario = $_GET["usuario"];
        $contrasena = $_GET["contrasena"];
             //mysql query
        $query="SELECT * FROM tb_usuario WHERE usu_usuario = $usuario and contrasena_usuario= $usuario";
        $result =mysql_query($query) or die(mysql_error());
        $no_of_row = mysql_num_rows($result);
        
        if ($no_of_row>0) {
            $result = mysql_fetch_array($result);

            $usuariog = array();
            $usuariog["uid"]=$result["id_usuario"];
            $usuariog["uname"]=$result["usu_usuario"];
            $usuariog["utipo"]=$result["id_usuario_tipo"];
            $usuariog["ulocal"]=$result["id_local"];

            //success
            $response["success"] =1;
            //usar el nodo
            $response["usuariog"]=$usuariog;
            // haciendo el JSON response
            echo json_encode($response);
        }else{
            $response["success"]=0;
            $response["message"]="Usuario no encontrado";
            echo json_encode($response);
        }

   }else{
    $response["success"]=0;
    $response["message"]="Requiere de datos";

    // haciendo JSON response
    echo json_encode($response);

   }
   
}

getUsuarioLogin();
?>