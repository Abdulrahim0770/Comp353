<!DOCTYPE html>
<?php
   require $_SERVER['DOCUMENT_ROOT'] . '/repeated/navbar.php'; //Getting the code from navbar.php file.
   require $_SERVER['DOCUMENT_ROOT'] . '/assets/config.php'; //Getting the code from config.php file.
?>
<html lang="en">
   <body id="lightOrangeBg">
<?php
         if(isset($_POST['saveEdit'])) { //Editing a Student
           $STH = $conn->prepare("UPDATE Student SET firstName=?, lastName=?, SSN=?, dob=?, address=?, email=?, phone=? WHERE StudentID=?");
           $STH->bindParam(1, $_POST['firstName']);
           $STH->bindParam(2, $_POST['lastName']);
           $STH->bindParam(3, $_POST['SSN']);
           $STH->bindParam(4, $_POST['dob']);
           $STH->bindParam(5, $_POST['address']);
           $STH->bindParam(6, $_POST['email']);
           $STH->bindParam(7, $_POST['phone']);
           $STH->bindParam(8, $_POST['id']);
           $STH->execute();
         }
         if(isset($_POST['delete'])) { //Delete a Student
           $STH = $conn->prepare("DELETE FROM Student WHERE StudentID=$_POST[id]");
           $STH->execute();
         }
         if(isset($_POST['add'])) { //Insert a Student
           $STH = $conn->prepare("INSERT INTO Student (firstName, lastName, dob, address, phone, email, SSN) Values (?,?,?,?,?,?,?)");
           $STH->bindParam(1, $_POST['firstName']);
           $STH->bindParam(2, $_POST['lastName']);
           $STH->bindParam(3, $_POST['dob']);
           $STH->bindParam(4, $_POST['address']);
           $STH->bindParam(5, $_POST['phone']);
           $STH->bindParam(6, $_POST['email']);
           $STH->bindParam(7, $_POST['SSN']);
           $STH->execute();
         }
?>
      <html>
         <head>
            <script type="text/javascript">
               function validate(form) {
                   return confirm('Are you certain?');
               }
            </script>
         </head>
         <body>
            <div class="container-fluid text-center">
              </br></br>
              <div class="row">
               <div class="col-md-4 mid">
                  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#addNewStudent">Add a new Student</button>
               </div>
               <div class="col-md-4 mid">
                  <a class="btn btn-info disabled" href="https://crc353.encs.concordia.ca/assets/print.php?table=Student">Print - Not a Priority</a>
               </div>
               <div class="col-md-4 mid">
                  <form style="display: inline;" method="post" class="form-inline">
                     <input name ="search" class="form-control mr-sm-2" type="search" placeholder="Search By ID" aria-label="Search">
                     <button class="btn btn-success my-2 my-sm-0" type="submit">Search</button>
                  </form>
<?php
                     if(isset($_POST['search'])) {
?>
                           <button onclick="window.location=window.location.href" class="btn btn-info">Undo Search</button>
<?php
                     }
?>
               </div>
             </div>
            </div></br>
            <h3 align="center">Student Informations</h3>
            <div class="container-fluid content">
              <div class="row">
               <div class="content">
<?php
                     if(isset($_POST['editUser'])) {
                      $STH = $conn->query("SELECT * FROM Student WHERE StudentID=$_POST[id]");
                      $row = $STH->fetch();
?>
                      <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="insertingStudent" aria-hidden="true">
                         <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                               <div class="modal-header text-center">
                                  <h5 class="modal-title">Edit Student</h5>
                                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                  </button>
                               </div>
                               <div class="modal-body mx-3">
                                  <form role="form" method="post">
                                    <input type="hidden" name="id" value="<?= $_POST['id'] ?>">
<?php
                                      formGroup("fa-user", "firstName", "First Name", "text", $row["firstName"]);
                                      formGroup("fa-user", "lastName", "Last Name", "text", $row["lastName"]);
                                      formGroup("fa-id-card", "SSN", "Social Security Number", "text", $row["SSN"]);
                                      formGroup("fa-birthday-cake", "dob", "Date Of Birth", "date", $row["dob"]);
                                      formGroup("fa-map-marked-alt", "address", "Address", "text", $row["address"]);
                                      formGroup("fa-phone prefix", "phone", "Phone", "text", $row["phone"]);
                                      formGroup("fa-envelope", "email", "Email", "email", $row["email"]);
?>
                               </div>
                               <div class="modal-footer">
                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                               <button type="submit" class="btn btn-info" name="saveEdit">Save Changes</button>
                               </div>
                               </form>
                            </div>
                         </div>
                      </div>
                      <script>
                      $(function() {
                        $("#editUserModal").modal();
                      });
                      </script>
<?php
                     }
