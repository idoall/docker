# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)-PHP5.6.29


This repository contains the sources for the following base images:
- [`idoall/nginx`](https://hub.docker.com/r/idoall/nginx/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd php

# hack hack hack

# build
docker build -t idoall/php .

# run
docker run -d \
--name php \
--hostname php \
-p 8080:80 \
idoall/php

# Open http://localhost:8080/index.php in your browser and you should see "Welcome to tengine!"

# view version
docker exec -it php php -v

```

# complex configuration
```bash
docker run -d \
--name php \
--hostname php \
-v /my/nginx.conf:/home/work/_app/nginx/conf/nignx.conf
-p 8080:80 \
idoall/php
```


