FROM centos:6.6
MAINTAINER li
RUN mkdir /test
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN  yum -y install sudo \
&& yum -y install net-tools \
&& yum -y install vim \
&& yum -y install rpm-build \
&& yum -y install tar\
&& yum -y install gcc
RUN rpm --rebuilddb && yum -y install ncurses-devel
RUN rpm --rebuilddb && yum -y install readline-devel 
RUN rpm --rebuilddb && yum -y install pcre-devel
RUN rpm --rebuilddb && yum -y install openssl-devel
RUN rpm --rebuilddb && yum -y install libxml2-devel
RUN rpm --rebuilddb && yum -y install libxslt-devel 
ADD lua-5.1.tar.gz /test
WORKDIR /test/lua-5.1
RUN make linux && make install 
WORKDIR /test
COPY run.sh /test
COPY rpmbuild.sh /test
RUN chmod 755 rpmbuild.sh
CMD ["sh","run.sh"]

