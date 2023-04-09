<?php
// Connect to MySQL
$link = mysqli_connect('localhost', 'root', '', 'examsystemdatabase');
if (!$link) 
{
    die('<p id=success>Could not connect: ' . mysqli_connect_error().'</p>');
}