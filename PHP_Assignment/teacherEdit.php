<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

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
<html>
<body>
<head> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js">
  </script>
 <!--<script type="text/javascript">
$(document).ready(function () {
    $('#submit').click(function() {
      checked = $("input[type=checkbox]:checked").length;

      if(!checked) {
        alert("You must check at least one checkbox.");
        return false;
      }

    });
});

</script> --> 

<script type="text/javascript">
$(document).ready(function () {
    $('#submit').click(function() {
      checked = $("input[type=radio]:checked").length;

      if(!checked) {
        alert("You must check at least one radio.");
        return false;
      }

    });
});
</script>

</head>

<?php // table - user 
session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'admin') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
include ("dbCon2.php");



?>

<?php
if(isset($_POST['submit']))
{	
	$teacherID=mysqli_real_escape_string($link, $_POST['teacherid']);
	$password = $_POST['password']; //store unhashed password
	$password_hash=mysqli_real_escape_string($link, md5($_POST['password'])); //md5 hashing
	$email=mysqli_real_escape_string($link, $_POST['email']);
	$name = mysqli_real_escape_string($link,$_POST['name']);
	$gender= mysqli_real_escape_string($link, $_POST['gender']);
	$phone=mysqli_real_escape_string($link, $_POST['phone']);
	$department=mysqli_real_escape_string($link, $_POST['department']);
	$education=mysqli_real_escape_string($link, $_POST['education']);
	$insert=mysqli_query($link, "UPDATE teacher SET TEACHER_ID ='$teacherID', PASSWORD ='$password_hash', 
	EMAIL_ADDRESS='$email', NAME='$name', GENDER='$gender', PHONE ='$phone', DEPARTMENT='$department', 
	EDUCATIONAL_LEVEL='$education' WHERE TEACHER_ID = '{$_GET['TEACHER_ID']}'");

	if($insert)
	{
		echo '<p id=success>Succesfully edit record.</p>';
	}
	else
	{
		echo '<p id=success>Failed to edit record because '.mysqli_error($link).'</p>';
	}	
}

	$query = mysqli_query($link, "SELECT * FROM teacher WHERE TEACHER_ID ='{$_REQUEST['TEACHER_ID']}' ");
	while($row = mysqli_fetch_array($query)){
	$teacherID = $row['TEACHER_ID'];
	$password = $row['PASSWORD'];
	$email = $row['EMAIL_ADDRESS'];
	$name = $row['NAME'];
	$gender = $row['GENDER'];
	$phone = $row['PHONE'];
	$department = $row['DEPARTMENT'];
	$education = $row['EDUCATIONAL_LEVEL'];
	
	}
?>
	<table class="table table-striped ">
				<h1 class="item-align-center">Teacher Data</h1>				
<form action='' method='post' id='form4'>

	
		
	<tr>
		<td><label>TEACHER ID</label></td>
		<td><input type="text" name="teacherid" id="any" value="<?php echo $teacherID; ?>" required class="form-control form-control-lg bg-light fs-6"> </td>
	</tr>
	<tr>
		<td><label>PASSWORD</label></td>
		<td><input type="text" name="password" id="password" value="" required class="form-control form-control-lg bg-light fs-6"></td>
	</tr>
	<tr>
		<td><label>EMAIL_ADDRESS</label></td>
		<td> <input type="text" name="email" id="email" value="<?php echo $email; ?>" required class="form-control form-control-lg bg-light fs-6"/></td>
	</tr>
	<tr>
		<td><label>NAME</label></td>
		<td> <input type="text" name="name" id="name" value= "<?php echo $name;?>" required class="form-control form-control-lg bg-light fs-6"/></td>
	</tr>

	<tr><!--radio button-->
		<td><label>GENDER</label></td>
		<td> 
		<input type="radio" name="gender" id="male" value="male" <?php echo ($gender =='male')?"checked":"" ;?>>
		<label for="male"> Male</label>
		<input type="radio" name="gender" id="female" value="female"<?php echo ($gender =='female')?"checked":"" ;?>> 
		<label for="female"> Female</label>
		</td>
	</tr>
	
	<tr>
		<td><label>PHONE</label></td>
		<td> <input type="tel" name="phone" id="phone" value= "<?php echo $phone;?>" required class="form-control form-control-lg bg-light fs-6"></td>
	</tr>
	
	<tr>
		<td><label>DEPARTMENT</label></td>
		<td>  <input type="text" name="department" id="any" value="<?php echo $department;?>" required class="form-control form-control-lg bg-light fs-6"></td>
	</tr>
	
	
	<tr>
		<td><label>EDUCATIONAL_LEVEL</label></td>
		<td> <select name="education" id="education" required class="form-select">
	<option value="Professor" <?php echo ($education == 'Professor')?'selected="selected"' :'';?>>Professor</option>
	<option value="Master" <?php echo ($education == 'Master')?'selected="selected"' :'';?>>Master</option>
	<option value="Degree" <?php echo ($education == 'Degree')?'selected="selected"' :'';?>>Degree</option>
	</select></td>
	</tr>
	
	<tr>
		<td></td>
		<td colspan = 2><input type = 'submit' name='submit' value='Submit' id='submit' class="btn btn-md btn-primary w-100 fs-6"></td>
	</tr>	
	<tr>
	<td></td>
		<td colspan = 2> <input type='button' name='back' value='Back' id='back' onclick="window.location='viewTeacher.php'" class="btn btn-md btn-success w-100 fs-6"> </td>
	<tr>
</table>
</form>



</body>
</html>