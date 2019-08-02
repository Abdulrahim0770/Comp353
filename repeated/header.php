<?php
   if (isset($_COOKIE["cookieID"])) { //Check if cookies exists and set the sessions if it does.
     $_SESSION["sessionID"]               = $_COOKIE["cookieID"];
     $_SESSION["sessionUsername"]         = $_COOKIE["cookieUsername"];
     $_SESSION["sessionLastLoggedIn"]     = $_COOKIE["cookieLoggedIn"];
   }
?>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Quacker - Don't be wack!</title>

   <!-- Font Signika -->
   <link href="https://fonts.googleapis.com/css?family=Signika" rel="stylesheet">

   <!-- Favicon -->
   <link rel="apple-touch-icon" sizes="180x180" href="https://crc353.encs.concordia.ca/resources/images/favicon/apple-touch-icon.png?v=8.0">
   <link rel="icon" type="image/png" sizes="32x32" href="https://crc353.encs.concordia.ca/resources/images/favicon/favicon-32x32.png?v=8.0">
   <link rel="icon" type="image/png" sizes="16x16" href="https://crc353.encs.concordia.ca/resources/images/favicon/favicon-16x16.png?v=8.0">
   <link rel="mask-icon" href="https://crc353.encs.concordia.ca/resources/images/favicon/safari-pinned-tab.svg?v=8.0" color="#5bbad5">
   <link rel="shortcut icon" href="https://crc353.encs.concordia.ca/resources/images/favicon/favicon.ico?v=8.0">
   <meta name="msapplication-TileColor" content="#da532c">
   <meta name="msapplication-config" content="https://crc353.encs.concordia.ca/resources/images/favicon/browserconfig.xml?v=8.0">
   <meta name="theme-color" content="#ffffff">

   <!-- CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css?v=8.0"
       integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://crc353.encs.concordia.ca/resources/css/custom.css?v=9.7">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css?v=8.0"
       integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

   <!-- JS -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js?v=8.0"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js?=8.0"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
