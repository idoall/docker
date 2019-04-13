# kibana/7.0



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd kibana/6.7.1

# hack hack hack

# build
docker build -t idoall/kibana:6.7.1 .
```

## 安装

默认会连接本机的 http://localhost:9200 Elasticsearch 实例


```bash
# run
docker run -it \
--rm \
--name kibana \
-e "ELASTICSEARCH_HOSTS=http://elasticsearch:9200" \
--hostname kibana \
-p 5601:5601 \
idoall/kibana:6.7.1
```


```bash
# 启动
docker-compose up
# 停止
docker-compose down
```

浏览 http://localhost:5601/ 能够看到 kibana 运行的页面

## 绑定配置文件
```bash
-v full_path_to/kibana.yml:/usr/share/kibana/config/kibana.yml
```

**Example Docker Environment Variables**

| **Environment Variable**   | **Kibana Setting**         |
| -------------------------- | -------------------------- |
| `SERVER_NAME`              | `server.name`              |
| `KIBANA_DEFAULTAPPID`      | `kibana.defaultAppId`      |
| `XPACK_MONITORING_ENABLED` | `xpack.monitoring.enabled` |

In general, any setting listed in [*Configuring Kibana*](https://www.elastic.co/guide/en/kibana/current/settings.html) can be configured with this technique.

These variables can be set with `docker-compose` like this:

```yaml
version: '2'
services:
  kibana:
    image: docker.elastic.co/kibana/kibana:7.0.0
    environment:
      SERVER_NAME: kibana.example.org
      ELASTICSEARCH_HOSTS: http://elasticsearch.example.org
```

Since environment variables are translated to CLI arguments, they take precedence over settings configured in `kibana.yml`.

#### Docker defaults[edit](https://github.com/elastic/kibana/edit/7.0/docs/setup/docker.asciidoc)

The following settings have different default values when using the Docker images:

| `server.name`                                         | `kibana`                    |
| ----------------------------------------------------- | --------------------------- |
| `server.host`                                         | `"0"`                       |
| `elasticsearch.hosts`                                 | `http://elasticsearch:9200` |
| `xpack.monitoring.ui.container.elasticsearch.enabled` | `true`                      |

![Note](https://www.elastic.co/guide/en/kibana/current/images/icons/note.png)

The setting `xpack.monitoring.ui.container.elasticsearch.enabled` is not defined in the `-oss` image.

These settings are defined in the default `kibana.yml`. They can be overridden with a [custom `kibana.yml`](https://www.elastic.co/guide/en/kibana/current/docker.html#bind-mount-config) or via [environment variables](https://www.elastic.co/guide/en/kibana/current/docker.html#environment-variable-config).


更多在 Docker 的使用，请参考：https://www.elastic.co/guide/en/kibana/current/docker.html