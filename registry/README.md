# docker-registry2.5.1
为了便于使用，将默认端口从5000改为80

This repository contains the sources for the following base images:
- [`registry:2.5.1`](https://hub.docker.com/_/registry/)


## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd registry

# hack hack hack

# build
docker build -t idoall/registry .

# run
docker run -it \
--rm \
--name registry \
--hostname registry \
-p 80:80 \
idoall/registry

# view
curl localhost/v2/_catalog
```




Supported tags and respective Dockerfile links
2, 2.5, 2.5.1, latest (Dockerfile)
2.6.0-rc.2 (Dockerfile)
For more information about this image and its history, please see the relevant manifest file (library/registry). This image is updated via pull requests to the docker-library/official-images GitHub repo.

For detailed information about the virtual/transfer sizes and individual layers of each of the above supported tags, please see the repos/registry/tag-details.md file in the docker-library/repo-info GitHub repo.

Docker Registry
Tags < 1.0 refer to the deprecated registry.

Run the Registry
install docker according to the following instructions
Run the registry docker container: Quick version
run the registry: docker run -p 5000:5000 -v <HOST_DIR>:/tmp/registry-dev registry
Modify your docker startup line/script: add "-H tcp://127.0.0.1:2375 -H unix:///var/run/docker.sock --insecure-registry <REGISTRY_HOSTNAME>:5000"
Recommended: run the registry docker container
$ docker run \
         -e SETTINGS_FLAVOR=s3 \
         -e AWS_BUCKET=acme-docker \
         -e STORAGE_PATH=/registry \
         -e AWS_KEY=AKIAHSHB43HS3J92MXZ \
         -e AWS_SECRET=xdDowwlK7TJajV1Y7EoOZrmuPEJlHYcNP2k4j49T \
         -e SEARCH_BACKEND=sqlalchemy \
         -p 5000:5000 \
         registry
NOTE: The container will try to allocate the port 5000. If the port is already taken, find out which container is already using it by running docker ps.

Support
If you are interested in commercial support, the Docker Trusted Registry provides an image registry, LDAP/Active Directory integration, security certificates, and more in a solution that includes commercial support.

Supported Docker versions
This image is officially supported on Docker version 1.12.5.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see the Docker installation documentation for details on how to upgrade your Docker daemon.

User Feedback
Issues
If you have any problems with or questions about this image, please contact us through a GitHub issue. If the issue is related to a CVE, please check for a cve-tracker issue on the official-images repository first.

You can also reach many of the official image maintainers via the #docker-library IRC channel on Freenode.

Contributing
You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a GitHub issue, especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

Documentation
Documentation for this image is stored in the registry/ directory of the docker-library/docs GitHub repo. Be sure to familiarize yourself with the repository's README.md file before attempting a pull request.