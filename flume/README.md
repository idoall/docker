# docker-flume
Docker image for Apache Flume

# Supported tags and respective `Dockerfile` links

- [`1.9.0` (*1.9.0/Dockerfile*)](https://github.com/idoall/docker/blob/master/flume/1.9.0/Dockerfile)


# How to run

- **run with default**

  `docker run -d idoall/flume`

  > NOTE: The agent name for default configuration is '*agent*'， you can customize it by docker enviroment. please refer to blow.

- **run with customized agent name**

  `docker run -e AGENT=myAgent idoall/flume`

  > NOTE: If you run the image with a customized agent name, do remember that, the same agent name must be exist in your configuration file. e.g, flume-conf.properties. Please refer to blow.

- **run with customized configurations**

  `docker run -v /path/to/your/conf.properties:/apache-flume/conf/flume-conf.properties idoall/flume`

  > NOTE: If you has a different agent name than default, do remember to set docker environment for your agent.

- **run with customized log configurations**

  `docker run -v /path/to/your/log4j.properties:/apache-flume/conf/log4j.properties idoall/flume`

  > NOTE: You can specify where to output logs by log4j.properties

- **run with customized command**

  `docker run idoall/flume sh -c "./bin/flume-ng agent -n ${AGENT} -c conf -f conf/flume-conf.properties"`

  > NOTE: You can run flume with your preferred command!