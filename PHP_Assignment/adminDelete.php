<head>  
<link rel="stylesheet" href="css.css"> 
</head>
<?php
include('dbCon2.php'); 
session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'admin') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

if(isset($_POST['delete'])){
	$delete = mysqli_query($link, "DELETE FROM admin WHERE ADMIN_ID ='{$_POST['ADMIN_ID']}'");

	if($delete){
		echo '<script>alert("Deleted Successfully")</script><br><a href="viewAdmin.php">Back to Display Page</a>';
		//header("Location: displayStudent.php"); 
		exit();
		
	} else {
		echo 'Failed to delete record because '.mysqli_error($link);
	}
}
?>
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
<input type="hidden" value='<?php echo $_REQUEST['ADMIN_ID']; ?>' name='ADMIN_ID'>
<table>
<tr>
	<td><label>Do you want to delete the selected file?</label></td><br>
</tr>
<tr>
    <td><input type="submit" name="delete" value="Yes" id="yes"><br><br>
	<input type="button" value="Cancel"id="cancel" onclick="window.location ='viewAdmin.php'"></td>
</tr>
</table>
</form>
