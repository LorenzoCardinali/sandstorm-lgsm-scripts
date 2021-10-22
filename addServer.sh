#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# Set the server name in here
servername=""

### DON'T MODIFY THE REST ###

# check files
serverlistpath=$(pwd)/servers
basicconfigpath=$(pwd)/basic.cfg
basicexecpath=$(pwd)/inssserver
lgsmpath=$(pwd)/lgsm/config-lgsm/inssserver

if [ ! -f $basicconfigpath ]||[ ! -f $basicexecpath ]||[ ! -f $lgsmpath ]
then
	echo "Files missing."
	exit
fi

# server list calc
servernumber=""
if [ -f $serverlistpath ]
then
	servernumber=$(wc -l servers | awk '{ print $1 + 1}')
else
	touch servers
	servernumber=1
fi

# ports calc
port=$((27102 + $servernumber - 1))
queryport=$((27131 + $servernumber - 1))
rconport=$((27064 + $servernumber - 1))

# make directory
filename=$servername$servernumber

cp $basicconfigpath $lgsmpath/$filename.cfg
cp $basicexecpath $(pwd)/$filename

sed -i "s/data1/$port/" $lgsmpath/$filename.cfg
sed -i "s/data2/$queryport/" $lgsmpath/$filename.cfg
sed -i "s/data3/$rconport/" $lgsmpath/$filename.cfg
sed -i "s/data4/$servername-$servernumber/" $lgsmpath/$filename.cfg

echo $filename >> servers

echo "Server ${servername}-${servernumber} created!"