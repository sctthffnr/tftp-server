FROM centos:7

RUN yum -y update \
    && yum -y install tftp-server

RUN useradd tftpd

RUN chmod -R 777 /var/lib/tftpboot \
    && chown -R tftpd /var/lib/tftpboot

EXPOSE 69/udp

CMD ["/usr/sbin/in.tftpd", "--secure", "/var/lib/tftpboot", "--user", "tftpd", "--permissive", "--create", "--foreground"]
