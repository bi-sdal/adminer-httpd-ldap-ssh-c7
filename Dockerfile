FROM sdal/httpd-ldap-ssh-c7
MAINTAINER Aaron D. Schroeder <dads2busy@gmail.com>

RUN yum -y install wget nano

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum clean all

RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php71 && \
    yum -y install php php-opcache php-pgsql php-pdo

RUN cd /var/www/html && \
    wget -O index.php https://www.adminer.org/latest.php

RUN systemctl enable httpd

EXPOSE 80

CMD ["/lib/systemd/systemd"]
