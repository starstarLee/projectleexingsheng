<head>
<link rel="stylesheet" href="css.css"> 
</head>
<td><input type="submit" name="back" value="Back" id="back" onclick ="window.location.href = 'teacherMain.php'"></td></tr>
<?php
session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'teacher') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
include("dbCon2.php"); 


echo '<form id="form3"action="'.$_SERVER['PHP_SELF'].'" method="post"><table border="1"><br><tr><td>
<input type="text" name="searchquery" ></td>
<td><input type="submit" name="search" value="Search Exam ID" id="search"></tr></table></form>';

if(isset($_POST['search'])){
	$search = mysqli_real_escape_string($link, $_POST['searchquery']);
	$query = mysqli_query($link, "SELECT *, RANK() OVER (PARTITION BY EXAM_ID ORDER BY EXAM_RESULT DESC) as RANKING FROM studentExam WHERE EXAM_ID LIKE '%$search%' ");
	
	if(mysqli_num_rows($query)!=0){
		echo '<table border="1" id="record"><tr>
			<th>EXAM_ID</th> <th>EXAM_RESULT</th> <th>STUDENT_ID</th> <th>RANKING</th> 
		</tr>';
		while($row = mysqli_fetch_array($query)){
			echo '<tr>
				<td>'.$row['EXAM_ID'].'</td>
				<td>'.$row['EXAM_RESULT'].'</td>
				<td>'.$row['STUDENT_ID'].'</td>
				<td>'.$row['RANKING'].'</td>
				</tr>';
		}
		echo '</table>';
		exit();
	} else {
		echo '<h2>No result</h2>';
		exit();
	}
}

$query = mysqli_query($link, "SELECT *, RANK() OVER (PARTITION BY EXAM_ID ORDER BY EXAM_RESULT DESC) as RANKING FROM studentExam");

echo '<table border="1" id="record"><tr>
	<th>EXAM_ID</th> <th>EXAM_RESULT</th> <th>STUDENT_ID</th>  <th>RANKING</th>
	</tr>';
while($row = mysqli_fetch_array($query)){
	echo '<tr>
			<td>'.$row['EXAM_ID'].'</td>
			<td>'.$row['EXAM_RESULT'].'</td>
			<td>'.$row['STUDENT_ID'].'</td>
			<td>'.$row['RANKING'].'</td>
		</td>
		</tr>';
}
echo '</table>';

?>
