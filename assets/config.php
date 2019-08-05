<?php
	$host = 'crc353.encs.concordia.ca';
	$dbname = 'crc353_1';
	$user = 'crc353_1';
	$pass = 'comp353s';
	try {
		$conn = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
		$conn->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch (PDOException $e) {
		echo $e->getMessage();
	}
?>
