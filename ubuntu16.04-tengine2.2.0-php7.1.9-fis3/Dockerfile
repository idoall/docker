FROM idoall/ubuntu16.04-tengine2.2.0-php:7.1.9
MAINTAINER lion <lion.net@163.com>


ARG DEBIAN_FRONTEND=noninteractive
COPY files/ /



# -----------------------------------------------------------------------------
# 安装java8环境
# -----------------------------------------------------------------------------
RUN axel -n 10 -o /home/work/_src/ https://cdn.azul.com/zulu/bin/zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
	&& cd /home/work/_src \
	&& mkdir -p /usr/lib/jvm/jdk8 \
	&& tar zxvf zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
	&& mv zulu8.19.0.1-jdk8.0.112-linux_x64/* /usr/lib/jvm/jdk8

    
# -----------------------------------------------------------------------------
#   安装 nodejs 6
# -----------------------------------------------------------------------------
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
	&& apt-fast install -y nodejs


# -----------------------------------------------------------------------------
#   安装 fis3
# -----------------------------------------------------------------------------
RUN npm install -g fis3 fis3-server-php fis3-smarty fis3-server-smarty fis-optimizer-minify-html


# -----------------------------------------------------------------------------
# 清除
# -----------------------------------------------------------------------------
RUN chmod 755 /hooks \
    && chown -R work:work /home/work/* \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/apt-fast/* \
    && rm -rf /home/work/_src/*


# -----------------------------------------------------------------------------
# 部署 fis3 使用 php 运行的基础文件
# -----------------------------------------------------------------------------
ADD server_env.tar.gz /root/.fis3-tmp/www
ADD demo.tar.gz /home/work/_website


# -----------------------------------------------------------------------------
# 映射 8080 端口，给fips使用
# -----------------------------------------------------------------------------
EXPOSE 8080


# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk8
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH
