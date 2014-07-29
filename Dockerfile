### Dockerfile
#
# Basejump PHP5.5 PHP-FPM and NGINX with Exim MTA

FROM basejump/nginx-php55
MAINTAINER Devon Weller <dweller@atlasworks.com>

# install exim
RUN yum -y install exim

# add custom exim.conf
ADD exim.conf /etc/exim/exim.conf

# add custom exim startup script
ADD exim-start.sh /usr/local/sbin/exim-start.sh

# add custom nginx startup script
ADD nginx-start.sh /usr/local/sbin/nginx-start.sh

# add new supervisord conf file with exim
ADD supervisord.conf /etc/

# create a log file for supervisord
RUN mkdir /var/log/supervisord


