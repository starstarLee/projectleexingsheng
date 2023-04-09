<td><input type="submit" name="back" value="Back" id="back" onclick ="window.location.href = 'teacherMain.php'"></td></tr>
<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'teacher') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

include("dbCon2.php"); 

echo '<form id="form3"action="'.$_SERVER['PHP_SELF'].'" method="post"><table border="1"><br><tr><td><input type="text" name="searchquery" ></td>
<td><input type="submit" name="search" id="search" value="Search Exam Name"></tr></table></form>';

if(isset($_POST['search'])){
	$search = mysqli_real_escape_string($link, $_POST['searchquery']);
	$query = mysqli_query($link, "SELECT * FROM exam WHERE EXAM_NAME LIKE '%$search%'");
	
	if(mysqli_num_rows($query)!=0){
		echo '<table border="1" id="record"><tr>
			<th>Exam ID</th> <th>Exam Name</th> <th>Subject ID</th><th>Start Time</th><th>End Time</th><th>Total Question</th>
			<th>Marks per correct answer</th><th>Marks per wrong answer</th><th></th><th></th>
		</tr>';
		while($row = mysqli_fetch_array($query)){
			echo '<tr>
				<td>'.$row['EXAM_ID'].'</td>
				<td>'.$row['EXAM_NAME'].'</td>
				<td>'.$row['SUBJECT_ID'].'</td>
				<td>'.$row['START_TIME'].'</td>
				<td>'.$row['END_TIME'].'</td>
				<td>'.$row['TOTAL_QUESTIONS'].'</td>
				<td>'.$row['MARKS_PER_CORRECT_ANSWER'].'</td>
				<td>'.$row['MARKS_PER_WRONG_ANSWER'].'</td>
				<td><input type="button" onclick="window.location = \'editQuestion.php?examID='.$row['EXAM_ID'].'\'" value="Edit"></td>
				<td><input type="button" onclick="window.location = \'deleteExam.php?examID='.$row['EXAM_ID'].'\'" value="Delete"></td>
				</tr>';
		}
		echo '</table>';
		exit();
	} else {
		echo '<h2>No result</h2>';
		exit();
	}
}

$query = mysqli_query($link, "SELECT * FROM exam");

echo '<table border="1" id="record"><tr>
	<th>Exam ID</th> <th>Exam Name</th> <th>Subject ID</th><th>Start Time</th><th>End Time</th><th>Total Question</th> 
	<th>Marks per correct answer</th><th>Marks per wrong answer</th><th></th><th></th>
	</tr>';
while($row = mysqli_fetch_array($query)){
	echo '<tr>
		<td>'.$row['EXAM_ID'].'</td>
		<td>'.$row['EXAM_NAME'].'</td>
		<td>'.$row['SUBJECT_ID'].'</td>
		<td>'.$row['START_TIME'].'</td>
		<td>'.$row['END_TIME'].'</td>
		<td>'.$row['TOTAL_QUESTIONS'].'</td>
		<td>'.$row['MARKS_PER_CORRECT_ANSWER'].'</td>
		<td>'.$row['MARKS_PER_WRONG_ANSWER'].'</td>
		<td><input type="button" onclick="window.location = \'editQuestion.php?examID='.$row['EXAM_ID'].'\'" value="Edit"></td>
		<td><input type="button" onclick="window.location = \'deleteExam.php?examID='.$row['EXAM_ID'].'\'" value="Delete"></td>
		</tr>';
}
echo '</table>';

?>