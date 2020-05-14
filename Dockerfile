FROM lsiobase/alpine.python3:3.9

ENV PUID=1000
ENV PGID=1000

EXPOSE 9666

RUN \
    apk update && \
    apk add --no-cache \
    gcc \
    g++ \
    libffi-dev \
    python3-dev \
    make


RUN \
    mkdir /deem && \
    chown abc:abc /deem && \
    rm -R /config && \
    ln -sf /deem/.config/deemix /config && \
    ln -sf /downloads /deem/deemix\ Music

COPY root/ /

VOLUME /downloads /config
