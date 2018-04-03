FROM debian:stretch

WORKDIR /app

RUN adduser keybase
RUN apt-get -qq update \
 && apt-get -qq -y install curl fuse libappindicator-dev expect \
 && curl -O https://prerelease.keybase.io/keybase_amd64.deb
RUN dpkg -i keybase_amd64.deb; exit 0
RUN apt-get install -fy

USER keybase
RUN run_keybase

USER root
COPY ./keybaseconfig/* /home/keybase/.config/keybase/
COPY keybase-login.sh /app
RUN chown -R keybase:keybase /home/keybase/.config/keybase
RUN chown -R keybase:keybase /app
RUN chmod +x /app/keybase-login.sh

USER keybase