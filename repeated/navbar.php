<?php

   require $_SERVER['DOCUMENT_ROOT'] . '/repeated/header.php'; //Getting the code from header.php file.
   require $_SERVER['DOCUMENT_ROOT'] . '/assets/alertsModals.php'; //Getting the code from alertModals.php file.

   if(!isset($_SESSION['sessionID'])){
     echo "<script>window.location = 'https://crc353.encs.concordia.ca/index.php';</script>";
   }
   ?>
<div class="wrapper"> <!-- The end tag of this wrapper class is found at the very end of footer.php file-->
<div class="header">
   <nav class="navbar navbar-expand-sm bg-warning navbar-light navbar-fixed-top"> <!-- Nav Bar -->
         <a class="navbar-brand" href="https://crc353.encs.concordia.ca/pages/feed.php"><img
            src="https://crc353.encs.concordia.ca/resources/images/logo/duck.png" height="35px" /></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
         </button>
         <div class = "collapse navbar-collapse" id="navbarSupportedContent">
           <ul class="navbar-nav">
              <li class="nav-item">
                 <a class="nav-link" href="https://crc353.encs.concordia.ca/pages/feed.php">Main Page</a>
              </li>
           </ul>
            <ul class = "navbar-nav ml-auto">
              <div class="lastLoggedIn">Last Logged in: <?php echo $_SESSION["sessionLastLoggedIn"]."&nbsp&nbsp"; ?> </div> <!-- Displaying the last time the user logged in -->
               <li class="nav-item ">
                  <a class="nav-link p-0" href="https://crc353.encs.concordia.ca/assets/logout.php"><button class="Logout-button btn btn-danger mx-2 my-2 my-sm-0">Log out</button></a>
               </li>
            </ul>
         </div>
   </nav>
</div>
