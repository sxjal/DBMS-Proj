<?php
include('includes/db_conn.php');

session_start();
error_reporting(0);
include('includes/db_conn.php');
if($_SESSION['login']!=''){
$_SESSION['login']='';
}


  $sid=$_SESSION['stdid'];
  echo $sid;


?>