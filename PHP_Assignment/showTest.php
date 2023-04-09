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
extract($_GET);
$rs1= mysqli_query($link, "SELECT * FROM subject WHERE subject_id='$subject_id'");
$row= mysqli_fetch_array($rs1);
echo '<form method="POST" action="">';
echo "<h1>$row[1]<br></h1>";

$rs= mysqli_query($link, "SELECT * FROM exam WHERE subject_id='$subject_id' and NOW() >= START_TIME and NOW() <= END_TIME ");
if(mysqli_num_rows($rs)===0){
    echo "<label>No test available</br></label>";
}else{
    echo "<label>Select exam name to take exam.</br></label><br>";
    while($row= mysqli_fetch_row(($rs))){
        echo "<a href= question.php?examID=$row[0]>$row[7]</a><br /><br>";
    }
}
echo '<br /><a href="selectSubject.php"> Back</a></form>';
?>