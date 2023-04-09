<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<body>
<head> 
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
	$subjectID=mysqli_real_escape_string($link, $_POST['subjectid']);
	$subjectName = mysqli_real_escape_string($link, $_POST['subjectname']); 
	$insert=mysqli_query($link, "UPDATE subject SET SUBJECT_ID='$subjectID', SUBJECT_NAME='$subjectName'
	WHERE SUBJECT_ID = '{$_GET['SUBJECT_ID']}'");
	if($insert)
	{
		echo '<p id=success>Succesfully edit record.</p>';
	}
	else
	{
		echo '<p id=success>Failed to edit record because '.mysqli_error($link).'</p>';
	}	
}

	$query = mysqli_query($link, "SELECT * FROM subject WHERE SUBJECT_ID ='{$_REQUEST['SUBJECT_ID']}' ");
	while($row = mysqli_fetch_array($query)){
	$subjectID = $row['SUBJECT_ID'];
	$subjectName = $row['SUBJECT_NAME'];
	
	}
?>
			<table class="table table-striped ">
				<h1 class="item-align-center">Subject Data</h1>			
<form action='' method='post' id='form4'>

	
		<td colspan = 2 style="font-size:large; font-weight:bold" ><label> Student Data </label></td>
	<tr>
		<td><label>SUBJECT ID</label></td>
		<td><input type="text" name="subjectid" id="any" value="<?php echo $subjectID; ?>" required class="form-control form-control-lg bg-light fs-6"> </td>
	</tr>
	<tr>
		<td><label>SUBJECT NAME</label></td>
		<td><input type="text" name="subjectname" id="any" value="<?php echo $subjectName; ?>" required class="form-control form-control-lg bg-light fs-6"></td>
	</tr>
	
	<tr>
		<td></td>
		<td colspan = 2><input type = 'submit' name='submit' value='Submit' id='submit' class="btn btn-md btn-primary w-100 fs-6"></td>
	</tr>	
	<tr>
	<td></td>
		<td colspan = 2> <input type='button' name='back' value='Back' id='back' onclick="window.location='viewSubject.php'" class="btn btn-md btn-success w-100 fs-6" > </td>
	<tr>
</table>
</form>



</body>
</html>