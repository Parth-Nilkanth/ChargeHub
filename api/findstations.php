<?php
    include("../connection.php");

    // Function to calculate distance using the Haversine formula
    function haversineDistance($lat1, $lon1, $lat2, $lon2) {
        $R = 6371; // Earth radius in kilometers
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * sin($dLon / 2) * sin($dLon / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        $distance = $R * $c; // Distance in kilometers

        return $distance;
    }

    // Function to get records within a specified distance
    function getRecordsWithinDistance($lat, $lon, $distance) {
        global $conn;

        $sql = "SELECT * FROM stations";
        $result = mysqli_query($conn, $sql);

        if (!$result) {
            // Log the error for debugging
            error_log("Database query failed: " . mysqli_error($conn));
            return [];
        }

        $records = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $recordLat = $row['latitude'];
            $recordLon = $row['longitude'];

            $recordDistance = haversineDistance($lat, $lon, $recordLat, $recordLon);

            if ($recordDistance <= $distance) {
                $records[] = $row;
            }
        }

        return $records;
    }

    $dataarray = array(); // Initialize $dataarray

    if (isset($_POST['lat'])) {
        // Get parameters from the request
        $inputLat = isset($_POST['lat']) ? floatval($_POST['lat']) : 0;
        $inputLon = isset($_POST['lon']) ? floatval($_POST['lon']) : 0;
        $searchDistance = 10; // Search distance in kilometers

        // Get records within the specified distance
        $dataarray = getRecordsWithinDistance($inputLat, $inputLon, $searchDistance);

    } else if (isset($_POST['city'])) {
        $city = $_POST['city'];
        $sql = "SELECT * FROM stations WHERE city = '$city'";

        $result = mysqli_query($conn, $sql);

        if (!$result) {
            // Log the error for debugging
            error_log("Database query failed: " . mysqli_error($conn));
        } else {
            while ($row = mysqli_fetch_assoc($result)) {
                $tarray = array();
                $tarray["status"] = 'success';
                $tarray = $row;
                array_push($dataarray, $tarray);
            }
        }
    }

    header('Content-Type: application/json');
    echo json_encode(array("data" => $dataarray));
?>
