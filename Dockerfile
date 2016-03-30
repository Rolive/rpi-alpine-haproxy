FROM hypriot/rpi-alpine-scratch

MAINTAINER Drakaka <DrakeriNproduction@gmail.com>

RUN apk update \
    && apk upgrade \
    && apk add haproxy \
    && rm -rf /var/cache/apk/*


ADD start-haproxy.sh /start-haproxy.sh

RUN mkdir /tmp/conf_override

VOLUME ["/tmp/conf_override"]

WORKDIR /etc/haproxy

EXPOSE 80 443

CMD ["/bin/sh", "/start-haproxy.sh"] 
