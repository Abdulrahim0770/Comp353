<!DOCTYPE html>
<?php
require $_SERVER['DOCUMENT_ROOT'] . '/repeated/navbar.php'; //Getting the code from navbar.php file.
require $_SERVER['DOCUMENT_ROOT'] . '/assets/query.php'; //Getting the code from query.php file.


?>
<html lang="en">
   <body id="lightOrangeBg">
      <div class="container-fluid content">
        <div class="row">
        <div class="col-md-4 mid"></div>

         <div class="col-md-4 mid">
               <h2 class="display-4" align="center" >
                  <div> PRESS THE DAMN BUTTON >:D </div>
               </h2>
            <br>
              <a class="btn btn-lg btn-success btn-block" href="https://crc353.encs.concordia.ca/pages/student.php">Student Modification</a>
                <a class="btn btn-lg btn-info btn-block" href="https://crc353.encs.concordia.ca/pages/faculty.php">Faculty Member Modification  - Work in Progress</a>
                  <a class="btn btn-lg btn-warning btn-block" href="https://crc353.encs.concordia.ca/pages/TA.php">Teaching Assitance Modification - Work in Progress</a>
                  <a class="btn btn-lg btn-primary btn-block disabled" href="">List of All Campuses - Work in Progress</a>
                  <a class="btn btn-lg btn-danger btn-block disabled" href="">Search Building - Work in Progress</a>
         </div>

         <div class="col-md-4 mid"></div>

      </div>
      </div>
      <?php require $_SERVER['DOCUMENT_ROOT'] . '/repeated/footer.php'; ?> <!-- Getting the code from footer.php file. -->
   </body>
</html>
