
jenkins
=============


The leading open source automation server


## Jenkins Continuous Integration and Delivery server.

This is a fully functional Jenkins server, based on the weekly and LTS releases .

![img](http://jenkins-ci.org/sites/default/files/jenkins_logo.png)

- To use the latest LTS: `docker pull idoall/jenkins:<tag>`
- To use the latest weekly: `docker pull jenkins/jenkins`
- Lighter alpine based image also available

Read [documentation](https://github.com/jenkinsci/docker/blob/master/README.md) for usage


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd jenkins/<tag>

# hack hack hack

# Build
docker build -t idoall/jenkins:<tag> .

# Run After running, wait for 1 minutes.
# Open http://localhost/ in your browser
docker run -d \
--name=mshk_jenkins \
-p 8080:8080 -p 50000:50000 \
idoall/jenkins:<tag>

# access the contain
docker exec -it mshk_jenkins /bin/bash
```


## Where is the data stored?

This will store the workspace in /var/jenkins_home. All Jenkins data lives in there - including plugins and configuration. You will probably want to make that an explicit volume so you can manage it and attach to another container for upgrades :

| Local location       | Container location | Usage                                      |
| -------------------- | ------------------ | ------------------------------------------ |
| `/srv/home`   | `/var/jenkins_home`  | For storing application data               |


## Backing up data

If you bind mount in a volume - you can simply back up that directory (which is jenkins_home) at any time.

This is highly recommended. Treat the jenkins_home directory as you would a database - in Docker you would generally put a database on a volume.

If your volume is inside a container - you can use `docker cp $ID:/var/jenkins_home` command to extract the data, or other options to find where the volume data is. Note that some symlinks on some OSes may be converted to copies (this can confuse jenkins with lastStableBuild links etc)

# Setting the number of executors

You can specify and set the number of executors of your Jenkins master instance using a groovy script. By default its set to 2 executors, but you can extend the image and change it to your desired number of executors :

```
executors.groovy
import jenkins.model.*
Jenkins.instance.setNumExecutors(5)
```

and `Dockerfile`

```
FROM jenkins/jenkins:lts
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
```