?>
                  </br>
                  <div class="panel-body">
<?php
                              if(isset($_POST['search'])) {
                                  $search = $_POST['search'];
                              }
                              $STH = $conn->query("SELECT StudentID, firstName, lastName, SSN, dob, phone, email, address FROM Student " . (isset($search) ? "WHERE StudentID LIKE '%$search%'" : "")); //used for searching
                              echo '<table class="table table-bordered table-info table-striped table-hover text-center">';
                              $i = 0;
                              while($row = $STH->fetch(PDO::FETCH_ASSOC)) {
                                  if ($i == 0) {
                                    $i++;
                                    echo "<tr>";
                                    foreach ($row as $key => $value) {
                                      echo "<th>" . $key . "</th>";
                                    }
                                      echo '<th class="text-info">Edit</th>';
                                      echo '<th class="text-danger">Delete</th>';
                                    echo "</tr>";
                                  }
                                  echo "<tr>";
                                  foreach ($row as $value) {
                                    echo "<td>" . $value . "</td>";
                                  }
?>
                                  <td>
                                     <form method="post">
                                        <input type="hidden" name="id" value="<?= $row['StudentID'] ?>">
                                        <input type="submit" class="btn btn-info" value="Edit" name="editUser">
                                     </form>
                                  </td>
                                  <td>
                                     <form method="post" onsubmit="return validate(this);">
                                        <input type="hidden" name="id" value="<?= $row['StudentID'] ?>">
                                        <input type="submit" class="btn btn-danger" value="Delete" name="delete">
                                     </form>
                                  </td>
<?php
                                echo "</tr>";
                              }
                              echo "</table>";
?>
                  </div>
               </div>
               <div class="modal fade" id="addNewStudent" tabindex="-1" role="dialog" aria-labelledby="insertingStudent" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                        <div class="modal-header text-center">
                           <h5 class="modal-title">Insert Student</h5>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        <div class="modal-body mx-3">
                           <form role="form" method="post">

<?php
                             formGroup("fa-user", "firstName", "First Name", "text", "");
                             formGroup("fa-user", "lastName", "Last Name", "text", "");
                             formGroup("fa-id-card", "SSN", "Social Security Number", "text", "");
                             formGroup("fa-birthday-cake", "dob", "Date Of Birth", "date", "");
                             formGroup("fa-map-marked-alt", "address", "Address", "text", "");
                             formGroup("fa-phone prefix", "phone", "Phone", "text", "");
                             formGroup("fa-envelope", "email", "Email", "email", "");
?>
                        </div>
                        <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary" name="add">Add</button>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
          </div>
            <?php require $_SERVER['DOCUMENT_ROOT'] . '/repeated/footer.php'; ?> <!-- Getting the code from footer.php file. -->
         </body>
      </html>
<?php
      function formGroup($iconClass, $label, $text, $type, $value) { //This function creates formGroup from the given parameters
        echo '
        <div class="md-form mb-1">
           <i class="fas '.$iconClass.' prefix grey-text"></i>
           <label for="'.$label.'">'.$text.'</label>
           <input name="'.$label.'" type="'.$type.'" class="form-control" value="'.$value.'" required>
        </div>
        ';
      }
?>
