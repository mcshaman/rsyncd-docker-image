FROM ubuntu

RUN apt update -y  \
	&& apt upgrade -y \
	&& apt install rsync -y \
	&& apt autoremove

COPY rsyncd.* /etc/

VOLUME /share
EXPOSE 873

CMD rsync --daemon --no-detach --log-file /dev/stdout