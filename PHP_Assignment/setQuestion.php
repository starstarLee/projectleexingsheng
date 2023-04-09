<head>
<link rel="stylesheet" href="css.css"> 
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<?php

include("dbCon2.php");
session_start();
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

function insertNewExam($link)
{
    $examName=mysqli_real_escape_string($link, $_POST['examName']);
	$startTime=mysqli_real_escape_string($link, $_POST['startTime']);
    $endTime=mysqli_real_escape_string($link, $_POST['endTime']);
	$subject=mysqli_real_escape_string($link, $_POST['subject']);
    $totalQuestion=mysqli_real_escape_string($link, $_POST['totalQuestion']);
	$marksPerCorrectAnswer=mysqli_real_escape_string($link, $_POST['marksPerCorrectAnswer']);
    $marksPerWrongAnswer=mysqli_real_escape_string($link, $_POST['marksPerWrongAnswer']);

    $sql = "INSERT INTO exam VALUES(0, '$startTime', '$endTime', '$subject','$totalQuestion', 
    '$marksPerCorrectAnswer', '$marksPerWrongAnswer', '$examName')";

    if (mysqli_query($link, $sql)) 
    {       
        echo "<p id=success>Exam information created successfully<br /></p>";
        $examID = mysqli_insert_id($link);
        $examID=mysqli_real_escape_string($link, $examID);

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
                die("<p id=invalid>Error creating question: " . mysqli_error($link) . "<br /></p>");
            }
        }
        echo "<p id=success>Exam questions created successfully</p><br /><hr /><br />";
    }
    else 
    {
        die("<p id=invalid>Error creating exam information: " . mysqli_error($link) . "<br /></p>");
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
        echo "<p id=invalid>End time cannot be same or more than start time </p><br />";
        $validationPassed = false;
    }

    
    if($_POST['totalQuestion'] <= 0)
    {
        echo "<p id=invalid>Number of total question cannot be 0 or negative </p><br />";
        $validationPassed = false;
    }


    //to ensure user has prepare number of questions is not less than what specified in total questions
    if(!isset($_POST['questionTitle']) || (count($_POST['questionTitle']) < $_POST['totalQuestion']))
    {
        echo "<p id=invalid>Please press the change button first to display all questions before submitting the exam </p><br />";
        $validationPassed = false;
    }

    return $validationPassed;
}
/////////////////end of all functions/////////////////////////////////////////
if(isset($_POST['reset']))
{
    $_POST = array(); //reset all post data
}


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
        insertNewExam($link);
    }
    else
    {
        echo "<p id=invalid>Please fixed all the errors above to insert new exam</p> <hr /><br /><br />";
    }
}
else
{
    questionOperation($totalQuestion);
}

?>

<html>
<body>
<head>
<form method="POST" action="">
<br /><input type="button" value="Back" id="back" onclick="window.location ='teacherMain.php'"/><br />
<label>Exam Name:</label> <input type="text" name="examName" id="any" value="<?= htmlspecialchars($_POST['examName'] ?? ''); ?>" required /><br />
<label>Exam Start Time:</label> <input type="datetime-local" id="any" name="startTime" value="<?= htmlspecialchars($_POST['startTime'] ?? ''); ?>" required/><br />
<label>Exam End Time:</label> <input type="datetime-local" id="any" name="endTime" value="<?= htmlspecialchars($_POST['endTime'] ?? ''); ?>" required/><br />
<label>Subject: </label>
    <select name="subject" required>
        <?php
            $subjectList = mysqli_query($link, "SELECT SUBJECT_ID, SUBJECT_NAME FROM subject ORDER BY SUBJECT_NAME");
            while($row = mysqli_fetch_assoc($subjectList))
            {
                echo '<option value="'.$row['SUBJECT_ID'].'"';
                if(isset($_POST['subject']) && ($_POST['subject']== $row['SUBJECT_ID']))
                {
                    echo 'selected';
                }
                echo '>'.$row['SUBJECT_NAME']."</option>";
            }
        ?>
    </select><br /><br>
<label>Total Questions:</label><input type="text" id="any" name="totalQuestion" value="<?= $totalQuestion; ?>" required />
<input type="submit" name="changeTotalQuestion" id="cancel2" value="Set Question" formnovalidate><br>
<label>Marks per correct answer:</label><input type="text" id="any" name="marksPerCorrectAnswer" value="<?= htmlspecialchars($_POST['marksPerCorrectAnswer'] ?? 20); ?>" 
required /><br />
<label>Marks per wrong answer:</label><input type="text" id="any" name="marksPerWrongAnswer" value="<?= htmlspecialchars($_POST['marksPerWrongAnswer'] ?? 0); ?>" 
required /><br /><br />

<hr />
<?php
    for($i = 0; $i < $totalQuestion; $i++)
    {
        echo '<label>Question</label> '.'<label>'.($i+1).'</label>'.'<br />';
        echo '<label>Title:</label> <textarea id="any" name="questionTitle[]" required>'.($_POST['questionTitle'][$i] ?? '').'</textarea><br /><br />';
        echo '<label>A:</label> <input type="text" name="optionA[]" id="any" value="'.($_POST['optionA'][$i] ?? '').'"required/><br />';
        echo '<label>B: </label><input type="text" name="optionB[]" id="any" value="'.($_POST['optionB'][$i] ?? '').'"required/><br />';
        echo '<label>C:</label> <input type="text" name="optionC[]" id="any" value="'.($_POST['optionC'][$i] ?? '').'"required/><br />';
        echo '<label>D:</label> <input type="text" name="optionD[]" id="any" value="'.($_POST['optionD'][$i] ?? '').'"required/><br /><br />';
        echo '<label>Correct option:</label><select name="correctOption[]">';
        $option = 'A';
        for($j = 0; $j < 4; $j++) //to display A,B,C,D
        {
            $option = chr(ord('A') + $j); //to display A,B,C,D           
            echo '<option value="'.$option.'"';
            if(isset($_POST['correctOption'][$i]) && ($_POST['correctOption'][$i]== $option))
            {
                echo 'selected';
            }
            echo '>'.$option."</option>";
        }
        echo '</select><br />';
        echo '<br><button type="submit" id="yes2" name="clearQuestion" value="'.$i.'" formnovalidate>Clear this question</button><br><br>';
        echo '<button type="submit" id="cancel2" name="addQuestion" value="'.$i.'" formnovalidate>Add new question above</button><br><br>';
        echo '<button type="submit" id="submit2" name="removeQuestion" value="'.$i.'" formnovalidate>Remove this question</button><br />';
        echo '<hr /><br />';
    }
?>
<br />
<input type="submit" name="reset" value="Reset Exam" id="yes" formnovalidate/><br><br>
<input type="submit" name="submit" id="submit" value="Submit the Exam" />
</form>
</body>
</head>
</table>
</html>