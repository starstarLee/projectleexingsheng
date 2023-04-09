<head> 
<link rel="stylesheet" href="css.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
 </head>
<?php
session_start();
include("dbCon2.php");
date_default_timezone_set('Asia/Kuala_Lumpur');
if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'teacher') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}


////function///////////////////////////////////////////
function questionOperation(&$totalQuestion)
{
    if(isset($_POST['clearQuestion']))
    {
        $questionNo = $_POST['clearQuestion'];
        $_POST['questionTitle'][$questionNo] = '';
        $_POST['optionA'][$questionNo] = '';
        $_POST['optionB'][$questionNo] = '';
        $_POST['optionC'][$questionNo] = '';
        $_POST['optionD'][$questionNo] = '';
        $_POST['correctOption'][$questionNo] = '';
    }
    else if(isset($_POST['addQuestion']))
    {
        $totalQuestion++;
        $questionNo = $_POST['addQuestion'];
        array_splice($_POST['questionTitle'], $questionNo, 0, '');
        array_splice($_POST['optionA'], $questionNo, 0, '');
        array_splice($_POST['optionB'], $questionNo, 0, '');
        array_splice($_POST['optionC'], $questionNo, 0, '');
        array_splice($_POST['optionD'], $questionNo, 0, '');
        array_splice($_POST['correctOption'], $questionNo, 0, 'A');
    }
    else if(isset($_POST['removeQuestion']))
    {
        $totalQuestion--;
        $questionNo = $_POST['removeQuestion'];
        array_splice($_POST['questionTitle'], $questionNo, 1);
        array_splice($_POST['optionA'], $questionNo, 1);
        array_splice($_POST['optionB'], $questionNo, 1);
        array_splice($_POST['optionC'], $questionNo, 1);
        array_splice($_POST['optionD'], $questionNo, 1);
        array_splice($_POST['correctOption'], $questionNo, 1);
    }
}

function updateExam($link, $examID)
{
    $examID=mysqli_real_escape_string($link, $examID);
    $examName=mysqli_real_escape_string($link, $_POST['examName']);
	$startTime=mysqli_real_escape_string($link, $_POST['startTime']);
    $endTime=mysqli_real_escape_string($link, $_POST['endTime']);
	$subject=mysqli_real_escape_string($link, $_POST['subject']);

    $sql = "UPDATE exam SET START_TIME = '$startTime', END_TIME = '$endTime', SUBJECT_ID = '$subject',
    EXAM_NAME = '$examName'WHERE EXAM_ID = '$examID'";
    if (mysqli_query($link, $sql))
    {
        echo "<p id=success>Exam information updated successfully <br /></p>";   
    }
    else
    {
        echo "<p id=invalid>Fail to update exam information because ".mysqli_error($link)."</p>";
    }
}

function updateExamAndQuestions($link, $examID)
{
    $examID=mysqli_real_escape_string($link, $examID);
    $examName=mysqli_real_escape_string($link, $_POST['examName']);
	$startTime=mysqli_real_escape_string($link, $_POST['startTime']);
    $endTime=mysqli_real_escape_string($link, $_POST['endTime']);
	$subject=mysqli_real_escape_string($link, $_POST['subject']);
    $totalQuestion=mysqli_real_escape_string($link, $_POST['totalQuestion']);
	$marksPerCorrectAnswer=mysqli_real_escape_string($link, $_POST['marksPerCorrectAnswer']);
    $marksPerWrongAnswer=mysqli_real_escape_string($link, $_POST['marksPerWrongAnswer']);

    $sql = "UPDATE exam SET START_TIME = '$startTime', END_TIME = '$endTime', SUBJECT_ID = '$subject', TOTAL_QUESTIONS = '$totalQuestion',
    MARKS_PER_CORRECT_ANSWER = '$marksPerCorrectAnswer', MARKS_PER_WRONG_ANSWER = '$marksPerWrongAnswer', EXAM_NAME = '$examName'
    WHERE EXAM_ID = '$examID'";
    if (mysqli_query($link, $sql))
    {
        echo "<p id=success>Exam information updated successfully <br /></p>";   
        if(!mysqli_query($link, "DELETE FROM question WHERE EXAM_ID = '$examID'"))
        {
            die("<p id=invalid>Error updating question because ".mysqli_error($link))."</p>";
        }
        for($i = 0; $i < $totalQuestion; $i++)
        {
            $questionTitle=mysqli_real_escape_string($link, $_POST['questionTitle'][$i]);
            $correctOption=mysqli_real_escape_string($link, $_POST['correctOption'][$i]);
            $optionA=mysqli_real_escape_string($link, $_POST['optionA'][$i]);
            $optionB=mysqli_real_escape_string($link, $_POST['optionB'][$i]);
            $optionC=mysqli_real_escape_string($link, $_POST['optionC'][$i]);
            $optionD=mysqli_real_escape_string($link, $_POST['optionD'][$i]);

            $sql = "INSERT INTO question VALUES(0, '$examID', '$questionTitle', '$correctOption','$optionA', 
            '$optionB', '$optionC', '$optionD')";
            if(!mysqli_query($link, $sql))
            {
                die("<p id=invalid>Error updating question: " . mysqli_error($link) . "<br /></p>");
            }         
        }
        echo "<p id=success>Exam questions updated successfully<br /><hr /><br /></p>";      
    }
    else
    {
        echo "<p id=invalid>Fail to update exam information because ".mysqli_error($link)."</p>";
    }
}

