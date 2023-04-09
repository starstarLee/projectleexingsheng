<?php
session_start();
$_SESSION = array();
session_destroy();
if(isset($_COOKIE['username']))
{
	setcookie('username', "", time()-3600);
}	
if(isset($_COOKIE['password']))
{
	setcookie('password', "", time()-3600);
}
if(isset($_COOKIE['option']))
{
	setcookie('option', "", time()-3600);
	
}
header("Location:login.php");
?>