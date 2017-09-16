FROM centos:7.3.1611
MAINTAINER Rajesh Jonnalagadda(<admin.squad@phenompeople.com>)
EXPOSE 27017
ARG MONGODB_VERSION=3.4.9
ARG MONGO_HOME=/opt/mongodb
RUN useradd mongod && \
	yum install -y -q wget
RUN wget -q -O /tmp/mongodb.tar.gz https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-${MONGODB_VERSION}.tgz && \
	tar -xzf /tmp/mongodb.tar.gz -C /opt/ && \
	ln -sf /opt/mongodb-linux-x86_64-${MONGODB_VERSION} /opt/mongodb
ADD start-server.sh /opt/mongodb/start-server.sh

RUN mkdir -p /var/log/mongodb /etc/mongodb && \
	touch /var/log/mongodb/mongodb.log && \
	chown -R mongod:mongod /var/log/mongodb /etc/mongodb /var/log/mongodb /opt/mongodb && \
	chmod a+x /opt/mongodb/start-server.sh
ADD mongodb.conf /etc/mongodb/mongodb.conf

VOLUME /var/lib/mongo

ENV MONGO_HOME=${MONGO_HOME} \
	PATH=${MONGO_HOME}/bin:$PATH
USER mongod
ENTRYPOINT ["/opt/mongodb/start-server.sh"]