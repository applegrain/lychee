FROM ubuntu:14.04
FROM mysql:8.0
FROM php:7.1

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install software-properties-common git curl
RUN apt-get -y update

WORKDIR /tmp
RUN git clone https://github.com/electerious/Lychee.git
RUN chmod +x -R ./Lychee

WORKDIR /tmp/Lychee
RUN chmod -R 777 ./uploads/ ./data/ 

RUN echo $'extension = [session].so\n\
extension = [exif].so\n\
extension = [mbstring].so\n\
extension = [gd].so\n\
extension = [mysqli].so\n\
extension = [json].so\n\
extension = [zip]' \ 
>> php.ini

EXPOSE 80:80
ENTRYPOINT ["/tmp/Lychee/"]
CMD ["php", "-S", "localhost:80", "web."]

# todo: redirect stdout
# todo: add the php.ini from other file
  # not all of the packages are being installed (php -m)
  # add the other suggested configs from Lychee (https://github.com/electerious/Lychee)
# todo: install own instance of lychee 
# todo: deploy