function inputValidation()
{
    $validationPassed = true;
    if(strtotime($_POST['startTime']) < strtotime("now"))
    {
        echo "<p id=invalid>Start time must be later than the time now </p><br />";
        $validationPassed = false;
    }

    if(strtotime($_POST['startTime']) >= strtotime($_POST['endTime']))
    {
        echo "<p id=invalid>End time cannot be same or more than start time <br /></p>";
        $validationPassed = false;
    }

    if($_POST['totalQuestion'] <= 0)
    {
        echo "<p id=invalid>Number of total question cannot be 0 or negative <br /></p>";
        $validationPassed = false;
    }

    //to ensure user has prepare number of questions is not less than what specified in total questions
    if(!isset($_POST['questionTitle']) || (count($_POST['questionTitle']) < $_POST['totalQuestion']))
    {
        echo "<p id=invalid>Please press the change button first to display all questions before submitting the exam <br /></p>";
        $validationPassed = false;
    }
    
    return $validationPassed;
}

function inputValidationWithExamGiven() //same as validation above, but since exam is given (cannot change question), not need validate number of question
{
    $validationPassed = true;
    if(strtotime($_POST['startTime']) < strtotime("now"))
    {
        echo "<p id=invalid>Start time must be later than the time now </p><br />";
        $validationPassed = false;
    }

    if(strtotime($_POST['startTime']) >= strtotime($_POST['endTime']))
    {
        echo "<p id=invalid>End time cannot be same or more than start time <br /></p>";
        $validationPassed = false;
    }

    return $validationPassed;
}

function examGiven($link, $examID)
{
    $result = mysqli_query($link, "SELECT * FROM studentexam WHERE EXAM_ID='$examID'");
    if(mysqli_num_rows($result) > 0)
    {
        return true; //exam already conducted by other student
    }
    else
    {
        return false;
    }
}

/////////////////end of all functions/////////////////////////////////////////
$examID = $_REQUEST['examID']; //get data from query string or post
if(isset($_POST['reset']))
{
    $_POST = array(); //reset all post data (however examID has been stored as variables)
}

$examGiven = examGiven($link, $examID);
if(!isset($_POST['totalQuestion'])) //when first come to this page, set total question to 0
{
    $totalQuestion = 0;
}
else
{
    $totalQuestion = htmlspecialchars($_POST['totalQuestion']);
}

if(isset($_POST['submit']))
{
    if(inputValidation())
    {
        updateExamAndQuestions($link, $examID);
    }
    else
    {
        echo "<p id=invalid>Please fixed all the errors above to insert new exam <hr /><br /><br /></p>";
    }
}
else if(isset($_POST['submitWithExamGiven']))
{
    if(inputValidationWithExamGiven())
    {
        updateExam($link, $examID);
    }
    else
    {
        echo "<p id=invalid>Please fixed all the errors above to insert new exam <hr /><br /><br /></p>";
    }
}
else
{
    questionOperation($totalQuestion);
}

