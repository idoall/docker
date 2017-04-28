FROM idoall/supervisor:1.9
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
RUN axel -n 10 -o /home/work/_src/ https://cdn.azul.com/zulu/bin/zulu8.19.0.1-jdk8.0.112-linux_x64.tar.gz \
	&& cd /home/work/_src \
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
    && echo "PATH=\$JAVA_HOME/bin:\$PATH" >>  /etc/profile
    
# -----------------------------------------------------------------------------
#   安装 nodejs 6
# -----------------------------------------------------------------------------
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
	&& yum -y install nodejs

# -----------------------------------------------------------------------------
#   安装 php5.6
# -----------------------------------------------------------------------------
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm \
    && rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm \
    && yum update -y \
    && yum clean all \
    && yum makecache \
    && yum install -y php56w php56w-cli php56w-cgi php56w-gd php56w-devel php56w-bcmath  php56w-imap php56w-mbstring php56w-mcrypt php56w-mysql php56w-odbc php56w-pdo php56w-pear php56w-pecl-geoip php56w-pecl-imagick php56w-xml php56w-xmlrpc php56w-opcache php56w-intl php56w-pecl-redis php56w-pecl-memcache php56w-pecl-memcached php56w-soap

# -----------------------------------------------------------------------------
#   安装 fis3
# -----------------------------------------------------------------------------
#RUN npm install -g fis3 fis3-server-php fis3-smarty fis3-server-smarty fis-optimizer-minify-html --disturl=http://registry.npm.taobao.org/mirrors/node --registry=http://registry.npm.taobao.org \
RUN npm install -g fis3 fis3-server-php fis3-smarty fis3-server-smarty fis-optimizer-minify-html \
	&& mkdir -p /home/work/_website \
#	&& cd /home/work/_website \
#	&& fis3 server start --type php --rewrite \
	\
# -----------------------------------------------------------------------------
# 删除一些多余的东西
# -----------------------------------------------------------------------------
    && rm -rf /home/work/_src/zulu* \
    && rm -rf /home/work/_src/node* \
    && yum clean all


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
# 添加执行文件
# -----------------------------------------------------------------------------
ADD run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]

