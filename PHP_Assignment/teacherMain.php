<html>
<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<body>

<?php

session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'teacher') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

if(isset($_SESSION['message'])) //if there is message, display message
{
	echo $_SESSION['message'];
	unset ($_SESSION['message']);
}

?>
<form method="POST" action="" >
			<input type="button" name="logout" value="Log Out" id="back" onclick="window.location ='logout.php'"  />		
			<br><br>		
				<h1>Homepage</h1><br>

					<a href= "setQuestion.php">Add Exam</a><br><br>
					<a href= "displayExam.php">Display Exams</a><br /><br>
					<a href= "teacherViewExamMarks.php"> View Exam and Marks of Students</a><br /><br>
		
	</form>

</html>
</body>