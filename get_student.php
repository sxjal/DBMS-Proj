<?php 
require_once("includes/db_conn.php");
if(!empty($_POST["studentid"])) {
  $studentid= strtoupper($_POST["studentid"]);
 
    $sql ="SELECT Fname, Lname FROM user WHERE UID=:studentid";
$query= $conn -> prepare($sql);
$query-> bindParam(':studentid', $studentid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query -> rowCount() > 0)
{
foreach ($results as $result) {
if($result)
{
?>

<?php  
echo htmlentities($result->Fname." ".$result->Lname);
echo "<script>$('#submit').prop('disabled',false);</script>";
}
}
}
 else{
  
echo "<span style='color:red'> Invaid Student Id. Please Enter Valid Student id .</span>";
echo "<script>$('#submit').prop('disabled',true);</script>";
}
}



?>
