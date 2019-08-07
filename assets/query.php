<?php
   $_SESSION['sessionID']; //Session to store logged in user ID
   $_SESSION['sessionUsername']; //Session to store logged in username
   require $_SERVER['DOCUMENT_ROOT'] . '/assets/config.php';  //Getting the code from config.php file.

   // ################################# VERIFY LOGIN #################################
   if (isset($_POST['login'])) {
       $username = $_POST['username'];
       $password = $_POST['password'];
       $STH = $conn->query("SELECT * FROM Admin WHERE username='$username'");
       $STH->setFetchMode(PDO::FETCH_ASSOC);
       $row = $STH->fetch();

       if($row && $password==$row["password"]) {
               $_SESSION['sessionID']           = $row['userID'];
               $_SESSION['sessionUsername']     = $row['username'];
               if (isset($_POST['remember'])) { //If remember me is checked, set cookie for 10 days so the user won't have to relogin.
                   setcookie("cookieID", $row['userID'], time() + (86400 * 10), "/");
                   setcookie("cookieUsername", $row['username'], time() + (86400 * 10), "/");
                   setcookie("cookieLoggedIn", date_format(date_create($row['lastLogin']), 'd M y - H:i'), time() + (86400 * 10), "/");
               }
               echo "<script>window.location = 'https://crc353.encs.concordia.ca/pages/feed.php';</script>";
               exit;
       } else {
           echo "<script>window.location = 'https://crc353.encs.concordia.ca/?Alert=credentialError';</script>";
           exit;
         }
   }

   //********** List of All Campuses **********//
   if(isset($_POST['listOfCampus'])){
   $STH = $conn->query("SELECT CampusName AS 'Campus Name' FROM Campus");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Campus</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of Buildings given a campus **********//
   if(isset($_POST['listOfBuildings'])){
     $STH = $conn->query("SELECT CampusID, CampusName FROM Campus");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a Campus</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Campus</label>
                  <select class="form-control" name="sendingCampusID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['CampusID']."'>".$row['CampusName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonOne">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonOne'])) {
     $STH = $conn->query("SELECT Building.BuildingName AS 'Building Name' FROM Building WHERE Building.CampusID='".$_POST['sendingCampusID']."' ");
     $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Building</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Building Information given a building **********//
   if(isset($_POST['DetailListOfBuildings'])) {
     $STH = $conn->query("SELECT BuildingID, BuildingName FROM Building");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a Building</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Building</label>
                  <select class="form-control" name="sendingBuildingID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['BuildingID']."'>".$row['BuildingName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonTwo">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonTwo'])) {
   $STH = $conn->query("SELECT DISTINCT BuildingName, BuildingAddress, totalFloors FROM Building WHERE BuildingID = '".$_POST['sendingBuildingID']."'");
                       $row = $STH->fetch();
                       $STH = $conn->query("SELECT r.floorLevel AS 'Floor Level', COUNT(*) AS 'Rooms on Floor', r.RoomNumber AS 'Room Number',  r.RoomCapacity AS 'Room Capacity', r.RoomType AS 'Room Type', f.FacilitiesAvailable AS 'Facilities Available'
                                            FROM Building b, Rooms r LEFT JOIN Facilities f ON r.RoomsID = f.RoomsID
                                            WHERE r.BuildingID = b.BuildingID AND b.BuildingID = '".$_POST['sendingBuildingID']."' GROUP BY r.floorLevel;");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Details of Building </h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                 if($row) {
                  echo "<b>Building Name: </b>".$row['BuildingName']."</br>";
                  echo "<b>Building Address: </b>".$row['BuildingAddress']."</br>";
                  echo "<b>Total Floor: </b>".$row['totalFloors']."</br>";
                }
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of Programs given a department **********//
   if(isset($_POST['listOfProgram'])) {
     $STH = $conn->query("SELECT DepartmentID, departmentName FROM Department");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a Department</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Department</label>
                  <select class="form-control" name="sendingDepartmentID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['DepartmentID']."'>".$row['departmentName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonThree">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonThree'])) {
   $STH = $conn->query("SELECT p.programName AS 'Program Name', d.departmentName AS 'Department Name', u.underGradCredit AS 'Credits' FROM Program p, Department d, UnderGraduateProgram u WHERE u.ProgramID = p.ProgramID AND p.DepartmentID = d.DepartmentID AND d.DepartmentID = '".$_POST['sendingDepartmentID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Programs Available</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of courses given a term and program **********//
   if(isset($_POST['listCourseTermProg'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
     $STHTHREE = $conn->query("SELECT ProgramID, programName FROM Program");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Program Name</label>
                  <select class="form-control" name="sendingProgramID">
<?php
                     while($row = $STHTHREE->fetch()) {
                       echo "<option name='display' value='".$row['ProgramID']."'>".$row['programName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonFour">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonFour'])) {
   $STH = $conn->query("SELECT c.name AS 'Course Offered'
                        FROM Course c, Section s, Term t, Department d, Program p
                        WHERE c.CourseID = s.CourseID AND c.DepartmentID = d.DepartmentID AND d.DepartmentID = p.DepartmentID AND s.TermID = t.TermID AND SessionID = '".$_POST['sendingSessionID']."' AND year = '".$_POST['sendingYear']."' AND ProgramID = '".$_POST['sendingProgramID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Course Offered</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Detail of courses given a term and department **********//
   if(isset($_POST['detailCourseTermDept'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
     $STHTHREE = $conn->query("SELECT DepartmentID, departmentName FROM Department");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Department</label>
                  <select class="form-control" name="sendingDepartmentID">
<?php
                     while($row = $STHTHREE->fetch()) {
                       echo "<option name='display' value='".$row['DepartmentID']."'>".$row['departmentName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonFive">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonFive'])) {
   $STH = $conn->query("SELECT  c.name AS 'Course Name', CONCAT(BuildingName, '-', r.RoomsID) AS 'Room', CONCAT(c.name, '-' ,s.courseID, s.SectionID, s.TermID, '-' , t.SessionID) AS Section,
                       Concat(time.weekDay,' ',time.startTime) AS 'Start Time', Concat(time.weekDay,' ',time.endTime) AS 'End Time', Concat(i.firstName, ' ',i.lastName) AS 'Professor', r.RoomCapacity AS 'Room Capacity', Count(reg.SectionID) AS 'Total Students Enrolled'
                       FROM Term t, Section s, Course c, Department d, Program p, TimeSlot time, Rooms r, Instructor i, Registration reg, Building b
                       WHERE p.DepartmentID = d.DepartmentID AND d.DepartmentID = c.DepartmentID AND c.CourseID = s.CourseID AND s.TermID = t.TermID AND s.TimeSlotID = time.TimeSlotID AND s.RoomsID = r.RoomsID  AND s.InstructorID = i.InstructorID AND s.SectionID = reg.SectionID
                       AND d.departmentID = '".$_POST['sendingDepartmentID']."' AND t.year = '".$_POST['sendingYear']."' AND t.SessionID = '".$_POST['sendingSessionID']."'
                       GROUP BY reg.SectionID");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Detail of Courses</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of students given a term and program **********//
   if(isset($_POST['listStudentTermProg'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
     $STHTHREE = $conn->query("SELECT ProgramID, programName FROM Program");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Program</label>
                  <select class="form-control" name="sendingProgramID">
<?php
                     while($row = $STHTHREE->fetch()) {
                       echo "<option name='display' value='".$row['ProgramID']."'>".$row['programName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonSix">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonSix'])) {
   $STH = $conn->query("SELECT s.StudentID AS 'Student ID', s.firstName AS 'First Name', s.lastName AS 'Last Name'
          FROM Student s, EnrollsIN e, Term t, Session ses
          WHERE s.StudentID = e.StudentID AND e.TermID = t.TermID AND t.SessionID = ses.SessionID AND e.ProgramID = '".$_POST['sendingProgramID']."' AND ses.sessionID = '".$_POST['sendingSessionID']."' AND t.year = '".$_POST['sendingYear']."'
          ORDER BY s.StudentID ASC");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Student Enrolled</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of instructors given a term and course **********//
   if(isset($_POST['listInstrTermCourse'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
     $STHTHREE = $conn->query("SELECT CourseID, name FROM Course");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Course</label>
                  <select class="form-control" name="sendingCourseID">
<?php
                     while($row = $STHTHREE->fetch()) {
                       echo "<option name='display' value='".$row['CourseID']."'>".$row['name']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonSeven">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonSeven'])) {
   $STH = $conn->query("SELECT Concat(i.firstName,' ',i.lastName) AS 'Professor'
                        FROM Instructor i, Section s, Term t, Course c, Session ses
                        WHERE i.InstructorID = s.InstructorID AND s.CourseID = c.CourseID AND s.TermID=t.TermID AND t.SessionID = ses.SessionID
                        AND c.CourseID = '".$_POST['sendingCourseID']."' AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'");
    $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Instructors</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of supervisors given a department **********//
   if(isset($_POST['listSuperDepartment'])){
     $STH = $conn->query("SELECT DepartmentID, departmentName FROM Department");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a Department</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Department</label>
                  <select class="form-control" name="sendingDepartmentID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['DepartmentID']."'>".$row['departmentName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonEight">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonEight'])) {
     $STH = $conn->query("SELECT DISTINCT Concat(i.firstName,' ',i.lastName) AS 'Supervisor', d.departmentName AS 'Department'
                          FROM ThesisGraduate tg, Instructor i, Student s, Department d
                          WHERE s.StudentID = tg.StudentID AND tg.InstructorID = i.InstructorID  AND i.InstructorID = d.InstructorID
                          AND d.DepartmentID = '".$_POST['sendingDepartmentID']."'");
     $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Supervisors</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of advisors given a department **********//
   if(isset($_POST['listAdvisorDepartment'])){
     $STH = $conn->query("SELECT DepartmentID, departmentName FROM Department");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select Department</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Department</label>
                  <select class="form-control" name="sendingDepartmentID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['DepartmentID']."'>".$row['departmentName']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonNine">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonNine'])) {
     $STH = $conn->query("SELECT CONCAT(a.firstName,' ', a.lastName) AS 'Advisor Name'
                          FROM Advisor a, Program p, Department d
                          WHERE a.ProgramID = p.ProgramID AND p.DepartmentID = d.DepartmentID
                          AND d.departmentID = '".$_POST['sendingDepartmentID']."'");
     $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Advisors</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of graduates given supervisor name **********//
   if(isset($_POST['listGraduateSuper'])){
     $STH = $conn->query("Select Concat(InstructorID,' - ',' ',firstName,' ',lastName) AS 'Instructor Name' From Instructor");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a Supervisor</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Supervisor</label>
                  <select class="form-control" name="sendingInstructorName">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['Instructor Name']."'>".$row['Instructor Name']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonTen">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonTen'])) {
     $STH = $conn->query("SELECT tg.StudentID AS 'Student ID', Concat(s.firstName,' ', s.lastName) AS 'Student Name'
                          FROM ThesisGraduate tg, Instructor i, Student s
                          WHERE s.StudentID = tg.StudentID AND tg.InstructorID = i.InstructorID
                          AND i.InstructorID+' - '+' '+i.firstName+' '+i.lastName = '".$_POST['sendingInstructorName']."'");
     $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Graduate Students</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of graduates assignment given term and course **********//
   if(isset($_POST['GIMMEABUTTON:D'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
     $STHTHREE = $conn->query("SELECT CourseID, name FROM Course");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">UPDATE THIS TITLE!</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Program</label>
                  <select class="form-control" name="sendingCourseID">
<?php
                     while($row = $STHTHREE->fetch()) {
                       echo "<option name='display' value='".$row['CourseID']."'>".$row['name']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonEleven">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonEleven'])) {
   $STH = $conn->query("SELECT Concat(i.firstName,' ',i.lastName) AS 'Professor', c.name AS 'Course Name', t.year AS 'Year', ses.session AS 'Session'
                        FROM Instructor i, Section s, Term t, Course c, Session ses
                        WHERE i.InstructorID = s.InstructorID AND s.CourseID = c.CourseID AND s.TermID=t.TermID AND t.SessionID = ses.SessionID
                        AND c.CourseID = '".$_POST['sendingCourseID']."' AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">UPDATE THIS TITLE!</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of graduates funds given term **********//
   if(isset($_POST['listGraduateFundTerm'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonTwelve">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonTwelve'])) {
   $STH = $conn->query("SELECT  s.StudentID AS 'Student ID', s.firstName, s.lastName, f.amount AS 'Research Fund'
                        FROM Student s, Graduate g, Funds f, ThesisGraduate tg, Term t, Session ses
                        WHERE s.StudentID = g.StudentID AND g.StudentID = tg.StudentID AND tg.ThesisGraduateID = f.ThesisGraduateID AND f.TermID = t.TermID AND t.SessionID = ses.SessionID
                        AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'
                        UNION ALL
                        SELECT 'Total', '', '', SUM(f.amount)
                        FROM Student s, Graduate g, Funds f, ThesisGraduate tg, Term t, Session ses
                        WHERE s.StudentID = g.StudentID AND g.StudentID = tg.StudentID AND tg.ThesisGraduateID = f.ThesisGraduateID AND f.TermID = t.TermID AND t.SessionID = ses.SessionID
                        AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Graduates and Total Funds</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Total Number of Course Offered Per Department and its Chairman **********//
   if(isset($_POST['listCourseDepartChairman'])){
   $STH = $conn->query("SELECT DISTINCT d.departmentName AS 'Department Name', COUNT(d.departmentName) AS 'Courses Offered', Concat(i.firstName,' ', i.lastName) AS 'Chairman'
                        FROM Department d, Course c, Chairman ch, Instructor i
                        WHERE i.InstructorID = ch.InstructorID AND ch.DepartmentID = d.DepartmentID AND d.DepartmentID = c.DepartmentID
                        GROUP BY d.DepartmentName");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Courses Offered By Each Department</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Total number of students in each program **********//
   if(isset($_POST['totalStudentProgram'])){
   $STH = $conn->query("SELECT DISTINCT p.programName AS 'Program Name', COUNT(p.ProgramID) AS 'Students Enrolled'
                        FROM Program p, EnrollsIN e
                        WHERE p.ProgramID = e.ProgramID
                        GROUP BY p.ProgramID");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Students Enrolled In Each Program</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** List of courses given student and term **********//
   if(isset($_POST['listCourseStudentTerm'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please select your options and provide details</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <div class="md-form mb-1">
                     <label for="sel1"><br>Enter Student ID</label>
                     <input name="sendingUserID" type="text" class="form-control" required>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonThirteen">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonThirteen'])) {
   $STH = $conn->query("SELECT c.name AS 'Course Taken'
                        FROM Course c, Student s, Registration r, Section sc, Term t, Session ses
                        WHERE t.SessionID = ses.SessionID AND s.StudentID = r.StudentID AND r.SectionID = sc.SectionID AND sc.CourseID = c.CourseID AND t.TermID = sc.TermID AND s.StudentID = '".$_POST['sendingUserID']."'
                        AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Courses Taken</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Register student in a course **********//
   if(isset($_POST['registerStudentCourse'])) {

     $STH = $conn->query("SELECT DISTINCT SectionID, name
                          FROM Section s, Course c , Term t
                          WHERE s.CourseID = c.CourseID
                          AND t.TermID = s.TermID
                          AND t.SessionID = 1
                          AND t.year = 2018");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Select a course</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Course</label>
                  <select class="form-control" name="sendingSectionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SectionID']."'>".$row['name']."</option>";
                     }
?>
                  </select>
                  <div class="md-form mb-1">
                     <label for="sel1" ><br>Enter Student ID</label>
                     <input maxlength="7" name="sendingUserID" type="text" class="form-control" required>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonFourteen">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonFourteen'])) {
       $STHOne = $conn->prepare("SELECT COUNT(StudentID) as 'count', SectionID FROM Registration WHERE StudentID = '".$_POST['sendingUserID']."' AND SectionID = '".$_POST['sendingSectionID']."'");
       $STHOne->execute();
       $rows = $STHOne->fetch();
      if ($rows['count'] > 0) {
        echo '
        <div class="alert alert-danger text-center" role="alert">Sorry! The student is already registered for this course.</div>
        ';
      }
        else {
          try {
       $STH = $conn->prepare("INSERT INTO Registration (StudentID, SectionID, Date, GradeID)
                             SELECT DISTINCT ?, ? , CURDATE(), 14
                             FROM Registration
                             WHERE NOT EXISTS(SELECT DISTINCT SectionID, StudentID
                             FROM Registration WHERE SectionID = ? AND StudentID = ?)");
      $STH->bindParam(1, $_POST['sendingUserID']);
      $STH->bindParam(2, $_POST['sendingSectionID']);
      $STH->bindParam(3, $_POST['sendingSectionID']);
      $STH->bindParam(4, $_POST['sendingUserID']);
      $STH->execute();
      echo '
      <div class="alert alert-success text-center" role="alert">Congrats! The student is registered in the course.</div>
      ';
    } catch (Exception $e) {
       echo '
       <div class="alert alert-danger text-center" role="alert">Error! '.$e->getMessage().'</div>
       ';
     }
   }
   }

   //********** Drop a course for a student **********//
   if(isset($_POST['GIMMEABUTTON'])) {
     $STH = $conn->query("SELECT SessionID, session FROM Session");
     $STHTWO = $conn->query("SELECT DISTINCT year FROM Term");

?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">UPDATE THIS TITLE!</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <label for="sel1">Choose a Session</label>
                  <select class="form-control" name="sendingSessionID">
<?php
                     while($row = $STH->fetch()) {
                       echo "<option name='display' value='".$row['SessionID']."'>".$row['session']."</option>";
                     }
?>
                  </select>
                  <label for="sel1"><br>Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <div class="md-form mb-1">
                     <label for="sel1"><br>Enter Student ID</label>
                     <input name="sendingUserID" type="text" class="form-control" required>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonFifteen">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonFifteen'])) {
   $STH = $conn->query("SELECT c.name AS 'Course Taken'
                        FROM Course c, Student s, Registration r, Section sc, Term t, Session ses
                        WHERE t.SessionID = ses.SessionID AND s.StudentID = r.StudentID AND r.SectionID = sc.SectionID AND sc.CourseID = c.CourseID AND t.TermID = sc.TermID AND s.StudentID = '".$_POST['sendingUserID']."'
                        AND t.year = '".$_POST['sendingYear']."' AND ses.sessionID = '".$_POST['sendingSessionID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">UPDATE THIS TITLE!</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }

   //********** Detail report given a student **********//
   if(isset($_POST['detailStudent'])) {
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Please provide the Student ID</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <form  method="post">
                  <div class="md-form mb-1">
                     <label for="sel1"><br>Enter Student ID</label>
                     <input name="sendingUserID" type="text" class="form-control" required>
                  </div>
                  <div class="modal-footer">
                     <button type="submit" class="btn btn-primary" name="ButtonSixteen">Submit</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
   $("#myModal").modal();
   });
</script>
<?php
   }

   if(isset($_POST['ButtonSixteen'])) {
   $STH = $conn->query("SELECT StudentID, firstName, lastName, SSN, dob, phone, email, address FROM Student WHERE StudentID = '".$_POST['sendingUserID']."'");
                       $row = $STH->fetch();
  $STHOne = $conn->query("SELECT degreeName FROM Degree WHERE StudentID = '".$_POST['sendingUserID']."'");
                       $STH = $conn->query("SELECT c.name AS 'Course Name', g.gradeLetter AS 'Grade'
                                            FROM Student s, Course c, Registration r, Section sc, Grade g
                                            WHERE s.StudentID = r.StudentID AND r.SectionID = sc.SectionID AND sc.CourseID = c.CourseID AND g.RegistrationID = r.RegistrationID AND s.StudentID = '".$_POST['sendingUserID']."'");
   $result = 0;
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Student Details</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  if ($row) {
                  echo "<b>Student ID: </b>".$row['StudentID']."</br>";
                  echo "<b>First Name: </b>".$row['firstName']."</br>";
                  echo "<b>Last Name: </b>".$row['lastName']."</br>";
                  echo "<b>Socal Security Number: </b>".$row['SSN']."</br>";
                  echo "<b>Date of Birth: </b>".$row['dob']."</br>";
                  echo "<b>Phone: </b>".$row['phone']."</br>";
                  echo "<b>Email: </b>".$row['email']."</br>";
                  echo "<b>Address: </b>".$row['address']."</br>";
                  echo "<b>Academic History: </b>";
                  while($rowOne = $STHOne->fetch(PDO::FETCH_ASSOC)) {
                    echo $rowOne['degreeName'] . ", ";
                  }
                  echo "</br>";
                }
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                    $result = 1;
                      if ($i == 0) {
                        $i++;
                        echo "<tr>";
                        foreach ($row as $key => $value) {
                          echo "<th>" . $key . "</th>";
                        }
                        echo "</tr>";
                      }
                      echo "<tr>";
                      foreach ($row as $value) {
                        echo "<td>" . $value . "</td>";
                      }
                    echo "</tr>";
                  }
                  echo "</table>";
                  if($result == 0)
                    echo "No Result Found";
?>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   $(function() {
     $("#myModal").modal();
   });
</script>
<?php
   }
     $conn = null;
?>
