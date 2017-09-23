
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
docker build -t idoall/ubuntu16.04-golang1.9-revel .


# Run
docker run -it \
--rm \
--name golang-revel \
-p 9000:9000 \
idoall/ubuntu16.04-golang1.9-revel

# Open http://localhost:9000 in your browser and you should see "It works!"


# access the contain
docker exec -it golang-revel /bin/bash
```



================



# About Revel Framework

[![Build Status](https://secure.travis-ci.org/revel/revel.svg?branch=master)](http://travis-ci.org/revel/revel)  [![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A high productivity, full-stack web framework for the [Go language](http://www.golang.org).

Current Version: 0.17.1 (2017-07-14)

**As of Revel 0.15.0, Go 1.6+ is required.**

## URL

https://github.com/revel/revel


