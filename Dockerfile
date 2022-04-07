FROM alpine:edge
RUN apk add --no-cache make gcc-arm-none-eabi
WORKDIR /home

