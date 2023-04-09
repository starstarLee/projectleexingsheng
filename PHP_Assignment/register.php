<head> 

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 </head>
 <style>
 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

body{
    font-family: 'Poppins', sans-serif;
    background: #ececec;
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
if(isset($_POST["submit"]))
{
	$studentID=mysqli_real_escape_string($link, $_POST['studentID']);
	$password = $_POST['password']; //store unhashed password
	$password_hash=mysqli_real_escape_string($link, md5($_POST['password'])); //md5 hashing
	$email=mysqli_real_escape_string($link, $_POST['email']);
	$name = mysqli_real_escape_string($link,$_POST['name']);
	$gender= mysqli_real_escape_string($link, $_POST['gender']);
	$phone=mysqli_real_escape_string($link, $_POST['phone']);

	$insert=mysqli_query($link, "INSERT INTO student VALUES('$studentID', '$password_hash','$email','$name','$gender','$phone');");

	if($insert)
	{	echo '<script> var name = "Register account succesfully ";
			alert(name);</script>';
		
	}
	else
	{	
		echo '<script> var name = "Data insertion fail because '.mysqli_error($link).'";
			alert(name);</script>';
		
	}
 
}


?>
<div class="container d-flex justify-content-center align-items-center min-vh-100">

<!----------------------- Login Container -------------------------->

   <div class="row border rounded-5 p-3 bg-white shadow box-area">
<div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box" style="background: #103cbe;">
<div class="featured-image mb-3">
 <img src="1.png" class="img-fluid" style="width: 250px;">
</div>
<p class="text-white fs-2" style="font-family: 'Courier New', Courier, monospace; font-weight: 600;">Be Verified</p>

</div> 

 <div class="col-md-6 right-box">
<div class="row align-items-center">
<form action="" method="POST">
<div class="input-group mb-3"><h1>Register Form</h1>  </div>
<div class="input-group mb-3">

	 <input type="text" name="studentID" id="studentID" placeholder="StudentID" required  class="form-control form-control-lg bg-light fs-6"/> </div>
	 <div class="input-group mb-3">
	 <input type="password" name="password" id="password" placeholder="Password" required  class="form-control form-control-lg bg-light fs-6"/> </div>
	<div class="input-group mb-3">
	 <input type="text" name="email" id="email"  placeholder="Email" required class="form-control form-control-lg bg-light fs-6" /></div>
	<div class="input-group mb-3">
	 <input type="text" name="name" id="name" placeholder="name" required class="form-control form-control-lg bg-light fs-6" /></div>
	<div class="input-group mb-3">
	 <input type="tel" name="phone" id="phone" placeholder="Phone" required class="form-control form-control-lg bg-light fs-6"></div>
	<div class="input-group mb-3">
	<label  class="form-check-label text-secondary">Gender:</label>
	<div class="form-check form-check-inline"> <input type="radio" name="gender" value="female"  >Female </div>
	<div class="form-check form-check-inline">	<input type="radio" name="gender" value="male"  >Male </div></div>
	<div class="input-group mb-3">	<input type="submit" name="submit" id="submit" class="btn btn-lg btn-primary w-100 fs-6" /></div>
	<div class="row"><a href = 'login.php'>Click here to Login!</a> </div>
</div>
</div>
</form>