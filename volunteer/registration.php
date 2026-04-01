 <?php
require_once('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
   
$fname = trim($_POST['first_name']);
$lname = trim($_POST['last_name']);
$phone = trim($_POST['phone']);
$user  = trim($_POST['username']);
$email = trim($_POST['email']);


$stmt1 = $conn->prepare("INSERT INTO Users (Username, Email, Password_Hash, Role) VALUES (?, ?, 'pass123', 'volunteer')");
$stmt1->bind_param("ss", $user, $email);
    
if ($stmt1->execute()) {
        

$new_id = $conn->insert_id;

        
$stmt2 = $conn->prepare("INSERT INTO Volunteers (User_ID, First_Name, Last_Name, Phone) VALUES (?, ?, ?, ?)");
$stmt2->bind_param("isss", $new_id, $fname, $lname, $phone);
        
if ($stmt2->execute()) {
echo "<p>Volunteer added successfully!</p>";
        
}
} else {
    
echo "Error: " . $conn->error;
    }
}
?>

<h2>Volunteer Registration</h2>
<form method="post" action="registration_volunteer.php">
Username: <input type="text" name="username" required><br>
Email: <input type="email" name="email" required><br>
First Name: <input type="text" name="first_name" required><br>
Last Name: <input type="text" name="last_name" required><br>
Phone: <input type="text" name="phone"><br>
 


<input type="submit" value="Register">
</form>
<a href="index.php">Back to Menu</a>
