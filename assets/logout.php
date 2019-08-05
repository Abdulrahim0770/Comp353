<?php //Logout by destroying sessions and cookies.
   session_start();
   session_unset();
   session_destroy();
   setcookie("cookieID", "", time() - 3600, "/");
   setcookie("cookieUsername", "", time() - 3600, "/");
   setcookie("cookieLoggedIn", "", time() - 3600, "/");
   header('Location: https://crc353.encs.concordia.ca');
   exit();
?>
