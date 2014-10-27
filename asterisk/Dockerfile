# Enabling a ssh demon inside a docker container
# derived from dockerizing and SSH daemon on http://docs.docker.com/examples/running_ssh_service


FROM yves_sshd:latest
MAINTAINER Yves Nicolas <yves.nicolas@dynamease.com>


# Creates the user under which asterisk will run

RUN groupadd -r pbxrunner && useradd -r -g pbxrunner -m /var/lib/asterisk pbxrunner

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
	&& wget http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-11.3.0.tar.gz \
	&& tar -xvzf asterisk-11.3.0.tar.gz


