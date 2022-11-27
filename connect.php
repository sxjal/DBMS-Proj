<?php

#declaring variables
$host = "localhost";
$user = "root";
$pass = "root";
$dbname = "database_test";


#connecting to database
$conn = mysqli_connect($host, $user, $pass, $dbname);
#checking connection

#if fail
if(!$conn){
    echo "Connection failed";
    die("Connection failed: " . mysqli_connect_error());
}
#if success
else 

?>
