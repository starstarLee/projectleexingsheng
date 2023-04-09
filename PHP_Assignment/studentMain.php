<head> 
<title>This is my Portfolio Website</title>
        <!-- CSS only -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	
 </head>
 <style>
body,h1 {font-family: "Raleway", sans-serif,;
	color:black;
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
<?php
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'student') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

if(isset($_SESSION['message'])) //if there is message, display message
{
	echo $_SESSION['message'];
	unset ($_SESSION['message']);
}

?>
<form>

   
<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-xlarge"><a href='logout.php'id="a3">
    Log Out
  </div>
  <div class="w3-display-middle">
    <h1 class="w3-jumbo w3-animate-top " ><a href='selectSubject.php'id="a1">Subject for test</h1>
    <hr class="w3-border-grey" style="margin:auto;width:40%">
    <p class="w3-large w3-center"><a href='result.php'id="a2">Result</p>
  </div>
  
</div>

</div>

       

</form>

