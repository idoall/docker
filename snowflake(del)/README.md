# snowflake

Snowflake is a go implementation of Twitter's Snowflake service.  Like its namespace, Snowflake is also a network
service for generating unique ID numbers at high scale with some simple guarantees.

[https://blog.twitter.com/2010/announcing-snowflake](https://blog.twitter.com/2010/announcing-snowflake)

## Concepts

Snowflake generates unique int64 ids that (unlike uuids) are loosely time sorted.  Each id consists of:

| Bits  | Field | Notes |
| :--- | :--- | :--- |
| 41 | Timestamp in MS | ~70yrs |
| 10 | Server ID | Unique Server ID |
| 13 | Sequence ID| sequence to disambiguate requests in the same ms |

## Server Usage

build
```
docker build -t idoall/snowflake .
```

The simplest way to run snowflake is via docker:

```
docker run -p 80:80 -it --rm idoall/snowflake
```

To retrieve the a single id:

```
curl http://your-host-name?n=4
[177632155436843008,177632155436844032,177632155436845056,177632155436846080]
```

To retrieve the N ids:

```
curl http://your-host-name?n=6
[177632347561132032,177632347561133056,177632347561134080,177632347561135104,177632347561136128,177632347561137152]
```

