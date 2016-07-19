#!/bin/sh
apk add --no-cache git bash re2c build-base autoconf pcre-dev \
&& cd /usr/local/lib/ \
&& git clone --depth=1 https://github.com/phalcon/zephir.git \
&& cd /usr/local/lib/zephir \
&& ./install-nosudo -c \
&& git clone --branch 2.1.x --depth=1 https://github.com/phalcon/cphalcon.git /usr/local/lib/cphalcon \
&& cd /usr/local/lib/cphalcon \
&& /usr/local/lib/zephir/bin/zephir fullclean \
&& /usr/local/lib/zephir/bin/zephir build —backend=ZendEngine3 \
&& echo "extension=phalcon.so" >> /usr/local/etc/php/conf.d/40-phalcon.ini \
&& cp /usr/local/lib/cphalcon/ext/modules/phalcon.so /data
