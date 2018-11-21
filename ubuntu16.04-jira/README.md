ubuntu16.04-jira
=============

This repository contains the sources for the following [docker](https://docker.io) base images:

- [`idoall/ubuntu:16.04`](https://hub.docker.com/r/idoall/ubuntu/)



# Supported tags and respective `Dockerfile` links

- [`7.2.7`(*7.2.7/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-jira/7.2.7/Dockerfile)



## Developing

```bash

# run mysql
docker run -d \
    --name=mysql-db \
    --hostname=mysql-db \
    -p 20010:3306 \
    -e MYSQL_ROOT_PASSWORD=123456 \
    -e MYSQL_DATABASE=jira \
    -e MYSQL_USER=jira \
    -e MYSQL_PASSWORD=jira \
    idoall/mysql:5.7

# run
docker run -d \
--name jira \
--hostname jira \
--link mysql-db:mysql \
-p 20011:8085 \
-p 20012:8080 \
-p 20013:8443 \
-p 20014:8090 \
-p 20015:22 \
idoall/ubuntu16.04-jira:<version>


# For the first time, initialize the program, please wait
# Open http://localhost:20012 in your browser and you should see


# access the contain
docker exec -it jira /bin/bash

```


## Where is the data stored? 

The JIRA container uses host mounted volumes to store persistent data:

| Local location            | Container location |
| ------------------------- | ------------------ |
| `/srv/jira/opt_atlassian` | `/opt/atlassian`   |
| `/srv/jira/var_atlassian` | `/var/atlassian`   |

You can fine tune these directories to meet your requirements.

