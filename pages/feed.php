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
                  <div> PRESS THE BUTTON >:D </div>
               </h2>
            <br>

              <form method="post">
                <a class="btn btn-lg btn-primary btn-block" href="https://crc353.encs.concordia.ca/pages/student.php">Student Modification</a>
                <a class="btn btn-lg btn-secondary btn-block" href="https://crc353.encs.concordia.ca/pages/faculty.php">Faculty Member Modification</a>
                <a class="btn btn-lg btn-success btn-block" href="https://crc353.encs.concordia.ca/pages/TA.php">Teaching Assitance Modification</a>
                <button class="btn btn-lg btn-danger btn-block" type="submit" name="listOfCampus">List of All Campuses</button>
                <button class="btn btn-lg btn-warning btn-block" type="submit" name="listOfBuildings" >List of Buildings given a campus</button>




                <button class="btn btn-lg btn-info btn-block disabled" name="">Building Information given a building</button>
                <button class="btn btn-lg btn-dark btn-block disabled" name="">List of Programs given a department</button>
                <button class="btn btn-lg btn-primary btn-block disabled" name="">List of courses given a term and program</button>
                <button class="btn btn-lg btn-secondary btn-block disabled" name="">List of courses given a term and department</button>
                <button class="btn btn-lg btn-success btn-block disabled" name="">List of students given a term and program</button>
                <button class="btn btn-lg btn-danger btn-block disabled" name="">List of instructors given a term and course</button>
                <button class="btn btn-lg btn-warning btn-block disabled" name="">List of supervisors given a department</button>
                <button class="btn btn-lg btn-info btn-block disabled" name="">List of advisors given a department</button>
                <button class="btn btn-lg btn-dark btn-block disabled" name="">List of graduates given supervisor name</button>
                <button class="btn btn-lg btn-primary btn-block disabled" name="">List of graduates assignment given term and course</button>
                <button class="btn btn-lg btn-secondary btn-block disabled" name="">List of graduates funds given term</button>
                <button class="btn btn-lg btn-success btn-block disabled" name="">List of course offered given the deparment and chairman</button>
                <button class="btn btn-lg btn-danger btn-block disabled" name="">Total number of students in each program</button>
                <button class="btn btn-lg btn-warning btn-block disabled" name="">List of courses given student and term</button>
                <button class="btn btn-lg btn-info btn-block disabled" name="">Register student in a course</button>
                <button class="btn btn-lg btn-dark btn-block disabled" name="">Drop a course for a student</button>
                <button class="btn btn-lg btn-primary btn-block disabled" name="">Detail report given a student</button>


              </form>


         </div>

         <div class="col-md-4 mid"></div>

      </div>
      </div>
      <?php require $_SERVER['DOCUMENT_ROOT'] . '/repeated/footer.php'; ?> <!-- Getting the code from footer.php file. -->
   </body>
</html>
