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
//last statement of the code which is to close the database.
  $conn = null;
?>
