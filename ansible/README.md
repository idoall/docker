# 目录

[TOC]

# Docker-Centos6.8-supervisor-ansible2.3.0.0-1


This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/nsupervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ansible

# hack hack hack

# build
docker build -t idoall/ansible .

# run
docker run -d \
--name ansible \
--hostname ansible \
idoall/ansible

# Then setup dokuwiki using installer at URL http://localhost/install.php


# access container
docker exec -it ansible /bin/bash

# test ansible
ansible -i /etc/ansible/hosts local -m command -a uptime
ansible local -m command -a uptime
ansible local -a uptime
```


## Where is the data stored? 

The JIRA container uses host mounted volumes to store persistent data:

| Local location            | Container location |
| ------------------------- | ------------------ |
| `/srv/jira/dokuwiki_folder` | `/home/work/_app/nginx/html`   |

You can fine tune these directories to meet your requirements.