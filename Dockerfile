FROM alpine as builder

RUN apk upgrade --no-cache && apk add --no-cache apk-tools \
    musl \
    libcrypto1.1 \
    libssl1.1 \
    ca-certificates-cacert \
    musl-utils \
    libconfig-dev \
    libevent-dev \
    jansson-dev \
    ncurses-terminfo-base \
    ncurses-libs \
    readline-dev \
    libressl-dev \
    python-dev \
    python3-dev \
    libgcrypt-dev \
    zlib-dev \
    lua-lgi \
    make \
    git \
    g++ \
    lua-dev && \
    git clone --recursive https://github.com/kenorb-contrib/tg.git && \
    cd tg && \
    ./configure && make

FROM alpine

VOLUME [ "/volumes/config", "/volumes/downloads" ]

RUN touch /config.conf && \
    apk add --no-cache libcrypto1.1 \
    libconfig \
    libevent \
    libressl \
    lua \
    jansson \
    readline

COPY --from=builder /tg/bin/telegram-cli /usr/bin/telegram-cli
COPY script.lua /script.lua
COPY config.conf /config.conf
COPY run.sh /run.sh

CMD ["/run.sh"]