Rename `example.env` to `.env` and set the environment variables.

```
FTP_HOST=ftp.example.com
FTP_USER=user
FTP_PASS=password
FTP_SOURCE=/
FTP_TARGET=/sync
```

To use LFTP over SSH:

```
FTP_HOST=sftp://ftp.example.com
```

Update `crontab` to set the required frequency. The default value runs the sync every hour. Check the https://crontab.guru to explore more options.

```
0 * * * * /bin/sh /mirror.sh > /proc/1/fd/1 2>/proc/1/fd/2
```

### Run as a service

```
docker-compose build
```

```
docker-compose up -d
```

### Run sync manually

```
FTP_HOST=ftp.example.com FTP_USER=user FTP_PASS=password FTP_SOURCE=/ FTP_TARGET=./sync ./mirror.sh
```

### Test

```
lftp -e "
set ssl:verify-certificate no;
set sftp:auto-confirm yes;
open sftp://ftp.example.com;
user user password;
ls -l;
bye;
"
```

Check the https://lftp.yar.ru/lftp-man.html to explore more options.
