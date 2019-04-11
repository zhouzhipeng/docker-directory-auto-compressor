#!/bin/sh


mkdir  -p  /src /copy /output

changed=$(rsync -a --info=progress2  /src/ /copy  | awk '{print $1}')


if [ $changed = '0' ]; then
# nothing changed
	echo "auto-compressor: nothing changed"
else
	echo "auto-compressor: something changed"
    # compress /copy to /output
    tar -czf /output/${FILE_PREFIX}-`date  +%Y%m%d%H%M`.tar.gz -C /copy ./

fi