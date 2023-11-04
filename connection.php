<?php
//Database Connection
define('DB_NAME','afabwtbb_pharmacy');   //your database username
define('DB_USER', 'root');          //your database name
define('DB_PASS', '*126*Mysql#');              //your database password
define('DB_HOST', 'localhost');     //your database host name

$connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);