<?php
include_once './DbConnect.php';

function getAllProductosN(){

//

    $response = array();
   if (isset($_GET["id_local"]) && isset($_GET["nom_prod"])){  
    $id_local = $_GET["id_local"];
    $nom_prod = $_GET["nom_prod"];    

        $db = new DbConnect();
        $query="SELECT p.id_producto, p.nombre_producto, td.nombre_corto_distribuidor ,
                p.precio_caja_producto, p.precio_blister_producto, p.precio_unidad_producto,
                ts.cantidad_stock
                FROM tb_producto p 
                inner join tb_stock ts on ts.id_producto=p.id_producto 
                inner join tb_distribuidor td on td.id_distribuidor= p.id_distribuidor
                WHERE id_local =$id_local and nombre_producto LIKE '$nom_prod%'";

        $result =mysql_query($query) or die(mysql_error());
        $no_of_row = mysql_num_rows($result);
        if ($no_of_row>0) {

            $response["productos"]= array();

            while ($row = mysql_fetch_array($result)) {
                # code...

                $producto=array();
                $producto["id_producto"] = $row["id_producto"];
                $producto["id_stock"] = $row["id_producto"];
                $producto["nombre"] = $row["nombre_producto"];
                $producto["laboratorio"] = $row["nombre_corto_distribuidor"];
                $producto["precioC"] = $row["precio_caja_producto"];   
                $producto["precioB"] = $row["precio_blister_producto"];
                $producto["precioU"] = $row["precio_unidad_producto"];
                $producto["cantidad"] = $row["cantidad_stock"];
                $producto["fraccion"] = $row["id_producto"];

                array_push($response["productos"], $producto);
            }

            //success
            $response["success"] =1;
            echo json_encode($response);

        }else{
            $response["success"]=0;
            $response["message"]="Prod. no encontrado";
            echo json_encode($response);
        }

   }else{
    $response["success"]=0;
    $response["message"]="Requiere de datos";

    // haciendo JSON response
    echo json_encode($response);

   }
 
}

getAllProductosN();
?>