FROM php:7.4-cli

RUN apt-get update && \
    apt-get install -y libffi-dev \
    && docker-php-ext-configure ffi --with-ffi \
    && docker-php-ext-install ffi

# Load custom query module.
RUN echo 'extension=/usr/src/myapp/example/php/query.so' >> /usr/local/etc/php/conf.d/query.ini