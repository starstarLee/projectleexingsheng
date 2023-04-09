<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php 
include("dbCon2.php"); 
session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'admin') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}


if(isset($_SESSION['message'])) //if there is message, display message
{
	echo $_SESSION['message'];
	unset ($_SESSION['message']);
}

if ($_SESSION != null && $_SESSION['check'] && $_SESSION['option'] == 'admin') //session is on, meaning the user log in
{
?>
	<style>
	</style>
	<form method="POST" action="" id="admin_form">
			<input type="button" name="logout" value="Log Out" id="back" onclick="window.location ='logout.php'"  />		
				<h1>Admin Homepage</h1><br>

					<a href= "viewStudent.php">View Registered Student</a><br><br>
					<a href= "viewTeacher.php">View Teacher</a><br><br>
					<a href= "viewAdmin.php">View Admin</a><br><br>
					<a href= "viewSubject.php">View Subject</a><br><br>
					<a href= "adminViewExamMarks.php">View Exam and Marks of Students</a><br><br>
					<a href= "addAdmin.php">Add New Admin</a><br><br>
					<a href= "addTeacher.php">Add New Teacher</a><br><br>
					<a href= "addStudent.php">Add New Student</a><br><br>
					<a href= "addSubject.php">Add New Subject</a>
	</form>
<?php
	}
?>

