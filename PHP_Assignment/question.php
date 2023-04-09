<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php
session_start();
include("dbCon2.php");
date_default_timezone_set('Asia/Kuala_Lumpur');

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'student') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}

////////function//////////////////////////
function markAndRecordAnswer($link, $rs, $ans)
{
	mysqli_data_seek($rs,$_SESSION['qn']);
	$row= mysqli_fetch_row($rs);	
	mysqli_query($link,"INSERT INTO studentanswer(QUESTION_ID,SELECTED_OPTION,STUDENT_ID) values 
	('$row[0]', '$ans','".$_SESSION['userID']."')");
	if($ans==$row[3]) //if answer selected by the student is correct option
	{
		$_SESSION['trueAns']=$_SESSION['trueAns']+1;
	}
	$_SESSION['qn']=$_SESSION['qn']+1;
}

function validateExam($link)
{
	$result = mysqli_query($link, "SELECT EXAM_RESULT FROM studentexam WHERE 
	STUDENT_ID='".$_SESSION['userID']."'"." AND EXAM_ID = '".$_GET['examID']."'");
	
	if(mysqli_num_rows($result) > 0)
	{
		echo "<label>You have taken the exam already. You cannot retake the exam.</label>";
		echo '<br /><a href="selectSubject.php"> Back to subject selection</a>';
		exit;
	}
	else
	{
		
		$result = mysqli_query($link, "SELECT START_TIME, END_TIME, MARKS_PER_WRONG_ANSWER, TOTAL_QUESTIONS 
		FROM exam WHERE EXAM_ID = '".$_GET['examID']."'");
		$row = mysqli_fetch_assoc($result);
		if(strtotime($row['START_TIME']) > strtotime("now"))
		{
			echo "The exam not yet started";
			echo '<br /><a href="selectSubject.php"> Back to subject selection</a>';
			exit;
		}
		else if (strtotime($row['END_TIME']) < strtotime("now"))
		{			
			if(isset($_POST['nextQuestion']) || isset($_POST['submit'])) //exam expired during the student is taking exam
			{
				$marksPerWrongAnswer = $row['MARKS_PER_WRONG_ANSWER'];
				echo "<p id=invalid>Exam passed due, you will get the lowest mark of all questions</p>";
				$score = ($row['TOTAL_QUESTIONS'] * $marksPerWrongAnswer); //all questions consider wrong
				echo "<label>Your score is: $score</label>";
				$result = mysqli_query($link, "INSERT INTO studentexam VALUES ('".$_SESSION['userID']."',"."'".$_GET['examID']."',"."'$score')");
				if(!$result)
				{
					echo "<p id=invalid>error insert score because".mysqli_error($link)."</p>";
				}
				echo '<br /><a href="selectSubject.php"> Back to subject selection</a>';
				exit;
			}
			else
			{
				echo "<label>The exam has expired</label>";
				echo '<br /><a href="selectSubject.php"> Back to subject selection</a>';
				exit;
			}
			
		}
		
	}
}

function calcAndStoreResult($link)
{
	$result = mysqli_query($link, "SELECT MARKS_PER_CORRECT_ANSWER, MARKS_PER_WRONG_ANSWER FROM exam WHERE EXAM_ID = '".$_GET['examID']."'");
	$row = mysqli_fetch_assoc($result);
	$marksPerCorrectAnswer = $row['MARKS_PER_CORRECT_ANSWER'];
	$marksPerWrongAnswer = $row['MARKS_PER_WRONG_ANSWER'];
	$score = ($_SESSION['trueAns'] * $marksPerCorrectAnswer) + (($_SESSION['qn']-$_SESSION['trueAns']) * $marksPerWrongAnswer);
	$result = mysqli_query($link, "INSERT INTO studentexam VALUES ('".$_SESSION['userID']."',"."'".$_GET['examID']."',"."'$score')");
	if(!$result)
	{
		echo "<p id=invalid>error insert score because".mysqli_error($link)."</p>";
	}
	return $score;
	 
}

/////////////////End of all functions////////////////////////
validateExam($link);
$rs=mysqli_query($link,"SELECT * FROM question WHERE EXAM_ID ='". $_GET['examID']."'");

if(!isset($_SESSION['qn'])) //if first time come to this page
{
	$_SESSION['qn']=0;
	mysqli_query($link, "DELETE * FROM studentAnswer WHERE EXAM_ID ='". $_GET['examID']."'");
	$_SESSION['trueAns']=0;
	
}
else //if not first time come to this page, already have $_SESSION['qn'] that store the question number
{
	if(isset($_POST['nextQuestion']) && isset($_POST['ans'])) //submit answer which is not final question
	{
		markAndRecordAnswer($link, $rs, $_POST['ans']);
	}
	else if(isset($_POST['submit']) && isset($_POST['ans'])) //submit answer of final question
	{
		markAndRecordAnswer($link, $rs, $_POST['ans']);
		echo '<form method="POST" action="">';
		echo "<h1> Result</h1>";
		echo "<label>Total Question : ".$_SESSION['qn']." </label><br />";
		echo "<label>True Answer : ".$_SESSION['trueAns']." </label><br />";
		$wrongAns=$_SESSION['qn']-$_SESSION['trueAns'];
		echo "<label>Wrong Answer :".$wrongAns."</label> <br />";
		echo "<label>Your score is ".calcAndStoreResult($link)."</label><br />";
		
		unset($_SESSION['qn']);
		unset($_SESSION['trueAns']);
		echo '<input type="button" value="OK" id="submit" onclick="window.location =\'selectSubject.php\'"/></form>';
		exit;
	}
	else if(isset($_POST['nextQuestion']) || isset($_POST['submit']) && !isset($_POST['ans']))
	{
		echo "<p id=invalid>Please choose one answer to proceed to next question</p>";		
	}
}

mysqli_data_seek($rs,$_SESSION['qn']);
$row= mysqli_fetch_row($rs);
echo '<form method="POST" action="">';
echo "<table width=100%> <tr> <td width=30>&nbsp;</td></tr>"; 
echo "<table border=0>";
echo "<tr><td><span><p id='label2'>Question ". ($_SESSION['qn'] + 1).": $row[2]</p></span></td></tr>"; //for example, if question 0, the user see question 1
echo "<tr><td><input type='radio' name='ans' value='A'>$row[4]</td></tr>";
echo "<tr><td> <input type='radio' name='ans' value='B'>$row[5]</td></tr>";
echo "<tr><td><input type='radio' name='ans' value='C'>$row[6]</td></tr>";
echo "<tr><td><input type='radio' name='ans' value='D'>$row[7]</td></tr>";

if($_SESSION['qn']<mysqli_num_rows($rs)-1) //if false, mean the question is last question
{
	echo '<tr><td><input type="submit" id="yes2" name="nextQuestion" value="Next Question"></td></tr></form>';
}
else
{
	echo '<tr><td><input type="submit" name="submit" id="submit" value="Get Result"></td></tr></form>';
}

echo "</table></table>";

?>
</body>
</html>