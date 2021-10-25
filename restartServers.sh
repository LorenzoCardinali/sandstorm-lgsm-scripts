#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

# path of the server folder
SERVER_PATH="/home/inssserver/Server"

## DO NOT TOUCH ANYTHING BELOW THIS LINE! ##

serversfile=$SERVER_PATH/servers

if ! [ -f $serversfile ]
then
	echo "missing servers list: $(date)" >> $SERVER_PATH/restartlog.txt
	exit
fi

while read server_name
do
	$SERVER_PATH/$server_name stop
	$SERVER_PATH/$server_name update
	$SERVER_PATH/$server_name start
done < $serversfile

echo "restarted servers at: $(date)" >> $SERVER_PATH/restartlog.txt