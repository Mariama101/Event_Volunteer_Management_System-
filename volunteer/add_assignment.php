 <?php
require_once('db.php');


if ($_SERVER["REQUEST_METHOD"] == "POST") {
$vol_id = $_POST['volunteer_id'];
$task_id = $_POST['task_id'];

$stmt = $conn->prepare("INSERT INTO Assignments (Volunteer_ID, Task_ID, Assignment_Status) VALUES (?, ?, 'Assigned')");
$stmt->bind_param("ii", $vol_id, $task_id);
    
if ($stmt->execute()) {
echo "<p>Assignment created!</p>";
    }
}

$vol_result = $conn->query("SELECT Volunteer_ID, First_Name, Last_Name FROM Volunteers");

$task_result = $conn->query("SELECT Task_ID, Task_Name FROM Tasks");
?>
<img src="Assignment.jpg" width="400">
<h2>Assign a Volunteer to a Task</h2>
<form method="post" action="add_assignment.php">
    
Volunteer: 
<select name="volunteer_id">
<?php 
        

while($row = $vol_result->fetch_assoc()) {
echo "<option value='".$row['Volunteer_ID']."'>".$row['First_Name']." ".$row['Last_Name']."</option>";


}
?>
 </select><br><br>

Task:
<select name="task_id">
        
<?php 
while($row = $task_result->fetch_assoc()) {
echo "<option value='".$row['Task_ID']."'>".$row['Task_Name']."</option>";
}
 ?>

</select><br><br>
<input type="submit" value="Create Assignment">
</form>
<a href="index.php">Back to Menu</a>
