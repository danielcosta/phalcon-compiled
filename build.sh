#!/bin/sh
cd /tmp \
&& curl -o phalcon.zip https://github.com/phalcon/cphalcon/archive/3.0.0.tar.gz
apk add --no-cache git bash re2c build-base autoconf pcre-dev \
&& cd /usr/local/lib/ \
&& git clone --branch 3.0.x --depth=1 https://github.com/phalcon/cphalcon.git /usr/local/lib/cphalcon \
&& cd /usr/local/lib/cphalcon/build \
&& ./install \
&& echo "extension=phalcon.so" >> /usr/local/etc/php/conf.d/40-phalcon.ini \
&& cp /usr/local/lib/php/extensions/no-debug-non-zts-20151012/phalcon.so /data
