 <?php
 
require_once('db.php');
 
$query = "SELECT Events.Event_Name, Tasks.Task_Name, Volunteers.First_Name, Assignments.Assignment_Status
          

 FROM Assignments
 JOIN Volunteers ON Assignments.Volunteer_ID = Volunteers.Volunteer_ID
 JOIN Tasks ON Assignments.Task_ID = Tasks.Task_ID
 JOIN Events ON Tasks.Event_ID = Events.Event_ID";

$result = mysqli_query($conn, $query);

echo "<h1>Volunteer Master Schedule</h1>";

echo "<table border='1' cellpadding='5'>";
echo "<tr><th>Event</th><th>Task</th><th>Volunteer</th><th>Status</th></tr>";

 
while ($row = mysqli_fetch_assoc($result)) {
echo "<tr>";
     
 echo "<td>" . htmlspecialchars($row['Event_Name']) . "</td>";
 echo "<td>" . htmlspecialchars($row['Task_Name']) . "</td>";
 echo "<td>" . htmlspecialchars($row['First_Name']) . "</td>";
 echo "<td>" . htmlspecialchars($row['Assignment_Status']) . "</td>";
 echo "</tr>";
}
echo "</table>";
?>

<br>
<img src="End.jpg" width="400">
<br>
<a href="index.php">Back to Home</a>
