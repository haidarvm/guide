<?php
$sql = file_get_contents('mysqldump.sql');

$mysqli = new mysqli("localhost", "root", "pass", "testdb");

/* execute multi query */
$mysqli->multi_query($sql);
