# directory-auto-compressor

## what is it?

`directory-auto-compressor` is a useful tool for compressing the specific directory automatic. It will try to 
check if  the `/src` directory has changed from last time (rsync works). If changed , the `/src` will be compressed as 
as  `xxx.tar.gz` file into the `/output` directory.  The timer (crontab) is running every minute by default.




## build 
```bash
docker build -t zhouzhipeng/directory-auto-compressor .

```

## run it

```bash

# optional 
docker rm -f compressor-test

docker run -d --name compressor-test \
    -e FILE_PREFIX=test \
    -e CRON_EXPL="* * * * *" \
    -v ~/test:/src \
    -v ~/output:/output \
    zhouzhipeng/directory-auto-compressor
```