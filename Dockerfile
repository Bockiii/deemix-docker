FROM lsiobase/alpine.python3:3.9

ENV PUID=1000
ENV PGID=1000

EXPOSE 33333

RUN \
    apk update && \
    apk add --no-cache \
    gcc \
    g++ \
    make \
    wget \
    unzip 

RUN \
    wget https://notabug.org/RemixDev/deemix/archive/master.zip && \
    unzip master.zip && \
    rm master.zip && \
    mkdir /deem && \
    chown abc:abc /deem && \
    rm -R /config && \
    ln -sf /deem/.config/deemix /config && \
    ln -sf /downloads /deem/deemix\ Music

WORKDIR /deemix

RUN \
    pip3 install -r requirements.txt

COPY root/ /

VOLUME /downloads /config
