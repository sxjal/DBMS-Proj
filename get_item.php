<?php 
require_once("includes/db_conn.php");
if(!empty($_POST["itemid"])) {
  $itemid=$_POST["itemid"];
 
    $sql ="SELECT SID,ITEM_NAME FROM sports_item WHERE (SID=:itemid)";
$query= $conn -> prepare($sql);
$query-> bindParam(':itemid', $itemid, PDO::PARAM_STR);
$query-> execute();
$results = $query -> fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query -> rowCount() > 0)
{
  foreach ($results as $result) {?>
<option value="<?php echo htmlentities($result->SID);?>"><?php echo htmlentities($result->ITEM_NAME);?></option>
<b>Item Name :</b> 
<?php  
echo htmlentities($result->ITEM_NAME);
 echo "<script>$('#submit').prop('disabled',false);</script>";
}
}
 else{?>
  
<option class="others"> Invalid SID</option>
<?php
 echo "<script>$('#submit').prop('disabled',true);</script>";
}
}



?>
