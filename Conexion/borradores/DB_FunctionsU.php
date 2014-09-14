<?php

class DB_FunctionsU{

	private $db;
	//constructor
	function __construct() {
		require_once 'DB_Connect.php';
		// connecting to base
		$this->db=new DB_Connect();
		$this->db->connect();
	}

	// destructor
	function __destruct(){

	}
	/* 
	Get user by usuario and password
	*/

	public function getUserByUsuarioAndPassword($user, $password){
		mysql_query("SELECT * FROM tb_usuario WHERE usu_usuario = '$user' and contrasena_usuario= '$password'") or die(mysql_error());
		// check for result
		$no_of_rows = mysql_num_rows($result);
		if ($no_of_rows>0) {
			$result=mysql_fetch_array($result)
			return $result;
		} else{
			//user  not found
			return false;
		}
	}

}
?>