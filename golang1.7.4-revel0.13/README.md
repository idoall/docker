
# docker-golang1.7.4-revel0.13


This repository contains the sources for the following [docker](https://docker.io) base images:
- [`idoall/golang-revel/`](https://hub.docker.com/r/idoall/golang-revel//)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang1.7.4-revel0.13

# hack hack hack

# Build
docker build -t idoall/golang-revel .

# create overlay network
# 为新创建的 docker-net 指定10.0.9.0网段，也可以不指定网段
docker network create --subnet=10.0.9.0/24 --driver overlay idoall-org

# Run
docker service create \
--network idoall-org \
--name golang-revel \
-p 9000:9000 \
idoall/golang-revel

# Open http://localhost:9000 in your browser and you should see "It works!"
```



================



# About Revel Framework

[![Build Status](https://secure.travis-ci.org/revel/revel.svg?branch=master)](http://travis-ci.org/revel/revel)  [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A high productivity, full-stack web framework for the [Go language](http://www.golang.org).

Current Version: 0.13.1 (2016-06-06)

**As of Revel 0.13.0, Go 1.4+ is required.**

## URL

https://github.com/revel/revel



================

# 2.1

## New Features

- Add zoneinfo folder，Set TimeZone as `Asia/Shanghai`

# 2.0

## New Features

- Add supervisor and demo