#!/bin/sh


mkdir  -p  /src /copy /output

changed=$(rsync -a --info=progress2  /src/ /copy  | awk '{print $1}')

time_now=`date`

if [ $changed = '0' ]; then
# nothing changed
	echo "auto-compressor: nothing changed, time is ${time_now}"
else
	echo "auto-compressor: something changed, time is ${time_now}"
    # compress /copy to /output
    tar -czf /output/${FILE_PREFIX}-`date  +%Y%m%d%H%M`.tar.gz -C /copy ./

    echo "auto-compressor: generated a tar ball in /output"

fi