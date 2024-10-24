<?php
include("../connection.php");

// Check if userid is set in POST request
if (isset($_POST['userid'])) {
    // Sanitize user input to prevent SQL injection
    $userid = intval($_POST['userid']);

    // SQL query to select vehicles based on userid
    $sql = "SELECT * FROM vehicles WHERE userid = " . $userid;
    
    // Execute the query
    $result = mysqli_query($conn, $sql);

    // Initialize data array
    $dataarray = array();

    // Check if query execution was successful
    if ($result) {
        // Fetch rows from the result set
        while ($row = mysqli_fetch_assoc($result)) {
            // Add success status to each record
            $tarray = array();
            $tarray["status"] = 'success';
            $tarray = array_merge($tarray, $row);		
            array_push($dataarray, $tarray);
        }
    } else {
        // Log the error for debugging purposes
        error_log("Database query failed: " . mysqli_error($conn));
        
        // Return an error response in JSON format
        header('Content-Type: application/json');
        echo json_encode(array("status" => "error", "message" => "Database query failed."));
        exit();
    }

    // Return the results as a JSON response
    header('Content-Type: application/json');
    echo json_encode(array("data" => $dataarray));

} else {
    // If userid is not provided, return an error response
    header('Content-Type: application/json');
    echo json_encode(array("status" => "error", "message" => "User ID not provided."));
}
?>
