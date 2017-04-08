FROM idoall/supervisor
MAINTAINER lion <lion.net@163.com>


# -----------------------------------------------------------------------------
# 设置环境变量
# -----------------------------------------------------------------------------
ENV JAVA_HOME /usr/lib/jvm/jdk8
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH $JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH


# -----------------------------------------------------------------------------
# 安装java8环境
# -----------------------------------------------------------------------------
RUN cd /home/work/_src \
	&& wget https://cdn.azul.com/zulu/bin/zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
	&& mkdir -p /usr/lib/jvm/jdk8 \
	&& tar zxvf zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
	&& mv zulu8.19.0.1-jdk8.0.112-linux_x64/* /usr/lib/jvm/jdk8 \
#    && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz \
#    && mkdir -p /usr/lib/jvm/jdk8 \
#    && tar zxvf jdk-8u111-linux-x64.tar.gz -C /usr/lib/jvm/jdk8 \
    \
# -----------------------------------------------------------------------------
#   配置root用户的环境变量
# -----------------------------------------------------------------------------
    && echo "export JAVA_HOME=/usr/lib/jvm/jdk8" >>  ~/.bashrc \        
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >>  ~/.bashrc \
    && echo "export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib" >>  ~/.bashrc \
    && echo "PATH=\$JAVA_HOME/bin:\$PATH" >>  ~/.bashrc \
    \
# -----------------------------------------------------------------------------
#   配置ssh登录后的环境变量
# -----------------------------------------------------------------------------
    && echo "export JAVA_HOME=/usr/lib/jvm/jdk8" >>  /etc/profile \
    && echo "export JRE_HOME=\$JAVA_HOME/jre" >>  /etc/profile \
    && echo "export CLASSPATH=.::\$JRE_HOME/lib" >>  /etc/profile \
    && echo "PATH=\$JAVA_HOME/bin:\$PATH" >>  /etc/profile \
    \
# -----------------------------------------------------------------------------
#   安装 nodejs 4.X
# -----------------------------------------------------------------------------
	&& yum install -y gcc-c++ make \
	&& curl -sL https://rpm.nodesource.com/setup_4.x | bash - \
	&& yum install -y nodejs \
	\
# -----------------------------------------------------------------------------
#   安装 php-cgi
# -----------------------------------------------------------------------------
	&& yum install -y php php-cgi \
	\
# -----------------------------------------------------------------------------
#   安装 fisp、fis3
# -----------------------------------------------------------------------------
	&& npm install -g fis-plus \
	&& npm install -g fis3 \
	&& mkdir -p /home/work/_website \
	&& cd /home/work/_website \
	&& fisp server init \
	&& fisp init pc-demo \
	&& cd pc-demo \
	&& fisp release -r common \
	&& fisp release -r home \
	&& fisp server start \
	\
# -----------------------------------------------------------------------------
# 删除一些多余的东西
# -----------------------------------------------------------------------------
    && rm -rf /home/work/_src/zulu*





# -----------------------------------------------------------------------------
# 映射 8080 端口，给fips使用
# -----------------------------------------------------------------------------
EXPOSE 8080

WORKDIR /home/work





