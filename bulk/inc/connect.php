<?php 
	$connection = mysqli_connect('localhost','root','','petroleum_bulk_depot');

	if (mysqli_connect_errno()) {
		die('Database connection failed' . mysqli_connect_errno());
	}else{
		// echo "connection successful";
	}
?>