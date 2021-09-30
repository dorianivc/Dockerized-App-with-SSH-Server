FROM php:7.2-apache
ENV APP_HOME "/home/site/wwwroot"
ENV SSH_PASSWD "root:Docker!"
#Here we copy the source code to the expected apache deployment folder
COPY * /var/www/html/
COPY *.ini /home/site/ini
COPY *.ini /usr/local/etc/php/conf.d
#For copying everything on your Folder Context you can COPY . /home/www/html/
#The dot(.) means your build context


# Configuring SSH

RUN touch /etc/apt/sources.list \ 
&& apt-get -y update \
&& apt-get -y upgrade \
&& apt-get install -y software-properties-common \
&& apt-get update  -y \
&& add-apt-repository main 

RUN apt-get install -y openssh-server && echo $SSH_PASSWD | chpasswd 

COPY sshd_config /etc/ssh/



EXPOSE 80 2222


#CMD stands for "Command" this is the starup-up command of the docker container
CMD [ "/var/www/html/startup.sh" ]