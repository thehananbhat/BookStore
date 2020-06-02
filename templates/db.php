<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $database_name = "books-portal";

    // Create connection
    $connection = mysqli_connect($servername, $username, $password,$database_name);
    
    // Check connection
    if (!$connection) {
        echo "<script type='text/javascript'> alert(Retry, Connection Error!);
        window.location = 'index.php';
        </script>";
        die("Connection failed: " . mysqli_connect_error());
    }
?>


