
<?php

session_start();
$_SESSION['user'] = 'jignesh';
header("Location: GamePage.php"); // Redirecting to other page
?>
