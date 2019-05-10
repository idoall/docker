FROM golang:1.12.4
MAINTAINER lion <lion.888@gmail.com>

# Install golint
RUN go get -u golang.org/x/lint/golint

# # install docker
RUN curl -O https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
    && tar zxvf docker-latest.tgz \
    && cp docker/docker /usr/local/bin/ \
    && rm -rf docker docker-latest.tgz

# # install expect
RUN apt-get update && apt-get -y install tcl tk expect && apt-get -y clean && rm -rf /var/lib/apt/lists/*

COPY files /