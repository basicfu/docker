FROM alpine
RUN apk update && apk add tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY frps /frps
COPY frps.ini /frps.ini
WORKDIR /
CMD ["/frps","-c","frps.ini"]
