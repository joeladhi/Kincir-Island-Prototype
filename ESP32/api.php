<?php 

$host = "localhost"; /* Host name */
$user = "root"; /* User */
$password = ""; /* Password */
$dbname = "kincir_island"; /* Database name */
 
$con = mysqli_connect($host, $user, $password,$dbname);
// Check connection
if (!$con) {
 die("Connection failed: " . mysqli_connect_error());
}

ini_set('date.timezone', 'Asia/Jakarta');

$now = new DateTime();

$datenow = $now->format("Y-m-d H:i:s");

$timestamp = $_POST['timestamp'];
$anemo = $_POST['kecepatan_angin'];
$vane = $_POST['arah_angin'];

$sql = "INSERT INTO sensor VALUES (' ','$timestamp', '$anemo', '$vane')";

if ($con->query($sql) === TRUE) {
    echo json_encode("Ok");
} else {
    echo "Error: " . $sql . "<br>" . $con->error;
}
	$con->close();
 ?>