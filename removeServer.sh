#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# Set the server name in here
servername="RU"

### DON'T MODIFY THE REST ###

# server list calc
serverlistpath=$(pwd)/servers
servernumber=""
if [ -f $serverlistpath ]
then
	servernumber=$(wc -l servers | awk '{ print $1 }')
else
	echo "Nothing to remove."
	exit
fi

servername="${servername}${servernumber}"

# delete files
serverconfigpath=$(pwd)/lgsm/config-lgsm/inssserver

rm $serverconfigpath/$servername.cfg
rm $serverconfigpath/secrets-$servername.cfg
rm $(pwd)/$servername

if [ $servernumber == 1 ]
then
	rm $serverlistpath
else
	sed -i "/$servername/d" $serverlistpath
fi

echo "Successfully removed server ${servername}."