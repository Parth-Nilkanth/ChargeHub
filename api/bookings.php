<?php
include("../connection.php");

$sql = "SELECT B.*, S.name, S.location, S.city, S.latitude, S.longitude 
        FROM bookings AS B, stations AS S 
        WHERE S.id = B.stationid";

if (isset($_POST['userid'])) {
    // Sanitize user input to prevent SQL injection
    $userid = intval($_POST['userid']);
    $sql .= " AND B.userid = " . $userid;
}

$result = mysqli_query($conn, $sql);

// Check if the query was successful
if (!$result) {
    // Log the error for debugging purposes
    error_log("Database query failed: " . mysqli_error($conn));

    // Return an error response in JSON format
    header('Content-Type: application/json');
    echo json_encode(array("status" => "error", "message" => "Database query failed."));
    exit();
}

$dataarray = array();

while ($row = mysqli_fetch_assoc($result)) {
    $tarray = array();
    $tarray["status"] = 'success';
    $tarray = array_merge($tarray, $row);		
    array_push($dataarray, $tarray);
}

header('Content-Type: application/json');
echo json_encode(array("data" => $dataarray));
?>
