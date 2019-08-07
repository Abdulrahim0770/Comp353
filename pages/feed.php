<!DOCTYPE html>
<?php
require $_SERVER['DOCUMENT_ROOT'] . '/repeated/navbar.php'; //Getting the code from navbar.php file.
require $_SERVER['DOCUMENT_ROOT'] . '/assets/query.php'; //Getting the code from query.php file.

?>
<html lang="en">
   <body id="lightOrangeBg">
      <div class="container-fluid text-center">
        <div class="row">
        <div class="col-md-4 mid"></div>
         <div class="col-md-4 mid">
               <h2 class="display-4">PRESS ANY BUTTONS </h2>
                  <span style="font-size:100px">&#128036;</span>
                  <span style="font-size:60px">&#128168;</span>
                  <p>
                  <div class="spinner-grow text-muted"></div>
                  <div class="spinner-grow text-primary"></div>
                  <div class="spinner-grow text-success"></div>
                  <div class="spinner-grow text-info"></div>
                  <div class="spinner-grow text-warning"></div>
                  <div class="spinner-grow text-danger"></div>
                  <div class="spinner-grow text-secondary"></div>
                  <div class="spinner-grow text-dark"></div>
                  <div class="spinner-grow text-light"></div>
                </p>
          </div>
          <div class="col-md-4 mid"></div>
        </div>
        </div>
          <div class="container-fluid content">
            <div class="row">
            <div class="col-md-4 mid">
              <form method="post">
                <a class="btn btn-lg btn-primary btn-block" href="https://crc353.encs.concordia.ca/pages/student.php">Student Modification</a>
                <a class="btn btn-lg btn-secondary btn-block" href="https://crc353.encs.concordia.ca/pages/faculty.php">Faculty Member Modification</a>
                <a class="btn btn-lg btn-success btn-block" href="https://crc353.encs.concordia.ca/pages/TA.php">Teaching Assitance Modification</a>
                <button class="btn btn-lg btn-danger btn-block" type="submit" name="listOfCampus">List of All Campuses</button>
                <button class="btn btn-lg btn-warning btn-block" type="submit" name="listOfBuildings" >List of Buildings given a campus</button>
                <button class="btn btn-lg btn-info btn-block" name="DetailListOfBuildings">Building Information given a building</button>
                <button class="btn btn-lg btn-dark btn-block" name="listOfProgram">List of Programs given a department</button>
              <br>
            </form>
            </div>
            <div class="col-md-4 mid">
              <form method="post">
                <button class="btn btn-lg btn-primary btn-block" name="listCourseTermProg">List of courses given a term and program</button>
                <button class="btn btn-lg btn-secondary btn-block" name="detailCourseTermDept">Detail of courses given a term and department</button>
                <button class="btn btn-lg btn-success btn-block" name="listStudentTermProg">List of students given a term and program</button>
                <button class="btn btn-lg btn-danger btn-block" name="listInstrTermCourse">List of instructors given a term and course</button>
                <button class="btn btn-lg btn-warning btn-block" name="listSuperDepartment">List of supervisors given a department</button>
                <button class="btn btn-lg btn-info btn-block" name="listAdvisorDepartment">List of advisors given a department</button>
                <button class="btn btn-lg btn-dark btn-block" name="listGraduateSuper">List of graduates given supervisor name</button>
                <button class="btn btn-lg btn-block" style="background-color:Violet !important;" disabled>List of graduates assignment given term and course - No Query?</button>
                ^-- Need Explanation (Team Help)
            <br>
              </form>
         </div>
         <div class="col-md-4 mid">
              <form method="post">
                 <button class="btn btn-lg btn-primary btn-block" name="listGraduateFundTerm">List of graduates funds given term</button>
                 <button class="btn btn-lg btn-secondary btn-block" name="listCourseDepartChairman">List of course offered by department and its chairman</button>
                 <button class="btn btn-lg btn-success btn-block" name="totalStudentProgram">Total number of students in each program</button>
                 <button class="btn btn-lg btn-danger btn-block" name="listCourseStudentTerm">List of courses given student and term</button>
                 <button class="btn btn-lg btn-warning btn-block" disabled>Register student in a course - Confused!</button>
                 ^-- Need Explanation (Team Help)
                 <button class="btn btn-lg btn-info btn-block" disabled>Drop a course for a student - Confused!</button>
                 ^-- Need Explanation (Team Help)
                 <button class="btn btn-lg btn-dark btn-block" name="detailStudent">Detail report given a student</button>
            <br>
               </form>
         </div>
       </div>
       </div>
      <?php require $_SERVER['DOCUMENT_ROOT'] . '/repeated/footer.php'; ?> <!-- Getting the code from footer.php file. -->
   </body>
</html>
