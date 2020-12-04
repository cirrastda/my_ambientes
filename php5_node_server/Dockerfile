# escape=\
FROM ubuntu:12.04

ENV ACCEPT_EULA=Y
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN apt-get install -y software-properties-common python-software-properties

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

RUN apt-get update && apt-get install -y \
    php5 \
    php5-ldap \
    php5-gd \
    php5-curl \
    php5-mysql \
    php5-sybase \
    php5-pgsql \
    php-pear \
    dos2unix \
    zend-framework

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y \
    build-essential \
    checkinstall \
    libssl-dev

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

RUN apt-get update && apt-get install -y \
    nodejs \
    npm

# install necessary locales
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

# Seting up Resolv
# COPY ./etc/resolv/resolv.conf /etc/

COPY entrypoint.sh /
EXPOSE 80
CMD ["/entrypoint.sh"]
