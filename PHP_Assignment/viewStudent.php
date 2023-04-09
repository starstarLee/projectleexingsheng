<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia&effect=fire">
</head>
<style>
 @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap');

body{
    font-family: 'Poppins', sans-serif;
    background: #ececec;
	background-image: url('https://png.pngtree.com/background/20210711/original/pngtree-creative-teenager-when-self-improvement-reading-reading-poster-background-material-picture-image_1087160.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}

/*------------ Login container ------------*/

.box-area{
    width: 930px;
}

/*------------ Right box ------------*/

.right-box{
    padding: 40px 30px 40px 40px;
}

/*------------ Custom Placeholder ------------*/

::placeholder{
    font-size: 16px;
}

.rounded-4{
    border-radius: 20px;
}
.rounded-5{
    border-radius: 30px;
}


/*------------ For small screens------------*/

@media only screen and (max-width: 768px){

     .box-area{
        margin: 0 10px;

     }
     .left-box{
        height: 100px;
        overflow: hidden;
     }
     .right-box{
        padding: 20px;
     }

}
</style>
</head>
<td><input type="submit" name="back" value="Back" id="back" onclick ="window.location.href = 'adminMain.php'" class="btn btn-md btn-success w-0 fs-6"></td></tr>
<?php
session_start();

if(!isset($_SESSION) || !$_SESSION['check'] || $_SESSION['option'] != 'admin') //if session not set or ['check'] is false, redirect back to login page
{
  header("Location: login.php");
}
include("dbCon2.php"); 


echo '<form id="form3"action="'.$_SERVER['PHP_SELF'].'" method="post"><table border="1"><br><tr><td>
<input type="text" name="searchquery" class="form-control form-control-lg bg-light fs-6" ></td>
<td><input type="submit" name="search" value="Search Student ID" id="search" class="btn btn-md btn-primary w-100 fs-6"></tr></table></form>';

if(isset($_POST['search'])){
	$search = mysqli_real_escape_string($link, $_POST['searchquery']);
	$query = mysqli_query($link, "SELECT * FROM student WHERE STUDENT_ID LIKE '%$search%'");
	
	if(mysqli_num_rows($query)!=0){
		echo '<table border="1" id="record" class="table table-dark"><tr>
			<th>STUDENT_ID</th> <th>PASSWORD</th> <th>EMAIL_ADDRESS</th> <th>NAME</th> <th>GENDER</th> <th>PHONE</th><th></th><th></th>
		</tr>';
		while($row = mysqli_fetch_array($query)){
			echo '<tr>
				<td>'.$row['STUDENT_ID'].'</td>
				<td>'.$row['PASSWORD'].'</td>
				<td>'.$row['EMAIL_ADDRESS'].'</td>
				<td>'.$row['NAME'].'</td>
				<td>'.$row['GENDER'].'</td>
				<td>'.$row['PHONE'].'</td>
				<td><input type="button" onclick="window.location = \'studentEdit.php?STUDENT_ID='.$row['STUDENT_ID'].'\'" 
				value="Edit" class="btn btn-md btn-success w-100 fs-6"></td>
				<td><input type="button" onclick="window.location = \'studentDelete.php?STUDENT_ID='.$row['STUDENT_ID'].'\'" 
				value="Delete" class="btn btn-md btn-danger w-100 fs-6"></td>
				</tr>';
		}
		echo '</table>';
		exit();
	} else {
		echo '<h2>No result</h2>';
		exit();
	}
}

$query = mysqli_query($link, "SELECT * FROM student");

echo '<table border="1" id="record" class="table table-dark"><tr>
	<th>STUDENT_ID</th> <th>PASSWORD</th> <th>EMAIL_ADDRESS</th> <th>NAME</th> <th>GENDER</th> <th>PHONE</th><th></th><th></th>
	</tr>';
while($row = mysqli_fetch_array($query)){
	echo '<tr>
		
				<td>'.$row['STUDENT_ID'].'</td>
				<td>'.$row['PASSWORD'].'</td>
				<td>'.$row['EMAIL_ADDRESS'].'</td>
				<td>'.$row['NAME'].'</td>
				<td>'.$row['GENDER'].'</td>
				<td>'.$row['PHONE'].'</td>
		<td><input type="button" onclick="window.location = \'studentEdit.php?STUDENT_ID='.$row['STUDENT_ID'].'\'" value="Edit" class="btn btn-md btn-success w-100 fs-6"></td>
		<td><input type="button" onclick="window.location = \'studentDelete.php?STUDENT_ID='.$row['STUDENT_ID'].'\'" value="Delete" class="btn btn-md btn-danger w-100 fs-6">
		</td>
		</tr>';
}
echo '</table>';

?>
