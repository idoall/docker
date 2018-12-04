
ubuntu16.04-jira-bamboo:6.7.1
=============



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd ubuntu16.04-jira-fisheye/4.6.1

# hack hack hack

# Build
docker build -t idoall/ubuntu16.04-jira-fisheye:4.6.1 .

# Run rm
docker run -it --name=mshk_fisheye --rm -p 80:8060 idoall/ubuntu16.04-jira-fisheye:4.6.1

# After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d --name=mshk_fisheye -p 80:8060 idoall/ubuntu16.04-jira-fisheye:4.6.1

# access the contain
docker exec -it mshk_fisheye /bin/bash
```



## Where is the data stored?

The container uses host mounted volumes to store persistent data:
| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/Fisheye/Home directory`   | `/home/work/_data/_jira_fisheye`  | For storing application data               |



# Related Articles

[Docker 创建 Crucible4.6.1 以及与 Crowd3.3.2 实现 SSO 单点登录](https://mshk.top/2018/12/docker-crucible-crowd-sso/)