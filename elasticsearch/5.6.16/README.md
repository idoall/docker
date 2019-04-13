# ElasticSearch/5.6.16



## Developing

```bash
# Pull image
git clone https://github.com/idoall/docker.git
cd elasticsearch/5.6.16

# hack hack hack

# build
docker build -t idoall/elasticsearch:5.6.16 .
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
idoall/elasticsearch:5.6.16
```

浏览 http://localhost:9200/ 能够看到下面的信息，说明已经运行成功

```bash
$ curl http://localhost:9200/ | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   328  100   328    0     0   2192      0 --:--:-- --:--:-- --:--:--  2201
{
  "name": "V1aoxAF",
  "cluster_name": "elasticsearch",
  "cluster_uuid": "6NeOxv9uRlWGukZ1X0B0VA",
  "version": {
    "number": "5.6.16",
    "build_hash": "3a740d1",
    "build_date": "2019-03-13T15:33:36.565Z",
    "build_snapshot": false,
    "lucene_version": "6.6.1"
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
1555175839 17:17:19 elasticsearch green 1 1 0 0 0 0 0 0 - 100.0%
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

更多关于 Docker 下的使用，请参考：https://www.elastic.co/guide/en/elasticsearch/reference/5.6/docker.html