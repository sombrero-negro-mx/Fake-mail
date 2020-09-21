<?php 
$to = $_POST['remitente'];

$subjet = $_POST['asunto'];

$message = $_POST['msj'];

$from = $_POST['desde'];

$headers = "From:"	.	$from;

$mail = mail($to,$subjet,$message,$headers,$from); 
 
 if($mail){

 	echo "Email Enviado Correctamente";
 }else{

 	echo "Algo a salido mal! :c";
 }
 ?>