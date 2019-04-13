# ElasticSearch/6.7



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd elasticsearch/7.0

# hack hack hack

# build
docker build -t idoall/elasticsearch:7.0 .
```

## 安装

### 单节点安装

```bash
# run
docker run -it \
--rm \
--name elasticsearch \
--hostname elasticsearch \
-e "discovery.type=single-node" \
-p 9200:9200 \
-p 9300:9300 \
idoall/elasticsearch:7.0
```

浏览 http://localhost:9200/ 能够看到下面的信息，说明已经运行成功

```bash
$ curl http://localhost:9200/ | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   497  100   497    0     0   2696      0 --:--:-- --:--:-- --:--:--  2701
{
  "name": "EHM3D8f",
  "cluster_name": "docker-cluster",
  "cluster_uuid": "YiPDKx-ZSzyMR8kFVIdo7g",
  "version": {
    "number": "6.7.0",
    "build_flavor": "default",
    "build_type": "docker",
    "build_hash": "8453f77",
    "build_date": "2019-03-21T15:32:29.844721Z",
    "build_snapshot": false,
    "lucene_version": "7.7.0",
    "minimum_wire_compatibility_version": "5.6.0",
    "minimum_index_compatibility_version": "5.0.0"
  },
  "tagline": "You Know, for Search"
}
```

### 通过 docker-compose 安装集群

节点 `elasticsearch` 在通过 `Docker` 网络进行通话 `localhost:9200` 时 `elasticsearch2` 进行侦听 `elasticsearch`。

```bash
# 启动
docker-compose up
# 停止
docker-compose down
```
通过下面的命令检查集群的运行状态 
```bash
$ curl http://127.0.0.1:9200/_cat/health
1555167216 14:53:36 docker-cluster green 2 2 0 0 0 0 0 0 - 100.0%
```

### 绑定配置文件
```bash
-v full_path_to/custom_elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml
```



## Where is the data stored? 

The container uses host mounted volumes to store persistent data:

| Local location         | Container location                       |
| ---------------------- | ---------------------------------------- |
| `/srv/es_folder` | `/usr/share/elasticsearch/data` |

更多关于 Docker 下的使用，请参考：https://www.elastic.co/guide/en/elasticsearch/reference/6.x/docker.html