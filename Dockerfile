FROM  alpine

ENV FILE_PREFIX default
ENV CRON_EXPL "* * * * *"
ENV TIME_ZONE Asia/Shanghai

RUN apk update && apk add rsync tzdata

#time zone setting
RUN echo "${TIME_ZONE}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime


COPY compress.sh /run.sh

CMD sh -c "echo \"${CRON_EXPL}  sh /run.sh \" | crontab - && crond -f -L /dev/stdout"