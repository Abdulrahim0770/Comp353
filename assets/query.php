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
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
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
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Campus</h5>
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
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Building </h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
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
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Building</h5>
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
   $STH = $conn->query("SELECT RoomNumber AS 'Room Number', floorLevel AS 'Floor Level',  (SELECT Count(floorLevel) FROM Rooms r, Building b WHERE r.BuildingID = b.BuildingID AND b.BuildingID = '".$_POST['sendingBuildingID']."') AS 'Total Rooms on Floor', RoomCapacity AS 'Room Capacity', RoomType AS 'Room Type', FacilitiesAvailable AS 'Facilities Available'
   FROM Building b, Rooms r LEFT JOIN Facilities f ON r.RoomsID = f.RoomsID WHERE b.BuildingID = r.BuildingID AND b.BuildingID = '".$_POST['sendingBuildingID']."'");
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Detail of Building </h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo "Building Name: ".$row['BuildingName']."</br>";
                  echo "Building Address: ".$row['BuildingAddress']."</br>";
                  echo "Total Floor: ".$row['totalFloors']."</br>";
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
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
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Department</h5>
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
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Program Available</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
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
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">List of Department</h5>
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
                  <label for="sel1">Choose a Year</label>
                  <select class="form-control" name="sendingYear">
<?php
                     while($row = $STHTWO->fetch()) {
                       echo "<option name='display' value='".$row['year']."'>".$row['year']."</option>";
                     }
?>
                  </select>
                  <label for="sel1">Choose a Program Name</label>
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
?>
<div class="panel-body">
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title">Course Offered</h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
<?php
                  echo '<table class="table table-bordered  table-striped table-hover text-center">';
                  $i = 0;
                  while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
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
