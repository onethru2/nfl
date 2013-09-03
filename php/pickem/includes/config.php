<?php
//modify vars below
$db_host = 'pickemsql.greg-ostrowski.com';
$db_user = 'cascaids';
$db_password = 'connect';
$database = 'ostrowski_pickem';
//$db_prefix = 'ostrowski_pickem';

$siteUrl = 'http://greg-ostrowski.com/pickem';
$allow_signup = true;
$show_signup_link = true;
$user_names_display = 3; // 1 = real names, 2 = usernames, 3 = usernames w/ real names on hover

//set timezone offset, hours difference between your server's timezone and eastern
define('SERVER_TIMEZONE_OFFSET', 3); //PST

// ***DO NOT EDIT ANYTHING BELOW THIS LINE***
$dbConnected = false;
error_reporting(0);
if (mysql_connect($db_host, $db_user, $db_password)) {
	if (mysql_select_db($database)) {
		$dbConnected = true;
	}
}
error_reporting(E_ALL ^ E_NOTICE);
