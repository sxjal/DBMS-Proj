<?php
session_start();
error_reporting(0);
include('includes/db_conn.php');
if(strlen($_SESSION['alogin'])==0)
    {   
header('location:index.php');
}
else{ 

if(isset($_POST['add']))
{
$itemname=$_POST['itemname'];
$category=$_POST['category'];
$distributor=$_POST['distributor'];
$itemid=$_POST['itemid'];
$brand=$_POST['brand'];
$colour=$_POST['colour'];
$quantity=$_POST['quantity'];
//$Purchasedate=$_POST['Purchasedate'];



$sql="INSERT INTO sports_items ( 'SID','SPORT_CODE','ITEM_NAME',BRAND,COLOUR,PURCHASE_DATE,DIST_ID,QUANTITY) VALUES(:itemid,:category,:itemname,:brand,:colour,:Purchasedate,:distributor,quantity)";
$query = $conn->prepare($sql);
$query->bindParam(':itemname',$itemname,PDO::PARAM_STR);
$query->bindParam(':category',$category,PDO::PARAM_STR);
$query->bindParam(':distributor',$distributor,PDO::PARAM_STR);
$query->bindParam(':itemid',$itemid,PDO::PARAM_STR);
$query->bindParam(':brand',$brand,PDO::PARAM_STR);
$query->bindParam(':colour',$colour,PDO::PARAM_STR);
$query->bindParam(':quantity',$quantity,PDO::PARAM_STR);
//$query->bindParam(':Purchasedate',$isbn,PDO::PARAM_STR);


$query->execute();
$lastInsertId = $conn->lastInsertId();
if($lastInsertId)
{
$_SESSION['msg']="item Listed successfully";
header('location:manage-items.php');
}
else 
{
$_SESSION['error']="Something went wrong. Please try again";
header('location:manage-items.php');
}

}
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="distributor" content="" />
    <title>Online Sports Inventory Management System | Add Item</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
    <!-- GOOGLE FONT -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

</head>
<body>
      <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
    <div class="content-wrapper">
    <div class="content-wrapper">
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">Add Item</h4>
                
                            </div>

</div>
<div class="row">
<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3"">
<div class="panel panel-info">
<div class="panel-heading">
Item Info
</div>
<div class="panel-body">
<form role="form" method="post">
<div class="form-group">
<label>Item Name<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="itemname" autocomplete="off"  required />
</div>

<div class="form-group">
<label> Category <span style="color:red;">*</span></label>
<select class="form-control" name="category" required="required">
<option value=""> Select Category </option>
<?php 

$sql = "SELECT * from  sports";
$query = $conn -> prepare($sql);
//$query -> bindParam(':status',$status, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->SCODE);?>"><?php echo htmlentities($result->SNAME);?></option>
 <?php }} ?> 
</select>
</div>


<div class="form-group">
<label> Distributor<span style="color:red;">*</span></label>
<select class="form-control" name="distributor" required="required">
<option value=""> Select Distributor</option>
<?php 

$sql = "SELECT * from  distributor ";
$query = $conn -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{               ?>  
<option value="<?php echo htmlentities($result->DID);?>"><?php echo htmlentities($result->DNAME);?></option>
 <?php }} ?> 
</select>
</div>

<div class="form-group">
<label>Item ID<span style="color:red;">*</span></label>
<input class="form-control" type="text" name="itemid"  required="required" autocomplete="off"  />
<p class="help-block">S-ID helps in keeping track of the items and the same is mentioned on the them. It Must be unique for each category</p>
</div>

 <div class="form-group">
 <label>Brand<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="brand" autocomplete="off"   required="required" />
 </div>
 <div class="form-group">
 <label>Colour<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="colour" autocomplete="off"   required="required" />
 </div>
 <!-- <div class="form-group">
 <label>Purchase Date<span style="color:red;">*</span></label>
 <input class="form-control" type="date" name="Purchasedate" autocomplete="off"    />
 </div> -->
 <div class="form-group">
 <label>Quantity<span style="color:red;">*</span></label>
 <input class="form-control" type="text" name="quantity" autocomplete="off"   required="required" />
 </div>
<button type="submit" name="add" class="btn btn-info">Add </button>

                                    </form>
                            </div>
                        </div>
                            </div>

        </div>
   
    </div>
    </div>
     <!-- CONTENT-WRAPPER SECTION END-->
  <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
<?php } ?>
