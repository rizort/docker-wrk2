FROM alpine:3.20 AS builder

RUN apk add --no-cache \
    build-base \
    git \
    openssl-dev \
    zlib-dev

RUN git clone https://github.com/giltene/wrk2.git \
 && cd wrk2 \
 && make

# image

FROM alpine:3.20

RUN apk add --no-cache \
    libstdc++ \
    openssl \
    zlib

WORKDIR /wrk2
COPY --from=builder /wrk2/wrk .

ENTRYPOINT ["./wrk"]