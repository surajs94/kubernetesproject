FROM centos:latest
LABEL Maintainer="suraj@gmail.com"
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN dnf distro-sync -y
# RUN dnf -y install java
RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 

# -------------------------------------------------------

# FROM centos:latest
# LABEL Maintainer="suraj@gmail.com"
# RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
# RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
# RUN dnf distro-sync -y
# # RUN dnf -y install java
# RUN yum install -y httpd \
#   zip \
#   unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page290/cryptop.zip  /var/www/html/
# WORKDIR /var/www/html
# RUN unzip cryptop.zip
# RUN cp -rvf cryptop-html/* .
# RUN rm -rf cryptop-html cryptop.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80 
