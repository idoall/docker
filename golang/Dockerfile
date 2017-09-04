FROM idoall/supervisor:1.9
MAINTAINER lion <lion.net@163.com>


ENV GOLANG_VERSION 1.9

# -----------------------------------------------------------------------------
# 下载 golang
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
	&& wget -O go.tgz "https://storage.googleapis.com/golang/go$GOLANG_VERSION.src.tar.gz" \
	&& echo 'a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993 *go.tgz' | sha256sum -c -; \
	&& tar -C /home/work/_app -xzf /home/work/_src/go.tgz; \
	&& cd /home/work/_app/go/src \
	&& 