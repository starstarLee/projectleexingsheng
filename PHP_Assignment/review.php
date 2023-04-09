<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
<?php
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'student') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

$studentID = $_SESSION['userID'];
$examID = $_GET['examID'];
include("dbCon2.php");

$result = mysqli_query($link, "SELECT QUESTION_TITLE, CORRECT_OPTION, OPTIONA, OPTIONB, OPTIONC, OPTIOND, SELECTED_OPTION 
FROM studentanswer JOIN question ON studentanswer.QUESTION_ID = question.QUESTION_ID 
WHERE question.EXAM_ID = $examID and studentanswer.STUDENT_ID = '$studentID'");
echo '<form method="POST" action="">';
echo "<a href = 'result.php'>Back</a><br /><br />";

$i = 1;
while($row = mysqli_fetch_array($result))
{
	echo "<label>Question $i <br /></label>";
	echo "<label>".$row['QUESTION_TITLE']."<br /><label>";
	echo "<label>A: ". $row['OPTIONA']."<br /></label>";
	echo "<label>B: ". $row['OPTIONB']."<br /></label>";
	echo "<label>C: ". $row['OPTIONC']."<br /></label>";
	echo "<label>D: ". $row['OPTIOND']."<br /></label>";
	echo "<label>Correct Option: ".$row['CORRECT_OPTION']."<br /></label>";
	echo "<label>You have choosen : ".$row['SELECTED_OPTION']."<br /></label>";
	
	if($row['SELECTED_OPTION'] == $row['CORRECT_OPTION'])
	{
		echo "<p id='label3'>Correct </p>";
	}
	else
	{
		echo "<p id='label1'>Wrong </p>";
	}
	echo "<hr />";
	$i++;
}
echo "</form>";
?>