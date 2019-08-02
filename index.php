duh hello
<html lang="en">
   <?php
      require $_SERVER['DOCUMENT_ROOT'] . '/repeated/header.php'; //Getting the code from header.php file.

      if(isset($_SESSION["sessionID"])){
        echo "<script>window.location = 'https://crc353.encs.concordia.ca/pages/feed.php';</script>";
      }

      require $_SERVER['DOCUMENT_ROOT'] . '/assets/alertsModals.php'; //Getting the code from alertModals.php file.
      ?>
   <body id="lightOrangeBg">
      <nav class="navbar navbar-expand-sm bg-warning navbar-light">
         <a class="navbar-brand">
         <img src="https://crc353.encs.concordia.ca/resources/images/logo/duck.png" width="30" height="30" class="d-inline-block align-top" alt="">
         <img src="https://crc353.encs.concordia.ca/resources/images/logo/Quacker.png" width="140" height="30" class="d-inline-block align-top" alt="">
         </a>
      </nav>
      <p style="background-color:Tomato; text-align: center; color: white;"><font size="5">Welcome to Quacker University, this is a team project for COMP 353 course.</font></p>
      <div class = "container-fluid">
         <div class = "row">
            <div class="col-md-7">
               <h1 align="center" id="slogan">Don't be wack, start to quack.</h1>
            </div>
            <div class="col-md-3 loginForm">
               <form class="form-signin" action="../assets/query.php" method="post">
                  <!-- Login form -->
                  <h2 class="form-signin-heading">Login</h2>
                  <div class="form-group">
                     <input type="text" class="form-control" name="username" placeholder="Username" required="" autofocus>
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" name="password" placeholder="Password" required="">
                  </div>
                  <div class="form-group form-check">
                     <label class="form-check-label">
                     <input class="form-check-input" type="checkbox" checked="checked" name="remember"> Remember me
                     </label>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block" name="login" type="submit">Login</button><br>
               </form>
            </div>
         </div>
         <div class="waveWrapper waveAnimation">
           <img class="floatingDuck" src="https://crc353.encs.concordia.ca/resources/images/logo/duck.png">
            <div class="waveWrapperInner bgMiddle">
               <div class="wave waveMiddle" style="background-image: url('https://crc353.encs.concordia.ca/resources/images/annimation/wave-mid.png')"></div>
            </div>
            <div class="waveWrapperInner bgBottom">
               <div class="wave waveBottom" style="background-image: url('https://crc353.encs.concordia.ca/resources/images/annimation/wave-bot.png')"></div>
            </div>
         </div>
      </div>
      <nav class="navbar navbar-expand-sm bg-warning fixed-bottom">
         <!-- The footer code -->
         <div class = "container-fluid">
            <ul class="navbar-nav mr-auto">
               <li class="nav-item active">Copyright by the Quack Gang © - <?PHP echo date("Y"); ?></li>
            </ul>
            <ul class="navbar-nav">
               <li class="nav-item"><img src="https://crc353.encs.concordia.ca/resources/images/annimation/Quack.gif" height="35px"/></li>
            </ul>
         </div>
      </nav>
   </body>
</html>
