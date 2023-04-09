<html>
<head>  
<link rel="stylesheet" href="css.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php
include('dbCon2.php'); 
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'teacher') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

if(isset($_POST['delete'])){
	$delete = mysqli_query($link, "DELETE FROM exam WHERE EXAM_ID ='{$_POST['examID']}'");
	
	if($delete){
		echo '<script>alert("Deleted Successfully")</script><br><a href="displayExam.php">Back to Display Page</a>';
		exit();
	} else {
		echo 'Failed to delete exam because '.mysqli_error($link);
	}
}?>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
<input type="hidden" value="<?php echo $_REQUEST['examID']; ?>" name="examID">
<table>
<tr>
	<td><label>Do you want to delete the selected exam?</label></td><br>
</tr>
<tr>
    <td><input type="submit" name="delete" value="Yes" id="yes"><br><br>
	<input type="button" value="Cancel"id="cancel" onclick="window.location ='displayExam.php'"></td>
</tr>
</table>
</form>
</html>