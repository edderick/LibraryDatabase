<?php
$mysqli = new mysqli("linuxproj","ejfs1g10","KenThomas", "db_ejfs1g10");

if ($mysqli->connect_errno)
{
die( "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);

}

?>
