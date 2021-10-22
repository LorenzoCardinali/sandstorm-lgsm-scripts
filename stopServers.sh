#!/bin/bash
  ###### ######## ####### #######  ###  #######
###           ##       ##      ## ###         
###      #######  ######  ###  ## ###  #######
###      ###  ##  ##  ##  ###  ## ###  ##     
 ######  ###  ##  ##   ## ######  ###  ##       

serversfile=$(pwd)/servers

if ! [ -f $serversfile ]
then
	echo Missing servers list file
	exit
fi

while read server_name
do
	$(pwd)/$server_name stop
done < $serversfile