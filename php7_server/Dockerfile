FROM ubuntu:16.04

ENV ACCEPT_EULA=Y
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get update -y

RUN apt-get install -y \
    apt-transport-https \
    cron \
    curl \
    git \
    gnupg2 \
    libpq-dev \
    unzip \
    vim \
    apache2

# RUN add-apt-repository -y -u ppa:ondrej/php 
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update && apt-get install -y \
    php7.3 \
    php7.3-dev \
    php7.3-cli \
    php7.3-mbstring \
    php7.3-intl \
    php7.3-ldap \
    php7.3-pgsql \
    php7.3-soap \
    php7.3-curl \
    php-pear \
    php-xml \
    php7.3-xml \
    libapache2-mod-php7.3

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update && apt-get install -y \
    msodbcsql17 \
    mssql-tools \
    unixodbc-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install PDO_SQLSRV
RUN pecl install sqlsrv
RUN pecl install pdo_sqlsrv
RUN echo "extension=pdo_sqlsrv.so" >> /etc/php/7.3/mods-available/pdo_sqlsrv.ini
RUN echo "extension=sqlsrv.so" >> /etc/php/7.3/mods-available/sqlsrv.ini
RUN phpenmod pdo_sqlsrv
RUN phpenmod sqlsrv
RUN service apache2 restart

# Install necessary locales
RUN echo "America/Recife" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen pt_BR.UTF-8
RUN dpkg-reconfigure --frontend=noninteractive locales
RUN update-locale LANG=pt_BR.UTF-8
ENV LC_ALL=pt_BR.UTF-8
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR.UTF-8

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# XDebug Install
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/lib/php/ -name xdebug.so)" > /etc/php/7.3/mods-available/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /etc/php/7.3/mods-available/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /etc/php/7.3/mods-available/xdebug.ini

RUN cp /etc/php/7.3/mods-available/xdebug.ini /etc/php/7.3/cli/conf.d/. \
    && cp /etc/php/7.3/mods-available/xdebug.ini /etc/php/7.3/apache2/conf.d/.

COPY entrypoint.sh /
EXPOSE 22 80
CMD ["/entrypoint.sh"]

