<?php
$_SESSION['sessionID']; //Session to store logged in user ID
$_SESSION['sessionUsername']; //Session to store logged in username

require $_SERVER['DOCUMENT_ROOT'] . '/assets/config.php';  //Getting the code from config.php file.

// ################################# VERIFY LOGIN #################################
//The goal of this method is to verify whether or not the preson can log in.




if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $STH = $conn->query("SELECT * FROM Admin WHERE username='$username'");
    $STH->setFetchMode(PDO::FETCH_ASSOC);
    $row = $STH->fetch();

    if($row && $password==$row["password"]){
          //Select the fields from database again and set them as sessions.

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

if(isset($_POST['listOfCampus'])){
      $STH = $conn->query("SELECT CampusName AS 'Campus Name' FROM Campus"); //used for searching  ?>
<div class="panel-body">
<div class="modal fade" id="listOfCampus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">List of Campus</h5>
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
    $("#listOfCampus").modal();
  });
  </script>
<?php
}

if(isset($_POST['listOfBuildings'])){
  $STH = $conn->query("SELECT CampusID, CampusName FROM Campus"); //used for searching  ?>
<div class="panel-body">
<div class="modal fade" id="listOfCampus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
<div class="modal-dialog modal-dialog-centered" role="document">
<div class="modal-content">
  <div class="modal-header">
    <h5 class="modal-title" id="exampleModalCenterTitle">List of Campus</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
<?php
    if(isset($_POST['submit'])) { //Insert a Student
      echo "hello world";
      ?>
      <scrip>
        window.location.href = "http://www.google.ca";
      </script>
      <?php
    }
    ?>



</div>
</div>
</div>
</div>
</div>
<script>
$(function() {
$("#listOfCampus").modal();
});
</script>
<?php
}
  $conn = null;
?>
