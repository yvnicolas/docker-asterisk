# Enabling a ssh demon inside a docker container
# derived from dockerizing and SSH daemon on http://docs.docker.com/examples/running_ssh_service


FROM yves_sshd:latest
MAINTAINER Yves Nicolas <yves.nicolas@dynamease.com>


# Creates the user under which asterisk will run

ENV ASTERISKUSER pbxrunner
ENV ASTERISKVER 11.3.0

RUN groupadd -r $ASTERISKUSER && useradd -r -g $ASTERISKUSER $ASTERISKUSER \
	&& mkdir /var/lib/asterisk && chown $ASTERISKUSER:$ASTERISKUSER /var/lib/asterisk \
	&& usermod --home /var/lib/asterisk $ASTERISKUSER

# grab gosu for easy step-down from root
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/* \
	&& curl -o /usr/local/bin/gosu -SL 'https://github.com/tianon/gosu/releases/download/1.1/gosu' \
	&& chmod +x /usr/local/bin/gosu \
	&& apt-get purge -y --auto-remove curl


# Asterisk compilation and installation

# installation of packets needed for installation
RUN apt-get update && apt-get install -y uuid-dev build-essential libxml2-dev libncurses5-dev \
					libsqlite3-dev libssl-dev


# Getting the sources
WORKDIR /tmp
RUN mkdir src && cd src \
	&& apt-get install -y wget \
	&& wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-$ASTERISKVER.tar.gz \
	&& tar -xvzf asterisk-$ASTERISKVER.tar.gz

#installation asterisk
RUN cd /tmp/src/asterisk-$ASTERISKVER && ./configure && make && make install && make config

#installation PHP et PHP AGI
RUN apt-get install -y php5 php5-json \
	&& cd /tmp && wget http://sourceforge.net/projects/phpagi/files/latest/download \
	&& tar xvzf phpagi-2.20.tgz \
	&& mv phpagi-2.20/* /var/lib/asterisk/agi-bin/  \
 	&& chmod ugo+x /var/lib/asterisk/agi-bin/*.php

#Change ownership of asterisk files
RUN chown -R $ASTERISKUSER:$ASTERISKUSER /var/lib/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/spool/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/log/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/run/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /etc/asterisk
 

#Make asterisk port open
EXPOSE 5060


