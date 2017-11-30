FROM nginx:alpine

COPY ./dist /usr/share/nginx/html
COPY ./nginx /etc/nginx/conf.d

RUN apk add --update bash

CMD /bin/bash -c "[ -e /etc/certs/live/jsdaddy.tech/fullchain.pem ] && rm /etc/nginx/conf.d/jsdaddy.conf || rm /etc/nginx/conf.d/jsdaddy.ssl.conf; nginx -g 'daemon off;'"
