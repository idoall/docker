FROM idoall/golang
MAINTAINER lion <lion.net@163.com>


ADD . /home/work/golang/src/github.com/idoall/docker/snowflake

RUN go install github.com/idoall/docker/snowflake/cmd/snowflake

ENV PORT 80

CMD [ "/home/work/go/bin/snowflake" ]
