<?php
session_start();
$error=''; //Variable to Store error message;
if(isset($_POST['submit'])){
	if(empty($_POST['user']) || empty($_POST['pass'])){
		$error = "Username or Password is Invalid";
	}
	else
	{
		//Define $user and $pass
		$user=$_POST['user'];
		$pass=$_POST['pass'];
		//Establishing Connection with server by passing server_name, user_id and pass as a patameter
		$conn = mysqli_connect("db1.cs642-shu.com", "gameuser", "mypass");
		//Selecting Database
		$db = mysqli_select_db($conn, "games");
		//sql query to fetch information of registerd user and finds user match.
		$query = mysqli_query($conn, "SELECT * FROM login WHERE pass='$pass' AND user='$user'");
		
		$rows = mysqli_num_rows($query);
		if($rows == 1){
			$_SESSION['user'] = $user;
			header("Location: http://52.87.204.169/GamePage.php"); // Redirecting to other page
		}
		else
		{
			$error = "Username of Password is Invalid";
		}
		mysqli_close($conn); // Closing connection
	}
}

?>
