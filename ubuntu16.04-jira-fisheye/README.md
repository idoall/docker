
ubuntu16.04-jira-fisheye
=============

This repository contains the sources for the following [idoall/ubuntu:16.04](https://hub.docker.com/r/idoall/ubuntu/) base images:
- [`ubuntu16.04-jira-fisheye:4.6.1`(*4.6.1/Dockerfile*)](https://github.com/idoall/docker/blob/master/ubuntu16.04-jira-fisheye/4.6.1/Dockerfile)



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-fisheye/<tag>

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira-fisheye:<tag> .

# Run rm
docker run -it --name=mshk_fisheye --rm -p 80:8060 idoall/ubuntu16.04-jira-fisheye:<tag>

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_fisheye -p 80:8060 idoall/ubuntu16.04-jira-fisheye:<tag>

# access the contain
docker exec -it mshk_fisheye /bin/bash
```

## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Fisheye/Home directory`   | `/home/work/_data/_jira_fisheye`  | For storing application data               |

