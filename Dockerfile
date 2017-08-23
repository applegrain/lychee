FROM ubuntu:14.04
FROM mysql:8.0
FROM php:7.1

RUN echo 'deb http://us.archive.ubuntu.com/ubuntu/ precise universe' >> /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install software-properties-common git
RUN apt-get -y update

WORKDIR /tmp
RUN git clone https://github.com/electerious/Lychee.git

WORKDIR /tmp/Lychee
RUN chmod -R 777 ./uploads/ ./data/ 

# todo:
# move this to a separate txt file
# not all packages are downloaded?
RUN echo $'extension = [session].so\n\
extension = [exif].so\n\
extension = [mbstring].so\n\
extension = [gd].so\n\
extension = [mysqli].so\n\
extension = [json].so\n\
extension = [zip]' \ 
>> php.ini

# ENTRYPOINT ["/tmp/grafana/node_modules/grunt-cli/bin/grunt"]
# CMD ["server"]

