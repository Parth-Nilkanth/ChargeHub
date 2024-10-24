<?php
$server="localhost";//host_name
$username="root";//host_username
$password="";//host_password
$dbname="evstation";//database_name
$conn=mysqli_connect($server,$username,$password,$dbname);
if(!$conn)
die("Connection Failed !!".$mysqli->error);
else
echo "Connection Successful !!!";
?>

