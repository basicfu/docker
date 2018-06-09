FROM alpine
RUN apk update \
    && apk add nodejs \
    && npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && cnpm -v
