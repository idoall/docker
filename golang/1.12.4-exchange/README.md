golang:1.12.4-exchange
=============

## Developing



```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd golang/1.12.4-exchange

# hack hack hack

# Build
docker build -t idoall/golang:1.12.4-exchange .

# run
docker run -it \
--rm \
--name golang \
--hostname golang \
idoall/golang:1.12.4-exchange \
go version
```
