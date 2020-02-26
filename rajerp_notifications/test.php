<?
	//$CURRENTTIME = new DateTime($data['current_time']);
/*     $CURRENTTIME  = new DateTime('08:00:59');
	$OFFICEINTIME  = new DateTime('09:00:00');
	$OFFICEOUTTIME  = new DateTime('18:00:00');

    if ($CURRENTTIME  < $OFFICEINTIME || $CURRENTTIME > $OFFICEOUTTIME) {
       echo 'Do not run ';
    }  else {
       echo 'Script is running';
   } */
  
  
//Run service during the office hours only  
   $CURRENTTIME  = date("G");
   if($CURRENTTIME > 9 && $CURRENTTIME < 18){
		   echo 'Service is online';
   }
   else{
	   echo 'Service is offline';
   }

?>

<?php include 'rajerp/functions.php'; ?>

<?php
// $update_old is a last update info
// $update_new is the new update info

//Reading lastest time and date
$url='https://rajerp.rajasthan.gov.in/home/showupdatehistory';
// using file() function to get content
$lines_array=file($url);
// turn array into one variable
$update_new=implode('',$lines_array);


//Additional Check to Know if RajERP is Down
$Check1 = mb_substr($update_new, 0, 39);
$Check2 = "The most recent update was published on";


if(strcmp($Check1, $Check2) == 0){

	//remove last dot
	echo $update_new=mb_substr($update_new, 0, -1);
	echo '</br>';

	//Reading old time and date
	$update_old = file_get_contents("/home/admin/web/divaksh.com/public_html/rajerp_update_test.txt");

	//Old time
	$publidhed_old1 = mb_substr($update_old, 0, 62);
	echo '</br>';
	$published_old = mb_substr($publidhed_old1, 36);
	echo 'Published Old : '. foolproofTime($published_old);
	echo '</br>';
	$updated_old = mb_substr($update_old, 75);
	echo 'Updated Old : '. foolproofTime($updated_old);
	echo '</br>';

	//New time
	$published_new1 = mb_substr($update_new, 0, 62);
	$published_new = mb_substr($published_new1, 36);
	echo 'Published New : '. foolproofTime($published_new);
	echo '</br>';
	$updated_new = mb_substr($update_new, 75);
	echo 'Updated New : '. foolproofTime($updated_new);
	echo '</br>';

	//Storing time for notification text as variables are not allowed in api
	echo $published_text =  "Raj ERP updates just sent from the e-connect headquarters on " . foolproofTime($published_new);
	echo '</br>';
	echo $updated_text = "Raj ERP just got better! updates arrived at RSDC on " . foolproofTime($updated_new);  
	echo '</br>';

	file_put_contents("/home/admin/web/divaksh.com/public_html/rajerp_published_test.txt", $published_text);
	file_put_contents("/home/admin/web/divaksh.com/public_html/rajerp_updated_test.txt", $updated_text);

	// Checking the old and new time differece
	if(strcmp($update_new, $update_old) == 0){
		
		//Again up notification
		if(file_exists('/home/admin/web/divaksh.com/public_html/erpdown_test.log')){
			if(!file_exists('/home/admin/web/divaksh.com/public_html/erpup_test.log')){
				function sendMessage() {
					$content      = array(
						"en" => 'RajERP is UP and back on the track.'
					);
					$heading = array(
						"en" => 'RajERP is Up!'
					);
					$fields = array(
						'app_id' => "eada2698-ce33-411e-b001-d488b2999608",
						'included_segments' => array(
							'All'
						),
						'data' => array(
							"foo" => "bar"
						),
						'contents' => $content,
						'url' => 'https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push',
						'headings' => $heading,
					);
    
					$fields = json_encode($fields);
					print("\nJSON sent:\n");
					print($fields);
   
					$ch = curl_init();
					curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
					curl_setopt($ch, CURLOPT_HTTPHEADER, array(
						'Content-Type: application/json; charset=utf-8',
						'Authorization: Basic ODMyODk1NTMtZmU2ZS00ZDk5LWE5OWItMmEzMTMyYjhjMzU5'
					));
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
					curl_setopt($ch, CURLOPT_HEADER, FALSE);
					curl_setopt($ch, CURLOPT_POST, TRUE);
					curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
					curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
					$response = curl_exec($ch);
					curl_close($ch);
		
					return $response;
				}
			/* $response = sendMessage();  */
			print("\n");
			echo $ERPup="RajERP is Up";
			file_put_contents("/home/admin/web/divaksh.com/public_html/erpup_test.log", $ERPup);
			}
			else{
				echo '</br>';
				echo "Up notification already sent.";
				echo '</br>';
			}
		}
		echo '</br>';
		echo 'OLD and NEW time are same.';
	}
	else {
/* 			//Checking published date and time
		if (strcmp($published_new, $published_old) != 0) {
			function sendMessage() {
				$content      = array(
					"en" => file_get_contents("rajerp_published_test.txt")
				);
				$heading = array(
					"en" => 'RajERP Update Published'
				);
				$fields = array(
					'app_id' => "eada2698-ce33-411e-b001-d488b2999608",
					'included_segments' => array(
						'All'
					),
					'data' => array(
						"foo" => "bar"
					),
					'contents' => $content,
					'url' => 'https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push',
					'headings' => $heading,
				);
    
				$fields = json_encode($fields);
				print("\nJSON sent:\n");
				print($fields);
   
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
				curl_setopt($ch, CURLOPT_HTTPHEADER, array(
					'Content-Type: application/json; charset=utf-8',
					'Authorization: Basic ODMyODk1NTMtZmU2ZS00ZDk5LWE5OWItMmEzMTMyYjhjMzU5'
				));
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
				curl_setopt($ch, CURLOPT_HEADER, FALSE);
				curl_setopt($ch, CURLOPT_POST, TRUE);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
				$response = curl_exec($ch);
				curl_close($ch);

				return $response; 
			}
 			$response = sendMessage();
			print("\n"); 
		}	
*/
		//Checking update date and time
		if (strcmp($updated_new, $updated_old) != 0) {
			function sendMessage() {
				$content      = array(
					"en" => file_get_contents("rajerp_updated_test.txt")
				);
				$heading = array(
					"en" => 'RajERP Updated'
				);
				$fields = array(
					'app_id' => "eada2698-ce33-411e-b001-d488b2999608",
					'included_segments' => array(
						'All'
					),
					'data' => array(
						"foo" => "bar"
					),
					'contents' => $content,
					'url' => 'https://divaksh.com/rajerp/update?utm_source=notification&utm_medium=push',
					'headings' => $heading,
				);
    
 				$fields = json_encode($fields);
				print("\nJSON sent:\n");
				print($fields);
    
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
				curl_setopt($ch, CURLOPT_HTTPHEADER, array(
					'Content-Type: application/json; charset=utf-8',
					'Authorization: Basic ODMyODk1NTMtZmU2ZS00ZDk5LWE5OWItMmEzMTMyYjhjMzU5'
				));
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
				curl_setopt($ch, CURLOPT_HEADER, FALSE);
				curl_setopt($ch, CURLOPT_POST, TRUE);
				curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
				curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
				$response = curl_exec($ch);
				curl_close($ch);
		
				return $response;
			}
 			/* $response = sendMessage(); */
			print("\n");			
		}
		 
		echo 'Strings do not match.';	
		// if there is a differece in old and new time update the file
		// $update_old = file_put_contents("/home/admin/web/divaksh.com/public_html/rajerp_update_test.txt", $update_new);  
	} 
}

