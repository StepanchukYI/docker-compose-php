FROM composer:2

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system www-root
RUN adduser -G www-root --system -D -s /bin/sh -u ${UID} www-root

RUN mkdir -p /var/www/html

RUN chown www-root:www-root /var/www/html

WORKDIR /var/www/html
