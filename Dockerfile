FROM ubuntu:trusty

# update Ubuntu
RUN apt-get update

RUN apt-get install -y gfortran make sqlite3 libsqlite3-dev nginx libfcgi-dev spawn-fcgi make

WORKDIR /fortran-machine

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ADD . .
RUN make

ADD nginx.conf /etc/nginx/sites-enabled/default

CMD sh start.sh