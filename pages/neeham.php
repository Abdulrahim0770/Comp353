<!DOCTYPE html>
<?php
require $_SERVER['DOCUMENT_ROOT'] . '/repeated/navbar.php'; //Getting the code from navbar.php file.
require $_SERVER['DOCUMENT_ROOT'] . '/assets/query.php'; //Getting the code from query.php file.
require $_SERVER['DOCUMENT_ROOT'] . '/assets/config.php';
$sql = "SELECT * FROM Student";
$result = mysqli_query($conn, $sql);
?>

<html lang="en">
<body>
  <div class="container">
   <br />
   <br />
   <br />
            <div class="table-responsive">
    <h3 align="center">Student Information</h3><br />
    <table id="editable_table" class="table table-bordered table-striped">
     <thead>
      <tr>
       <th>Student ID</th>
       <th>First Name</th>
       <th>Last Name</th>
       <th>Date of Birth</th>
       <th>Address</th>
       <th>Phone</th>
       <th>Email</th>
      </tr>
     </thead>
     <tbody>
     <?php
     while($row = mysqli_fetch_array($result))
     {
      echo '
      <tr>
       <td>'.$row["StudentID"].'</td>
       <td>'.$row["firstName"].'</td>
       <td>'.$row["lastName"].'</td>
       <td>'.$row["dob"].'</td>
       <td>'.$row["address"].'</td>
       <td>'.$row["phone"].'</td>
       <td>'.$row["email"].'</td>
      </tr>
      ';
     }
     ?>
     </tbody>
    </table>
   </div>
  </div>
  <?php require $_SERVER['DOCUMENT_ROOT'] . '/repeated/footer.php'; ?> <!-- Getting the code from footer.php file. -->
 </body>
</html>
<script>
$(document).ready(function(){
     $('#editable_table').Tabledit({
      url:'action.php',
      columns:{
       identifier:[0, "id"],
       editable:[[1, 'first_name'], [2, 'last_name']]
      },
      restoreButton:false,
      onSuccess:function(data, textStatus, jqXHR)
      {
       if(data.action == 'delete')
       {
        $('#'+data.id).remove();
       }
      }
     });

});
 </script>
