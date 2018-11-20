
ubuntu16.04-jdk10-confluence6.12.2
=============


This repository contains the sources for the following [idoall/ubuntu16.04-jdk:10](https://hub.docker.com/r/idoall/ubuntu16.04-jdk) base images:
- [`ubuntu16.04-jdk10-confluence`](https://hub.docker.com/r/idoall/ubuntu16.04-jdk10-confluence/)

## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd gitlab-ce/9.3.6-ce.0

# hack hack hack

# Build
docker build -t idoall/gitlab-ce:9.3.6-ce.0 .

# Run rm
docker run -it --name=mshk_gitlab --rm -p 80:80 idoall/gitlab-ce:9.3.6-ce.0

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_gitlab -p 80:80 idoall/gitlab-ce:9.3.6-ce.0

# access the contain
docker exec -it mshk_gitlab /bin/bash
```
# Using docker stack deploy service to create APP


# Troubleshooting

## 500 Internal Error
When updating the Docker image you may encounter an issue where all paths display the infamous 500 page. If this occurs, try to run `sudo docker restart` gitlab to restart the container and rectify the issue.

## Permission problems
When updating from older GitLab Docker images you might encounter permission problems. This happens due to a fact that users in previous images were not preserved correctly. There’s script that fixes permissions for all files.

To fix your container, simply execute `update-permissions` and restart the container afterwards:
```bash
sudo docker exec mshk_gitlab update-permissions
sudo docker restart mshk_gitlab
```

## Linux ACL issues
If these are not correct, set them with: 
```bash
$ sudo setfacl -mR default:group:docker:rwx /srv/gitlab
```
