FROM ubuntu:bionic

RUN apt update && \
  apt install -y software-properties-common && \
  add-apt-repository universe && \
  apt update && \
  apt install -y openfortivpn ppp

VOLUME ["/etc/openfortivpn"]

ENTRYPOINT [ "/usr/bin/openfortivpn", "-c", "/etc/openfortivpn/config" ]