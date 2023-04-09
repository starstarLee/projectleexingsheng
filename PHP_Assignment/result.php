<td><input type="submit" name="back" value="Back" id="back" onclick ="window.location.href = 'studentMain.php'"></td></tr>
<head>
<link rel="stylesheet" href="css.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php
session_start();
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'student') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
include("dbCon2.php"); 

///////function/////////////////////////////
function displayResultTable($query)
{
    echo '<table border="1" id="record"><tr>
		<th>Exam ID</th> <th>Exam Name</th><th>Subject Name</th><th>Result</th><th>Ranking</th><th></th>
		</tr>';
		while($row = mysqli_fetch_array($query))
        {
			echo '<tr>
				<td>'.$row['EXAM_ID'].'</td>
				<td>'.$row['EXAM_NAME'].'</td>
				<td>'.$row['SUBJECT_NAME'].'</td>
                <td>'.$row['EXAM_RESULT'].'</td>
                <td>'.$row['RANKING'].'</td>
				<td><input type="button" onclick="window.location = \'review.php?examID='.$row['EXAM_ID'].'\'" value="View Exam"></td>
				</tr>';
	    }
		echo '</table>';
}
/////////end of all functions///////////
$studentID = $_SESSION['userID'];
echo '<form id="form3"action="'.$_SERVER['PHP_SELF'].'" method="post"><table border="1"><br><tr><td><input type="text" name="searchquery" ></td>
<td><input type="submit" name="search" value="Search Exam ID" id="search"></tr></table></form>';

if(isset($_POST['search']))
{
	$search = mysqli_real_escape_string($link, $_POST['searchquery']);
	$query = mysqli_query($link, "SELECT EXAM_ID, EXAM_NAME, SUBJECT_NAME, EXAM_RESULT, RANKING FROM
	(SELECT studentexam.STUDENT_ID, exam.EXAM_ID, exam.EXAM_NAME, subject.SUBJECT_NAME, studentexam.EXAM_RESULT,
    RANK() OVER (PARTITION BY EXAM_ID ORDER BY EXAM_RESULT DESC) AS RANKING FROM studentexam JOIN exam ON 
    studentexam.EXAM_ID=exam.EXAM_ID JOIN subject ON exam.SUBJECT_ID = subject.SUBJECT_ID) temp
	WHERE EXAM_ID LIKE'%$search%' and STUDENT_ID='$studentID'");
    echo mysqli_error($link);
	if(mysqli_num_rows($query)!=0)
    {
		displayResultTable($query);
	} 
    else 
    {
		echo '<h2>No result</h2>';
	}
}
else
{
	$query = mysqli_query($link, "SELECT EXAM_ID, EXAM_NAME, SUBJECT_NAME, EXAM_RESULT, RANKING FROM
	(SELECT studentexam.STUDENT_ID, exam.EXAM_ID, exam.EXAM_NAME, subject.SUBJECT_NAME, studentexam.EXAM_RESULT,
    RANK() OVER (PARTITION BY EXAM_ID ORDER BY EXAM_RESULT DESC) AS RANKING FROM studentexam JOIN exam ON 
    studentexam.EXAM_ID=exam.EXAM_ID JOIN subject ON exam.SUBJECT_ID = subject.SUBJECT_ID) temp
	WHERE STUDENT_ID='$studentID'");
	displayResultTable($query);
}


?>
