# whoami

Simple HTTP docker service that prints it's container ID

### Usage on single node (without Docker Swarm mode)

```
$ docker run -d -p 80:80 --name whoami -t idoall/whoami
4ad37f141b8cd198b9832d59a7c6ef133c87dc0aa4d7c1f7d561af84213863d0
    
$ curl localhost
[mshk.top]I'm 4ad37f141b8c
```

### Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd whoami

# hack hack hack

# build
docker build -t idoall/whoami .

# run
docker run -d -p 80:80 --name whoami -t idoall/whoami


# Open http://localhost/ in your browser
```