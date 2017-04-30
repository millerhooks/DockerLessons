FROM nginx:1.12.0-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh openssl

RUN git clone https://github.com/ruanyf/react-demos && mv react-demos /usr/share/nginx/html/
RUN cd /tmp && git clone https://github.com/paulczar/omgwtfssl.git certs
RUN apk del git openssh

COPY conf/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY conf/nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /home/src/app
RUN cd /usr/share/nginx/html/ && ln -s /home/src/app .

WORKDIR /home/src

RUN cd /tmp/certs && bash generate-certs
EXPOSE 80 443