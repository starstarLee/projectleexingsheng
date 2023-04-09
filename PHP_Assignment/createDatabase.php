<?php
//if you use the sample database submitted with our group, you need to enter admin as user ID and 123 as password to login as admin

function createTable($link, $sql)
{
    if (!mysqli_query($link, $sql))
    {
        die("<p id=success>Error creating table: " . mysqli_error($link) . "<br /></p>");
    }    
}

// Connect to MySQL
$link = mysqli_connect('localhost', 'root', '');
if (!$link) 
{
    die('<p id=success>Could not connect: ' . mysqli_connect_error().'</p>');
}

// Make my_db the current database
$db_selected = mysqli_select_db($link, 'examsystemdatabase');
if (!$db_selected) 
{
  // If we couldn't, then it either doesn't exist, or we can't see it.
    $sql = 'CREATE DATABASE examsystemdatabase;'; 

    if (mysqli_query($link, $sql)) 
    {       
        echo "<p id=success>Database ExamSystemDatabase created successfully<br /></p>";
        $db_selected = mysqli_select_db($link, 'examsystemdatabase');
    } 
    else 
    {
        die("<p id=success>Error creating database: " . mysqli_error($link) . "<br /></p>");
    }

    $sql = 'CREATE TABLE IF NOT EXISTS student(
            STUDENT_ID varchar(100) UNIQUE not null,
            PASSWORD varchar (40) not null,
	    EMAIL_ADDRESS varchar (40) not null,
	    NAME varchar(100) not null,
	    GENDER varchar(10) null,
            PHONE varchar(11) not null,
            PRIMARY KEY (STUDENT_ID));';
    createTable($link, $sql);
            
    $sql =  'CREATE TABLE IF NOT EXISTS teacher(
            TEACHER_ID varchar(100) UNIQUE not null,
            PASSWORD varchar (40) not null,
            EMAIL_ADDRESS varchar (40) not null,
            NAME varchar(100) not null,
            GENDER varchar(10) null,
            PHONE varchar(11) not null,
            DEPARTMENT  varchar(11) not null,
            EDUCATIONAL_LEVEL enum ("Professor","Master","Degree"), 
            PRIMARY KEY (TEACHER_ID));';
    createTable($link, $sql);
            
    $sql =  'CREATE TABLE IF NOT EXISTS admin(
            ADMIN_ID varchar(100) UNIQUE not null,
            PASSWORD varchar (40) not null,
            EMAIL_ADDRESS varchar (40) not null,
            NAME varchar(100) not null,
            GENDER varchar(10) not null,
            PHONE varchar(11) not null,
            PRIMARY KEY (ADMIN_ID));';
    createTable($link, $sql);
        
            
    $sql =  'CREATE TABLE IF NOT EXISTS subject(
            SUBJECT_ID varchar(10) not null ,
            SUBJECT_NAME varchar(100) not null,
            PRIMARY KEY (SUBJECT_ID));';
    createTable($link, $sql);

    $sql = 'CREATE TABLE IF NOT EXISTS exam(
            EXAM_ID int AUTO_INCREMENT UNIQUE not null ,           
            START_TIME datetime not null,
            END_TIME datetime not null,
            SUBJECT_ID varchar(10) not null,
            TOTAL_QUESTIONS int not null,
            MARKS_PER_CORRECT_ANSWER int not null,
            MARKS_PER_WRONG_ANSWER int not null,
            EXAM_NAME varchar(100),
            PRIMARY KEY (EXAM_ID),
            FOREIGN KEY (SUBJECT_ID)REFERENCES subject (SUBJECT_ID) ON UPDATE CASCADE ON DELETE CASCADE);';
    createTable($link, $sql);
    
    $sql = 'CREATE TABLE IF NOT EXISTS studentExam(
            STUDENT_ID varchar(100) not null,
            EXAM_ID int not null,
            EXAM_RESULT DECIMAL(10,2) not null,
            PRIMARY KEY (STUDENT_ID, EXAM_ID),
            FOREIGN KEY (EXAM_ID) REFERENCES exam (EXAM_ID) ON DELETE CASCADE,
            FOREIGN KEY (STUDENT_ID) REFERENCES student (STUDENT_ID) ON DELETE CASCADE ON UPDATE CASCADE);';
    createTable($link, $sql);

    $sql =  'CREATE TABLE IF NOT EXISTS question(
            QUESTION_ID int AUTO_INCREMENT not null UNIQUE,
            EXAM_ID int not null,
            QUESTION_TITLE varchar(100) not null,
            CORRECT_OPTION enum("A","B","C","D") not null, 
            OPTIONA varchar(100) not null,
            OPTIONB varchar(100) not null,
            OPTIONC varchar(100) not null,
            OPTIOND varchar(100) not null,
            PRIMARY KEY (QUESTION_ID),
            FOREIGN KEY (EXAM_ID)REFERENCES exam (EXAM_ID) ON DELETE CASCADE);';
    createTable($link, $sql);
        
    $sql =  'CREATE TABLE IF NOT EXISTS studentAnswer(
            QUESTION_ID int not null,
            SELECTED_OPTION varchar(50) not null, 
            STUDENT_ID varchar(100) not null,
            PRIMARY KEY (STUDENT_ID, QUESTION_ID),
            FOREIGN KEY (STUDENT_ID)REFERENCES student (STUDENT_ID) ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY (QUESTION_ID)REFERENCES question (QUESTION_ID) ON DELETE CASCADE);';
		    
    if (mysqli_query($link, $sql)) 
    {       
        echo "<p id=success>Table created successfully<br /></p>";
    } 
    else 
    {
        die("<p id=success>Error creating table: " . mysqli_error($link) . "<br /></p>");
    }    
}
?>