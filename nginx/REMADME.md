# Docker-Centos6.8-Tengine/2.2.0 (nginx/1.8.1)


This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd nginx

# hack hack hack

# build
docker build -t idoall/nginx .

# run
docker run -d \
--name nginx \
--hostname nginx \
-p 8080:80 \
idoall/nginx

# Open http://localhost:8080 in your browser and you should see "Welcome to tengine!"

# view version
docker exec -it nginx /home/work/_app/nginx/sbin/nginx -v

```

# complex configuration
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /my/nginx.conf:/home/work/_app/nginx/conf/nignx.conf
-p 8080:80 \
idoall/nginx
```


# hosting some simple static content
```bash
docker run -d \
--name nginx \
--hostname nginx \
-v /some/content:/home/work/_app/nginx/html
-p 8080:80 \
idoall/nginx
```

