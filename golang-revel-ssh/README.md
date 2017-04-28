
golang1.7.4-revel0.13-ssh
=============


This repository contains the sources for the following base images:
- [`idoall/supervisor`](https://hub.docker.com/r/idoall/supervisor/)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang-revel-ssh

# hack hack hack

# build
docker build -t idoall/golang-revel-ssh .

# Run
docker run -d \
--name golang \
--hostname golang \
-p 80:80 \
-p 2222:22 \
idoall/golang-revel-ssh

# Open http://localhost in your browser and you should see "It works!"

# ssh  user:work   password:123456
ssh work@<your ip> -p 2222
```
