FROM nginx:stable-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system www-root
RUN adduser -G www-root --system -D -s /bin/sh -u ${UID} www-root

RUN sed -i "s/user  nginx/user www-root/g" /etc/nginx/nginx.conf

ADD ./nginx/default.conf /etc/nginx/conf.d/

RUN mkdir -p /var/www/html

RUN chown www-root:www-root /var/www/html