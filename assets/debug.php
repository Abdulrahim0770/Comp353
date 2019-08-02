<?php
   include $_SERVER['DOCUMENT_ROOT'] . '/repeated/header.php';
   include $_SERVER['DOCUMENT_ROOT'] . '/assets/config.php';
?>
<style>
  body {
  background-color: pink;
  }
</style>
<div class="container-fluid">
  <div class="spinner-grow text-muted"></div>
  <div class="spinner-grow text-primary"></div>
  <div class="spinner-grow text-success"></div>
  <div class="spinner-grow text-info"></div>
  <div class="spinner-grow text-warning"></div>
  <div class="spinner-grow text-danger"></div>
  <div class="spinner-grow text-secondary"></div>
  <div class="spinner-grow text-dark"></div>
  <div class="spinner-grow text-light"></div>
  <h1 style="color:red;"> Welcome! - Here we will debug our Database visually &#9749;</h1>
  <h1 style="color:green;"> CLICK <a href="https://crc353.encs.concordia.ca/assets/ER.jpg" target="_blank"> >*>*>HERE<*<*< </a> TO VIEW OUR ER DIAGRAM!</h1>
  <h1 style="color:purple;"> CLICK <a href="https://crc353.encs.concordia.ca/assets/tableInfo.php" target="_blank"> >*>*>HERE<*<*< </a> TO VIEW COLUMNS DESCRIPTION OF ALL THE TABLES</h1>
  <h2 style="color:blue;">Here are the tables and their content I found on the Database:</h2>
  <?php
     $table = array(); //Array holding all the tables found in our database
     $STHONE = $conn->query("SHOW TABLES");
     foreach ($STHONE as $row) {
         $table[] = $row["Tables_in_crc353_1"];  //Storing all the tables found on the Database into an array called table
     }

     //*************************** Printing all the Table and it's data found on the Database ***************************
     $j = 0;
     while ($j < sizeof($table)) {
       $STHTWO = $conn->query("SELECT COUNT(*) AS Total FROM $table[$j]");
       if ($row = $STHTWO->fetch()) {
          echo "<br><h3> Table Name: <span style='color:red;'>{$table[$j]}</span></h3>";
          echo "<h3> Total Rows: <span style='color:red;'>{$row['Total']}</span></h3>";
       }

      $STHTHREE = $conn->query("SELECT @row_number:=@row_number + 1 AS 'Row', s.* FROM $table[$j] s, (SELECT @row_number := 0) r");

     echo '<table class="table table-dark table-striped table-hover">';
     $i = 0;
     while($row = $STHTHREE->fetch(PDO::FETCH_ASSOC)) {
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
      $j++;
     }
     $conn = null;
     ?>
</div>
