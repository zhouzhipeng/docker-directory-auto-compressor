FROM  alpine

ENV FILE_PREFIX=default
ENV CRON_EXPL="* * * * *"

RUN apk update && apk add rsync

COPY compress.sh /run.sh

CMD sh -c "echo \"${CRON_EXPL}  sh /run.sh \" | crontab - && crond -f -L /dev/stdout"