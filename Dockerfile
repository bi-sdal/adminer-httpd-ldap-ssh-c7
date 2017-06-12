FROM sdal/httpd-ldap-ssh-c7
MAINTAINER Aaron D. Schroeder <dads2busy@gmail.com>

RUN yum -y install wget nano

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all
RUN systemctl enable httpd

# RUN mkdir /usr/share/adminer
RUN cd /usr/share/adminer && wget https://www.adminer.org/latest.php -O index.php

# COPY adminer.conf /etc/httpd/conf.d/adminer.conf

RUN cd /etc/httpd/conf.d/ && wget https://github.com/bi-sdal/adminer-httpd-ldap-ssh-c7/raw/master/adminer.conf

EXPOSE 80 8080

CMD ["/lib/systemd/systemd"]
