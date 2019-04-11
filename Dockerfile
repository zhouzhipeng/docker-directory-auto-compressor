FROM  alpine

ENV FILE_PREFIX=default

RUN apk update && apk add rsync

COPY compress.sh /compress.sh

CMD sh -c "echo \"* * * * *  sh /compress.sh \" | crontab - && crond -f -L /dev/stdout"