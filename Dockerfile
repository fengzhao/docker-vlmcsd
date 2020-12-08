FROM alpine:latest as builder
LABEL maintainer="fengzhao  <fengzhao1124@163.com>" 
WORKDIR /root
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd vlmcsd && \
    make

FROM alpine:latest
COPY --from=builder /root/vlmcsd/bin/vlmcsd /vlmcsd
RUN apk add --no-cache tzdata

EXPOSE 1688/tcp

CMD ["/vlmcsd", "-D", "-d", "-t", "3", "-e", "-v"]