else {
	if(!file_exists('/home/admin/web/divaksh.com/public_html/erpdown_test.log')){
		function sendMessage() {
			$content      = array(
				"en" => 'Hold tight! RajERP does not seem to be working right now.'
			);
			$heading = array(
				"en" => 'RajERP is Down!'
			);
			$fields = array(
				'app_id' => "eada2698-ce33-411e-b001-d488b2999608",
				'included_segments' => array(
					'All'
				),
				'data' => array(
					"foo" => "bar"
				),
				'contents' => $content,
				'url' => 'https://divaksh.com/rajerp/down?utm_source=notification&utm_medium=push',
				'headings' => $heading,
			);
    
 			$fields = json_encode($fields);
			print("\nJSON sent:\n");
			print($fields);
   
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
			curl_setopt($ch, CURLOPT_HTTPHEADER, array(
				'Content-Type: application/json; charset=utf-8',
				'Authorization: Basic ODMyODk1NTMtZmU2ZS00ZDk5LWE5OWItMmEzMTMyYjhjMzU5'
			));
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
			curl_setopt($ch, CURLOPT_HEADER, FALSE);
			curl_setopt($ch, CURLOPT_POST, TRUE);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    
			$response = curl_exec($ch);
			curl_close($ch);
		
			return $response; 
		}
		/* $response = sendMessage(); */
		print("\n");
		echo $ERPdown="RajERP is down";
		file_put_contents("/home/admin/web/divaksh.com/public_html/erpdown_test.log", $ERPdown);
	}
	else{
		echo '</br>';
		echo "Down notification already sent.";
	}
}
?>