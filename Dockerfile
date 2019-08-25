FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  apt update && \
  apt install -y \
    apt-transport-https \
    build-essential \
    ca-certificates \
    ruby-dev \
    wget && \
  wget -O /usr/share/keyrings/red-data-tools-keyring.gpg \
    https://packages.red-data-tools.org/ubuntu/red-data-tools-keyring.gpg && \
  echo "deb [signed-by=/usr/share/keyrings/red-data-tools-keyring.gpg] https://packages.red-data-tools.org/ubuntu/ bionic universe" > \
    /etc/apt/sources.list.d/red-data-tools.list && \
  apt update && \
  gem install \
    bundler \
    rake

RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
