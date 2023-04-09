<html>
<body>
<head> 

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
function adminValidation($link, $userID, $password)
{
	$userID=mysqli_real_escape_string($link, $userID);
	$password=mysqli_real_escape_string($link, $password);

	$result1 = mysqli_query($link, "SELECT admin.PASSWORD FROM admin WHERE ADMIN_ID = '$userID';");
	$row1 = mysqli_fetch_assoc($result1);
	if($row1 === null)
	{
		return false;
	}
	else
	{
		return ($row1['PASSWORD'] === $password);
	}
} 	

function teacherValidation($link, $userID, $password)
{
	$userID=mysqli_real_escape_string($link, $userID);
	$password=mysqli_real_escape_string($link, $password);
	
	$result2 = mysqli_query($link, "SELECT teacher.PASSWORD FROM teacher WHERE TEACHER_ID = '$userID';");
	$row2 = mysqli_fetch_assoc($result2);
	if($row2 === null)
	{
		return false;
	}
	else
	{
		return ($row2['PASSWORD'] === $password);
	}
}

function studentValidation($link, $userID, $password)
{
	$result3 = mysqli_query($link, "SELECT student.PASSWORD FROM student WHERE STUDENT_ID = '$userID';");
	$row3 = mysqli_fetch_assoc($result3);
	if($row3 === null)
	{
		return false;
	}
	else
	{
		return ($row3['PASSWORD'] === $password);
	}

}

function cookieSet()
{
	if(isset($_POST['rememberMe']))
		{			
			setcookie('userID', $_POST['userID'], time()+86400);
			setcookie('password', $_POST['password'], time()+86400);
			setcookie('option', $_POST['option'], time()+86400);
		}
}
			
		
include("createDatabase.php");
session_start();

if(!isset($_SESSION['check'])) //in first login, session variable is not set so set ['check'] to false
{
	$_SESSION['check'] = false;
}

if(isset($_SESSION['error'])) //if there is error
{
	echo $_SESSION['error'];
	unset($_SESSION['error']);
}

if(isset($_POST['submit'])) //if user log in through form
{
	
	if ($_POST['option'] == 'admin')
	{		
			$password = md5($_POST['password']); //encrypt the userID entered by the user
			if($_SESSION['check'] = adminValidation($link, $_POST['userID'], $password))
			{
				$_SESSION['userID']=$_POST['userID'];
				$_SESSION['option']= $_POST['option'];
				$_SESSION['message'] = '<script> var name = "Login successful! ";
				alert(name);</script>';
				cookieSet();
		
			}
			else
			{
				$_SESSION['error'] = '<script> var name = "Wrong password!/ID is not existed in Admin Database ";
				alert(name);</script>';		
			}	
		header("Location:".$_SERVER['PHP_SELF']); //perform Post/Redirect/Get
	}
	
	else if ($_POST['option'] == 'teacher')
	{
		$password = md5($_POST['password']); //encrypt the userID entered by the user
		if($_SESSION['check'] = teacherValidation($link, $_POST['userID'], $password))
		{
			$_SESSION['message'] = '<script> var name = "Login successful! ";
			alert(name);</script>';
			$_SESSION['userID']=$_POST['userID'];
			$_SESSION['option']= $_POST['option'];
			cookieSet();
	
		}
		else
		{
			$_SESSION['error'] = '<script> var name = "Wrong password!/ID is not existed in Teacher Database ";
			alert(name);</script>';
			
		}	
			header("Location:".$_SERVER['PHP_SELF']); //perform Post/Redirect/Get
		}
		
		else if  ($_POST['option'] == 'student')
		{
			$password = md5($_POST['password']); //encrypt the userID entered by the user
			if($_SESSION['check'] = studentValidation($link, $_POST['userID'], $password))
			{
				$_SESSION['message'] = '<script> var name = "Login successful! ";
				alert(name);</script>';	
				$_SESSION['userID']=$_POST['userID'];
				$_SESSION['option']= $_POST['option'];
				cookieSet(); 
				
			}
		else
		{
			$_SESSION['error'] = '<script> var name = "Wrong password!/ID is not existed in Student Database ";
			alert(name);</script>';
				
		}	
		header("Location:".$_SERVER['PHP_SELF']); //perform Post/Redirect/Get
	}
			
}

else if(isset($_COOKIE['userID']) && isset($_COOKIE['password']) && isset($_COOKIE['option'])) //if user log in through cookie
{
	$userID= $_COOKIE['userID'];
	$password = md5($_COOKIE['password']);
	$cookie = $_COOKIE['option']; 
	if($cookie == 'admin') 
	{
		if($_SESSION['check'] = adminValidation($link, $userID, $password))
		{
			$_SESSION['userID'] = $_COOKIE['userID'];
			$_SESSION['option'] = $_COOKIE['option'];
			$_SESSION['message'] = '<script> var name = "Hello, '.$_SESSION['userID'].'";
			alert(name);</script>';
		}
	}
	else if($cookie == 'teacher')
	{	
		if($_SESSION['check'] = teacherValidation($link, $userID, $password))
		{
			$_SESSION['userID'] = $_COOKIE['userID'];
			$_SESSION['option'] = $_COOKIE['option']; 
			$_SESSION['message'] = '<script> var name = "Hello, '.$_SESSION['userID'].'";
			alert(name);</script>';
		}
	}
	else if($cookie == 'student')
	{
		if($_SESSION['check'] = studentValidation($link, $userID, $password))
		{
			$_SESSION['userID'] = $_COOKIE['userID'];
			$_SESSION['option'] = $_COOKIE['option']; 
			$_SESSION['message'] = '<script> var name = "Hello, '.$_SESSION['userID'].'";
			alert(name);</script>';
		}
	}
}

if ($_SESSION != null && $_SESSION['check'] && $_SESSION['option'] == 'admin') //session is on, meaning the user log in
{ 
	header("Location: adminMain.php");
}
else if($_SESSION != null && $_SESSION['check'] && $_SESSION['option'] == 'teacher')
{
	header("Location: teacherMain.php");
}
else if($_SESSION != null && $_SESSION['check'] && $_SESSION['option'] == 'student')
{
	header("Location: studentMain.php");
}
else //either session not set or $_SESSION['check'] is false
{
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
	<div class="header-text mb-4">
		<h2>Hello,Again</h2>
		<p>We are happy to have you back.</p>
   </div>
<form action="" method="POST">
<div class="input-group mb-3">
<input type="text" name="userID" id="userID" class="form-control form-control-lg bg-light fs-6"  placeholder="User ID" required /> </div>
<div class="input-group mb-3">  <input type="password" name="password" id="password" required  class="form-control form-control-lg bg-light fs-6" placeholder="password"/>  </div>
<div class=" mb-4">	<label>Select Your Option:</label> </div>
<div class=" mb-4"><select name="option" id="option" class="form-select"  >

<option value='admin'>Admin</option>
<option value='teacher'>Teacher</option>
<option value='student'>Student</option>
</select></div>
<div class="input-group mb-5 d-flex justify-content-between">
	<div class="form-check">
<input type="checkbox" name="rememberMe"  class="form-check-input"/>
<label for="rememberMe" id="remember" class="form-check-label text-secondary" ><small>Remember Me</small> </label></div>
<div class="input-group mb-3">   <input type="submit" name="submit" id="submit" class="btn btn-lg btn-primary w-100 fs-6"></div>
<div class="row"><small> <a href = 'register.php' >Click here to Register!</a></small> </div>

</form>
</div>
</div>
<?php
}
?>

</body>
</html>