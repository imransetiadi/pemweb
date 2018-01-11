<?php
date_default_timezone_set("Asia/Jakarta");
$servername = "localhost";
$username = "id4181147_admin";
$password = "admin";
$dbname = "id4181147_db_tiketpesawat";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

?>