if(isset($_POST['examName'])) //the form is post back
{
    $examName = htmlspecialchars($_POST['examName'] ?? '');
    $startTime = htmlspecialchars($_POST['startTime'] ?? '');
    $endTime = htmlspecialchars($_POST['endTime'] ?? '');
    $subject = htmlspecialchars($_POST['subject'] ?? -1); //-1 is not possible to appear in database
    $marksPerCorrectAnswer = htmlspecialchars($_POST['marksPerCorrectAnswer'] ?? 20);
    $marksPerWrongAnswer = htmlspecialchars($_POST['marksPerWrongAnswer'] ?? 0);

    for($i=0; $i < $totalQuestion; $i++)
    {
        $questionTitle[$i] = htmlspecialchars($_POST['questionTitle'][$i] ?? '');
        $optionA[$i] = htmlspecialchars($_POST['optionA'][$i] ?? '');
        $optionB[$i] = htmlspecialchars($_POST['optionB'][$i] ?? '');
        $optionC[$i] = htmlspecialchars($_POST['optionC'][$i] ?? '');
        $optionD[$i] = htmlspecialchars($_POST['optionD'][$i] ?? '');
        $correctOption[$i] = htmlspecialchars($_POST['correctOption'][$i] ?? 'A');
    }
}
else //the form is not post back, mean first time come in
{
    $exam = mysqli_query($link, "SELECT *,DATE_FORMAT(START_TIME, '%Y-%m-%dT%H:%i') AS customSTART_TIME,
    DATE_FORMAT(END_TIME, '%Y-%m-%dT%H:%i') AS customEND_TIME FROM exam WHERE EXAM_ID = '$examID'");
    
    if($exam)
    {
        echo "<p id=success>The exam information retrieved succesfully<br /></p>";
    }
    else
    {
        die("<p id=invalid>Fail to retrieve exam information because ".mysqli_error($link))."</p>";
    }
    
    $row = mysqli_fetch_assoc($exam);
    if($row === null)
    {
        $examName = $startTime = $endTime = "";
        $subject = -1; //subject -1 is not possible so the "selected" keyword will not be apply
        $toalQuestion = 0;
    }
    else
    {      
        $examName = htmlspecialchars($row['EXAM_NAME']);  
        $startTime = htmlspecialchars($row['customSTART_TIME']);
        $endTime = htmlspecialchars($row['customEND_TIME']);
        $subject = htmlspecialchars($row['SUBJECT_ID']);
        $totalQuestion = htmlspecialchars($row['TOTAL_QUESTIONS']);
        $marksPerCorrectAnswer = htmlspecialchars($row['MARKS_PER_CORRECT_ANSWER']);
        $marksPerWrongAnswer = htmlspecialchars($row['MARKS_PER_WRONG_ANSWER']);  
    }

    $questions = mysqli_query($link, "SELECT * FROM question WHERE EXAM_ID = '$examID'");
    
    if($questions)
    {
        echo "<p id=success>The exam questions retrieved succesfully<br /></p>";
    }
    else
    {
        die("<p id=invalid>Fail to retrieve exam questions because ".mysqli_error($link)."</p>");
    }
 
    if($row === null)
    {
        $questionTitle[0] = '';
        $optionA[0] = '';
        $optionB[0] = '';
        $optionC[0] = '';
        $optionD[0] = '';
        $correctOption[0] = '';
    }
    else
    {
        $questionNo = 0;
        while($row = mysqli_fetch_assoc($questions))
        {
            $questionTitle[$questionNo] = htmlspecialchars($row['QUESTION_TITLE']);
            $optionA[$questionNo] = htmlspecialchars($row['OPTIONA']);
            $optionB[$questionNo] = htmlspecialchars($row['OPTIONB']);
            $optionC[$questionNo] = htmlspecialchars($row['OPTIONC']);
            $optionD[$questionNo] = htmlspecialchars($row['OPTIOND']);
            $correctOption[$questionNo] = htmlspecialchars($row['CORRECT_OPTION']);
            $questionNo++;
        }
    }
    
}

?>

<html>
<body>
<head>
<form method="POST" action="">
<br /><input type="button" value="Back" id="back" onclick="window.location ='displayExam.php'"/><br />
<label>Exam ID:</label> <input type="text" name="examID" id="any" value="<?= $examID; ?>" readonly /><br />
<label>Exam Name:</label> <input type="text" name="examName"id="any" value="<?= $examName; ?>" required /><br />
<label>Exam Start Time:</label> <input type="datetime-local"id="any" name="startTime" value="<?= $startTime; ?>" required/><br />
<label>Exam End Time: </label><input type="datetime-local" id="any" name="endTime" value="<?= $endTime; ?>" required/><br />
<label>Subject: </label>
    <select name="subject" required>
        <?php
            $subjectList = mysqli_query($link, "SELECT SUBJECT_ID, SUBJECT_NAME FROM subject ORDER BY SUBJECT_NAME");
            while($row = mysqli_fetch_assoc($subjectList))
            {
                echo '<option value="'.$row['SUBJECT_ID'].'"';
                if($subject == $row['SUBJECT_ID'])
                {
                    echo 'selected';
                }
                echo '>'.$row['SUBJECT_NAME']."</option>";
            }
        ?>
    </select><br />  <br>
<?php      

if(!$examGiven) //if exam not given, allow teacher to change question, if exam already given do not allow teacher to change question
{
    echo "<label>Total Questions:</label><input type='text' id='any' name='totalQuestion' value='$totalQuestion' required />";
    echo '<input type="submit" name="changeTotalQuestion" id="cancel2" value="Set Question" formnovalidate><br />';
    echo "<label>Marks per correct answer:</label><input id='any' type='text' name='marksPerCorrectAnswer' value='$marksPerCorrectAnswer' 
    required /><br />";
    echo "<label>Marks per wrong answer:</label><input type='text' id='any' name='marksPerWrongAnswer' value='$marksPerWrongAnswer'
    required /><br /><br />";
    echo '<hr />';
    for($i = 0; $i < $totalQuestion; $i++)
    {
        echo '<label>Question</label>'.'<label>'.($i+1).'</label>'.'<br />';
        echo '<label>Title:</label> <textarea id="any" name="questionTitle[]" required>'.$questionTitle[$i].'</textarea><br /><br />';
        echo '<label>A:</label> <input type="text" name="optionA[]" id="any" value="'.$optionA[$i].'"required/><br />';
        echo '<label>B:</label> <input type="text" name="optionB[]" id="any" value="'.$optionB[$i].'"required/><br />';
        echo '<label>C:</label> <input type="text" name="optionC[]" id="any" value="'.$optionC[$i].'"required/><br />';
        echo '<label>D: </label><input type="text" name="optionD[]" id="any" value="'.$optionD[$i].'"required/><br /><br />';
        echo '<label>Correct option:</label><select name="correctOption[]">';
        $option = 'A';
        for($j = 0; $j < 4; $j++) //to display A,B,C,D
        {
            $option = chr(ord('A') + $j); //to display A,B,C,D           
            echo '<option value="'.$option.'"';
            if($correctOption[$i]== $option)
            {
                echo 'selected';
            }
            echo '>'.$option."</option>";
        }
        echo '</select><br /><br>';
        echo '<button type="submit"id="yes2" name="clearQuestion" value="'.$i.'" formnovalidate>Clear this question</button><br><br>';
        echo '<button type="submit" id="cancel2"name="addQuestion" value="'.$i.'" formnovalidate>Add new question above</button><br><br>';
        echo '<button type="submit"id="submit2" name="removeQuestion" value="'.$i.'" formnovalidate>Remove this question</button><br />';
        echo '<hr /><br />';
        echo '<input type="submit" name="reset"id="yes" value="Reset Exam" formnovalidate/><br><br>';
        echo '<input type="submit" name="submit" id="submit" value="Update the Exam" />';
    }
}
else
{
    echo "<label>You cannot change total number of questions, marks and questions because exam already given to other students<br /></label><br>";
    $result = mysqli_query($link, "SELECT TOTAL_QUESTIONS, MARKS_PER_CORRECT_ANSWER, MARKS_PER_WRONG_ANSWER FROM exam WHERE EXAM_ID = $examID");
    $row=mysqli_fetch_assoc($result);

    echo "<label>Total number of questions : ".$row['TOTAL_QUESTIONS']."</label><br />";
    echo "<label>Marks per correct answer : ".$row['MARKS_PER_CORRECT_ANSWER']."</label><br />";
    echo "<label>Marks per correct answer : ".$row['MARKS_PER_WRONG_ANSWER']."<br /></label><br>";


    $result = mysqli_query($link, "SELECT * FROM question WHERE EXAM_ID = $examID");
    $queNo = 1;
    while ($row = mysqli_fetch_assoc($result))
    {
        echo "<label>Question $queNo </label><br />";
        echo "<label>".$row['QUESTION_TITLE']."</label><br />";
        echo "<label>A : ". $row['OPTIONA']."</label><br />";
        echo "<label>B : ". $row['OPTIONB']."<br /></label>";
        echo "<label>C : ". $row['OPTIONC']."</label><br />";
        echo "<label>D : ". $row['OPTIOND']."<br /></label>";
        echo "<label>Correct Option : ". $row['CORRECT_OPTION']."<br /></label><br>";
        $queNo++;
    }
    echo '<input type="submit" name="submitWithExamGiven" id="submit" value="Update the Exam" />';
}
?>
<br />

</form>
</body>
</head>
</table>
</html>