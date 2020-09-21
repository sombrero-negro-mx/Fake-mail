#Fake-mail 
Sistema basico para la realización de Email Spoofing atravez de una cosola bash y un servidor con http

#No_Me_Hago_Responsable_Por_El_Mal_Uso_Que_Se_Le_Pueda_Dar_A_Esta_Aplicación

este es un software pensado en la realización de ataques a como Phishing direcciones de correo electronico, ademas de poder realizar spam masivos, pero mas aún esta pensado para enseñar a indentificar correos falsos aunto enviandoselos para su posterior verificación visual.

#send.php

este archivo no es necesario en local, sin embargo es extremadamente necesario en el servidor, ya que es este el que realiza los envios de E-mails, siendo la consola solo un medio de interacción.

este archivo resive cuatro parametros por "POST" y un header

$to = $_POST['remitente']; (se que esta mal escrito)

$subjet = $_POST['asunto'];

$message = $_POST['msj'];

$from = $_POST['desde'];

$headers = "From:"	.	$from;

los cuales entran despues a una funcion mail en php

$mail = mail($to,$subjet,$message,$headers,$from); 
