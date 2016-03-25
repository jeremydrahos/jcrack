#!/bin/sh
#	Jiggy Crack by Jeremy Drahos
#	jeremy@thedrahos.net
#	http://thedrahos.net/jcrack
#
#	Jiggy Crack creates a dictionary file that will contain the default
#	password for the supported router.  You must, of course, have the
#	handshake in order to use aircrack, or whichever tool you favor, to
#	verify which of the passwords in the dictionary is the correct one.
jigver="v0.3.4beta"
echo "Jiggy Crack" $jigver "by Jeremy Drahos (jeremy@thedrahos.net)"
echo ""
echo "Select the router model:"
echo "1. Arris DG860A"
echo "2. Belkin with SSID of belkin.xxx"
echo "3. Belking with SSID of Belkin.XXXX"
echo "4. Motorola SurfBoard SBG6580"
echo "5. Ubee DDW365"
echo "6. Ubee DVW3201B"
echo "7. Arris TG1672G"
echo "8. Technicolor TC8717T"
echo "'q' to quit"
echo ""
read -p "Select the target router from the list: " router_option

q () {
	echo "Quitting..."
	exit 0
}

sbg6580 () {
	echo "What are the last 2 characters of the SSID for the SBG6580?"
	read router_last2
	echo "Generating dictionary file for a SBG6580 with a SSID ending in $router_last2"
	crunch 13 13 0123456789ABCDEF -t SBG6580@@@@$router_last2 > sbg6580.$router_last2
	dictfile=`ls -sh sbg6580.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

dvw3201b () {
	echo "What are the last 2 characters of the SSID for the DVW3201B?"
	read router_last2
	echo "Generating dictionary file for a DVW3201B with a SSID ending in $router_last2"
	crunch 14 14 0123456789ABCDEF -t DVW3201B@@@@$router_last2 > dvw3201b.$router_last2
	dictfile=`ls -sh dvw3201b.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

ddw365 () {
	echo "What are the last 2 characters of the SSID for the DDW365?"
	read router_last2
	echo "Generating dictionary file for a DDW365 with a SSID ending in $router_last2"
	crunch 12 12 0123456789ABCDEF -t DDW365@@@@$router_last2 > ddw365.$router_last2
	dictfile=`ls -sh ddw365.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

dg860 () {
	echo "What are the last 2 characters of the SSID for the DG860A?"
	read router_last2
	echo "Generating dictionary file for a DG860A with a SSID ending in $router_last2"
	crunch 12 12 0123456789ABCDEF -t DG860A@@@@$router_last2 > dg860.$router_last2
	dictfile=`ls -sh dg860.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

tg1672g () {
	echo "What are the last 2 characters of the SSID for the TG1672G?"
	read router_last2
	echo "Generating dictionary file for a TG1672G with a SSID ending in $router_last2"
	crunch 13 13 0123456789ABCDEF -t TG1672G@@@@$router_last2 > tg1672.$router_last2
	dictfile=`ls -sh tg1672.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

belkinxxx () {
read -p "WARNING: This dictionary will be nearly 22GB! Are you sure you want to continue? [y/n]: " gobelkin
	if [ $gobelkin != y ]
		then 
			echo "I was looking for a 'y' to continue."
			echo "Quitting..."
			exit 0
	fi
	echo "Creating belkin.xxx.dic.  This file will be nearly 22GB, if you want to bail press ^C."
	crunch 8 8 0123455679abcdef > belkin.xxx.dic
	dictfile=`ls -sh belkin.xxx.dic`
	echo "Dictionary created: $dictfile"
	exit 0
}

belkinXXXX () {
read -p "WARNING: This dictionary will be 36GB! Are you sure you want to continue? [y/n]: " gobelkin
	if [ $gobelkin != y ]
		then 
			echo "I was looking for a 'y' to continue."
			echo "Quitting..."
			exit 0
	fi
	echo "Creating belkin.XXXX.dic.  This file will be 36GB, if you want to bail press ^C."
	crunch 8 8 0123456789ABCDEF > Belkin.XXXX.dic
	dictfile=`ls -sh belkin.XXXX.dic`
	echo "Dictionary created: $dictfile"
	exit 0
}

tc8717t () {
	echo "What are the last 2 characters of the SSID for the TC8717T?"
	read router_last2
	echo "Generating dictionary file for a TC8717T with a SSID ending in $router_last2"
	crunch 13 13 0123456789ABCDEF -t TC8717T@@@@$router_last2 > tc8717t.$router_last2
	dictfile=`ls -sh tc8717t.$router_last2`
	echo "Dictionary created: $dictfile"
	exit 0
}

case "$router_option" in
	1 ) dg860
	;;
	2 ) belkinxxx
	;;
	3 ) belkinXXXX
	;;
	4 ) sbg6580
	;;
	5 ) ddw365
	;;
	6 ) dvw3201b
	;;
	7 ) tg1672g
	;;
	8 ) tc8717t
	;;
	q ) q
	;;
	* ) echo "Unsupported option, try again."
	exit 1
	;;
esac
exit 0
