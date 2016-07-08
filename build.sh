#!/bin/bash
cd /tmp/ \
&& apt update \
&& apt install -y git curl \
&& php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
&& php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) . PHP_EOL === file_get_contents('https://composer.github.io/installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
&& php composer-setup.php \
&& php -r "unlink('composer-setup.php');" \
&& mv composer.phar /usr/local/bin/composer \
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
