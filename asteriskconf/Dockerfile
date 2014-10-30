# Supposed a basic asteriks compilation image exists
# copies the configuration files and starts asterisk


FROM asterisk:basecomp
MAINTAINER Yves Nicolas <yves.nicolas@dynamease.com>


# Creates the user under which asterisk will run
# Should not be necessary here but just to be kept for debugging
# ENV ASTERISKUSER pbxrunner
# ENV ASTERISKVER 11.3.0

# COPY Configuration file
COPY initconfigfiles/etc/* /etc/asterisk/

#Change ownership of asterisk files
RUN chown -R $ASTERISKUSER:$ASTERISKUSER /var/lib/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/spool/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/log/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /var/run/asterisk \
	&& chown -R $ASTERISKUSER:$ASTERISKUSER /etc/asterisk
 

#Make asterisk port open
EXPOSE 5060

# the following lines provoke an exec error.
# commented to avoid.
# needs to to an asterisk start in the container
#COPY entrypoint.sh /usr/local/sbin/
#RUN chmod ugo+x /usr/local/sbin/entrypoint.sh
#ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]