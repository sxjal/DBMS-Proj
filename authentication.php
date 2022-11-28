<?php      
    include('connect.php');

    $username = $_POST["user"];  
    $password = $_POST["pass"];  
      
        //to prevent from mysqli injection  
        $username = stripcslashes($username);  
        $password = stripcslashes($password);  
        $username = mysqli_real_escape_string($conn, $username);  
        $password = mysqli_real_escape_string($conn, $password);  
      
        $sql = "select * from users where username = '$username'";  
        $result = mysqli_query($conn, $sql);  
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
        //$count = mysqli_num_rows($result);  
         //echo $row['username'];
         echo "<br>";
         echo "My pass : ".$password."<br>";
         // echo "Sql pass : ".$row['password'];

        if(!$row){
            echo "<h1><center>Login failed. No user exists with this username.</center></h1>";  
        }  
        else{  
            if($password == $row['password']){  
                echo "Login success!!! Welcome ".$row['username'];  
            }  
            else{
                echo "Invalid Password";
            }
              
        }
             
?>  