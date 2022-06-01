<?php
// API URL
$url = 'https://discord.com/api/webhooks/981352884715270185/cOcn2zUvuNGEgYR6l1xA4jKwOLYEo-yS3diRCCmKtV3zUSDvXF5J5joOulzwFuThy6C6i';

// Create a new cURL resource
$ch = curl_init($url);

// Setup request to send json via POST
$data = array(
    'content' => 'poopers',
);
$payload = json_encode(array("user" => $data));

// Attach encoded JSON string to the POST fields
curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

// Set the content type to application/json
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));

// Return response instead of outputting
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the POST request
$result = curl_exec($ch);

// Close cURL resource
curl_close($ch);
?>