# ExpressVPN in a container


 ExpressVPN:3.19


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd expressvpn/3.19

# hack hack hack

# build
docker build -t idoall/expressvpn:3.19 .
```

`

## Prerequisites

1. Get your activation code from ExpressVPN web site.

## Download

`docker pull idoall/expressvpn:3.19`

## Start the container

    docker run \
      --env=ACTIVATION_CODE={% your-activation-code %} \
      --env=SERVER={% LOCATION/ALIAS/COUNTRY %} \
      --env=PREFERRED_PROTOCOL={% protocol %} \
      --env=LIGHTWAY_CIPHER={% lightway-cipher %} \
      --cap-add=NET_ADMIN \
      --device=/dev/net/tun \
      --privileged \
      --detach=true \
      --tty=true \
      --name=expressvpn \
      idoall/expressvpn:3.19 \
      /bin/bash


## Docker Compose
Other containers can use the network of the expressvpn container by declaring the entry `network_mode: service:expressvpn`.
In this case all traffic is routed via the vpn container. To reach the other containers locally the port forwarding must be done in the vpn container (the network mode service does not allow a port configuration)

  ```
  expressvpn:
    container_name: expressvpn
    image: idoall/expressvpn:3.19
    environment:
      - ACTIVATION_CODE={% your-activation-code %}
      - SERVER={% LOCATION/ALIAS/COUNTRY %}
      - PREFERRED_PROTOCOL={% protocol %}
      - LIGHTWAY_CIPHER={% lightway-cipher %}
    cap_add:
      - NET_ADMIN
    devices: 
      - /dev/net/tun
    stdin_open: true
    tty: true
    command: /bin/bash
    privileged: true
    restart: unless-stopped
    ports:
      # ports of other containers that use the vpn (to access them locally)
  
  downloader:
    image: example/downloader
    container_name: downloader
    network_mode: service:expressvpn
    depends_on:
      - expressvpn
  ```

## Configuration Reference

### ACTIVATION_CODE
A mandatory string containing your ExpressVPN activation code.

`ACTIVATION_CODE=ABCD1EFGH2IJKL3MNOP4QRS`

### SERVER
A optional string containing the ExpressVPN server LOCATION/ALIAS/COUNTRY. Connect to smart location if it is not set.

`SERVER=ukbe`

### PREFERRED_PROTOCOL
A optional string containing the ExpressVPN protocol. Can be auto, udp, tcp ,lightway_udp, lightway_tcp. Use auto if it is not set.

`PREFERRED_PROTOCOL=lightway_udp`

### LIGHTWAY_CIPHER
A optional string containing the ExpressVPN lightway cipher. Can be auto, aes, chacha20. Use auto if it is not set.

`LIGHTWAY_CIPHER=chacha20`
