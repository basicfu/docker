FROM alpine
COPY frps /frps
COPY frps.ini /frps.ini
WORKDIR /
CMD ["/frps","-c","frps.ini"]