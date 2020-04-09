<?php 

$file_contents = $_REQUEST[q];

#$file_contents = "ewogICJ1cmwiOiAiaHR0cDovL2RpdmFrc2guY29tIiwKICAiZXJyb3JfY29kZSI6IDMKfQ==";


// create the object
$obj = base64_decode($file_contents);

//echo $obj;

// encode the object in JSON format
//$data = json_decode($obj);

$data = json_decode($obj, true);

/*
echo $data;
echo "\n"; 

echo $data['url'];
echo "\n"; 
  
echo $data['error_code'];
*/

$urlToAdd = $data['url'];
$errorCode = $data['error_code'];

$allData = $urlToAdd . "," . $errorCode . "," . date("d") ."-". date("m") ."-". date("Y") . "\n";

// echo $allData;

    $fp = fopen('reportedurls.txt', 'a'); //opens file in append mode  
    fwrite($fp, $allData);  
    fclose($fp);  
      
    echo "Thank you for your contribution towards making RajERP Bot better, we will investigate what went wrong and fix it as soon as possible.";  

?> 
