#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

SERVER_PATH="/home/inssserver/Server"
serversfile=$SERVER_PATH/servers

if ! [ -f $serversfile ]
then
	echo "Missing servers list file."
	exit
fi

while read server_name
do
	$SERVER_PATH/$server_name stop
	$SERVER_PATH/$server_name update
	$SERVER_PATH/$server_name start
done < $serversfile

echo "Restarted servers at: $(date)" >> restartlog.txt