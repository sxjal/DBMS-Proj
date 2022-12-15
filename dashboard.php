<?php
session_start();
error_reporting(0);
//include('includes/config.php');
include('includes/db_conn.php');

if(strlen($_SESSION['alogin'])==0)
//if(0)  
{ 
header('location:index.php');
}
else{?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
    <title>Online Sports Inventory Management System | Admin Dash Board</title>
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
         <div class="container">
        <div class="row pad-botm">
            <div class="col-md-12">
                <h4 class="header-line">ADMIN DASHBOARD</h4>
                
                            </div>

        </div>
             
             <div class="row">

 <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-item fa-5x"></i>
<?php 
$sql ="SELECT sum(QUANTITY) from sports_item ";
$query = $conn -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$listeditems=$results['sum(QUANTITY)'];
?>


                            <h3><?php echo htmlentities($listeditems);?></h3>
                      Products Listed
                        </div>
                    </div>

            
                 <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-info back-widget-set text-center">
                            <i class="fa fa-bars fa-5x"></i>
<?php 
$sql1 ="SELECT SID from issued_to_play";
$query1 = $conn -> prepare($sql1);
$query1->execute();
$results1=$query1->fetchAll(PDO::FETCH_OBJ);
$issueditems=$query1->rowCount();

$sql1 ="SELECT SID from issued_to_use";
$query1 = $conn -> prepare($sql1);
$query1->execute();
$results1=$query1->fetchAll(PDO::FETCH_OBJ);
$issueditems += $query1->rowCount();

?>

                            <h3><?php echo htmlentities($issueditems);?> </h3>
                           Times item Issued
                        </div>
                    </div>
             
               <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-warning back-widget-set text-center">
                            <i class="fa fa-recycle fa-5x"></i>
<?php 

$status=1;
$sql2 ="SELECT SID from issued_to_use where RETURN_DATE IS NULL";
$query2 = $conn -> prepare($sql2);
//$query2->bindParam(':status',$status,PDO::PARAM_STR);
$query2->execute();
$results2=$query2->fetchAll(PDO::FETCH_OBJ);
$returneditems1=$query2->rowCount();


$sqlx ="SELECT SID from issued_to_play where RETURN_TIME = '00:00:00'";
$queryx = $conn -> prepare($sqlx);
//$query2->bindParam(':status',$status,PDO::PARAM_STR);
$queryx->execute();
$resultsx=$queryx->fetchAll(PDO::FETCH_OBJ);
$returneditems2=$queryx->rowCount();

$returneditems = $returneditems2 + $returneditems1;


?>

                            <h3><?php echo htmlentities($returneditems);?></h3>
                          Times Items Returned
                        </div>
                    </div>
               <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-danger back-widget-set text-center">
                            <i class="fa fa-users fa-5x"></i>
                            <?php 
$sql3 ="SELECT UID from user";
$query3 = $conn -> prepare($sql3);
$query3->execute();
$results3=$query3->fetchAll(PDO::FETCH_OBJ);
$regstds=$query3->rowCount();
?>
                            <h3><?php echo htmlentities($regstds);?></h3>
                           Registered Users
                        </div>
                    </div>

        </div>



 <div class="row">

 <div class="col-md-3 col-sm-3 col-xs-6">
                      <div class="alert alert-success back-widget-set text-center">
                            <i class="fa fa-user fa-5x"></i>
<?php 
$sql4 ="SELECT DID from distributor";
$query4 = $conn -> prepare($sql4);
$query4->execute();
$results4=$query4->fetchAll(PDO::FETCH_OBJ);
$listed_dist=$query4->rowCount();
?>


                            <h3><?php echo htmlentities($listed_dist);?></h3>
                      Distributors Listed
                        </div>
                    </div>

            
                 <div class="col-md-3 col-sm-3 rscol-xs-6">
                      <div class="alert alert-info back-widget-set text-center">
                            <i class="fa fa-file-archive-o fa-5x"></i>
<?php 
$sql5 ="SELECT SCODE from sports";
$query5 = $conn -> prepare($sql5);
$query5->execute();
$results5=$query5->fetchAll(PDO::FETCH_OBJ);
$listdcats=$query5->rowCount();
?>

                            <h3><?php echo htmlentities($listdcats);?> </h3>
                           Listed Categories
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
