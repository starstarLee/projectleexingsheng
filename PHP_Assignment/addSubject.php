<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<style>
body{
    font-family: 'Poppins', sans-serif;
    background: #ececec;
	background-image: url('https://png.pngtree.com/background/20210711/original/pngtree-creative-teenager-when-self-improvement-reading-reading-poster-background-material-picture-image_1087160.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}

/*------------ Login container ------------*/

.box-area{
    width: 930px;
}

/*------------ Right box ------------*/

.right-box{
    padding: 40px 30px 40px 40px;
}

/*------------ Custom Placeholder ------------*/

::placeholder{
    font-size: 16px;
}

.rounded-4{
    border-radius: 20px;
}
.rounded-5{
    border-radius: 30px;
}


/*------------ For small screens------------*/

@media only screen and (max-width: 768px){

     .box-area{
        margin: 0 10px;

     }
     .left-box{
        height: 100px;
        overflow: hidden;
     }
     .right-box{
        padding: 20px;
     }

}
</style>
<?php
include("dbCon2.php");
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'admin') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
if(isset($_POST["submit"]))
{
	$subjectID = mysqli_real_escape_string($link, $_POST['subjectID']);
	$subjectName = mysqli_real_escape_string($link, $_POST['subjectName']); 
	$insert=mysqli_query($link, "INSERT INTO subject VALUES('$subjectID', '$subjectName');");

	if($insert)
	{	echo '<script> var name = "Subject inserted succefully ";
			alert(name);</script>';
	
	}
	else
	{	
		echo '<script> var name = "Subject insertion fail because '.mysqli_error($link).'";
			alert(name);</script>';
	}
	
}


?>
<div class="container d-flex justify-content-center align-items-center min-vh-100">

<!----------------------- Login Container -------------------------->

   <div class="row border rounded-5 p-3 bg-white shadow box-area">
<div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #103cbe;">
<div class="featured-image mb-3">

</div>
<p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Add Subject</p>

</div> 
 <div class="col-md-6 right-box">
<div class="row align-items-center">
<form action="" method="POST">

	<div class="input-group mb-3">	 <input type="text" name="subjectID" id="any" required placeholder="subject ID" class="form-control form-control-lg bg-light fs-6"> </div>
	<div class="input-group mb-3">	 <input type="text" name="subjectName" id="any" required placeholder="subject Name" class="form-control form-control-lg bg-light fs-6"> </div>
	<div class="input-group mb-3">	<input type="submit" name="submit" id="submit"  value="Submit" class="btn btn-lg btn-primary w-100 fs-6"/><br /> </div>
	<div class="input-group mb-3">	<input type="submit" name="back" value="Back" id="back" onclick ="window.location.href = 'adminMain.php'" class="btn btn-lg btn-success w-100 fs-6"><br /><br> </div> </div> </div>
	
</form>

