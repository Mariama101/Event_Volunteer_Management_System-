<?php

require_once('db.php');



if ($_SERVER["REQUEST_METHOD"] == "POST") {
$fname = $_POST['first_name'];
$lname = $_POST['last_name'];
$phone = $_POST['phone'];
    
$username = $fname . $lname;
$email = $fname . "@example.com";
    
    
$sql_user = "INSERT INTO Users (Username, Email, Password_Hash, Role) 
VALUES ('$username', '$email', 'password123', 'volunteer')";
    
if (mysqli_query($conn, $sql_user)) {
     
$new_user_id = mysqli_insert_id($conn);

        
$sql_vol = "INSERT INTO Volunteers (User_ID, First_Name, Last_Name, Phone) 
VALUES ('$new_user_id', '$fname', '$lname', '$phone')";
        
if (mysqli_query($conn, $sql_vol)) {
    echo "<p style='color: green; font-weight: bold;'>Volunteer Registered Successfully!</p>";
        } else {
echo "<p style='color: red;'>Volunteer Error: " . mysqli_error($conn) . "</p>";
        }
    } else {
echo "<p style='color: red;'>User Error: " . mysqli_error($conn) . "</p>";
    }
}
?>

<h1>Volunteer Registration</h1>
<form action="registration_volunteer.php" method="post">
<p>First Name:<br>
<input type="text" name="first_name" required></p>
    
<p>Last Name:<br>
<input type="text" name="last_name" required></p>
    
<p>Phone:<br>
<input type="text" name="phone" required></p>
    
<input type="submit" value="Register">
</form>

<p><a href="index.php">Back to Home</a></p>
