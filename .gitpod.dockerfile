# Gitpod docker image for Prestashop | https://github.com/PasLoin/gitpod-prestashop
# License: MIT (c) 2021 By PasLoin Inspired from :  Luiz Paulo "Bills"
# Version: 0.1
FROM gitpod/workspace-mysql

### General Settings ###
ARG DEBIAN_FRONTEND=noninteractive
ENV PHP_VERSION="7.4"
ENV APACHE_DOCROOT="public_html"

### Setups, Node, NPM ###
USER gitpod
### WIP don't think it's mandatory to clone the repo ###
RUN git clone https://github.com/PasLoin/gitpod-prestashop $HOME/gitpod-prestashop && \
    cat $HOME/gitpod-prestashop/conf/.bashrc.sh >> $HOME/.bashrc && \
    . $HOME/.bashrc && \
    bash -c ". .nvm/nvm.sh && nvm install --lts"

### MailHog ###
USER root
RUN go get github.com/mailhog/MailHog && \
    go get github.com/mailhog/mhsendmail && \
    cp $GOPATH/bin/MailHog /usr/local/bin/mailhog && \
    cp $GOPATH/bin/mhsendmail /usr/local/bin/mhsendmail && \
    ln $GOPATH/bin/mhsendmail /usr/sbin/sendmail && \
    ln $GOPATH/bin/mhsendmail /usr/bin/mail &&\
    ### Apache ###
    apt-get -y install apache2 && \
    chown -R gitpod:gitpod /var/run/apache2 /var/lock/apache2 /var/log/apache2 && \
    echo "include ${HOME}/gitpod-prestashop/conf/apache.conf" > /etc/apache2/apache2.conf && \
    echo ". ${HOME}/gitpod-prestashop/conf/apache.env.sh" > /etc/apache2/envvars && \
    ### PHP ###
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get -qy install \
        libapache2-mod-php \
        php${PHP_VERSION} \
        php${PHP_VERSION}-common \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-intl \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-json \
        php${PHP_VERSION}-zip \
        php${PHP_VERSION}-soap \
        php${PHP_VERSION}-bcmath \
        php${PHP_VERSION}-opcache \
        php-xdebug && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* && \
    cat /home/gitpod/gitpod-prestashop/conf/php.ini >> /etc/php/${PHP_VERSION}/apache2/php.ini && \
    a2dismod php* && \
    a2dismod mpm_* && \
    a2enmod mpm_prefork && \
    a2enmod php${PHP_VERSION} 

### Prestashop ###
USER root

### WIP at the moment Prestashop install will be perform by task command in .gitpod.yml ###

### Adminer ###
RUN mkdir $GITPOD_REPO_ROOT/database/ \
    && wget -q https://github.com/vrana/adminer/releases/download/v4.7.4/adminer-4.7.4-mysql.php \
        -O $GITPOD_REPO_ROOT/database/index.php \
    && mkdir $GITPOD_REPO_ROOT/phpinfo/ \
    && echo "<?php phpinfo(); ?>" > $GITPOD_REPO_ROOT/phpinfo/index.php


### ###
