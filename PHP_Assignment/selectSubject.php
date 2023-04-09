<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<style>
body,h1,h2 {font-family: "Raleway", sans-serif,;
	color:black;
  size: 5px;
}

p{
	color:black;
}
body, html {height: 100%}
.bgimg {
  background-image: url('https://png.pngtree.com/background/20210711/original/pngtree-creative-teenager-when-self-improvement-reading-reading-poster-background-material-picture-image_1087160.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
</style>
<form>
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top w3-center " >Subject </h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <h2 class="w3-jumbo w3-animate-top w3-center" >Please select your subject </h2>
    <p class="">Please select your subject</p>

  
  





<?php
include("createDatabase.php");
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'student') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
$sub= mysqli_query($link, "SELECT * FROM subject");

while($row=mysqli_fetch_row($sub)){
   echo " <a href=showTest.php?subject_id=$row[0]>$row[1]</a></br><br>";
}

echo '<br /><a href="studentMain.php"> Back</a>';
?>
</div>
</div>
</form>