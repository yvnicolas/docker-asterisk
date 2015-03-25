#!/bin/bash

# Entrypoint script to launch asterisk

if [ "$CONFDIR" != "" ]
then
    echo "Using configuration files from $CONFDIR"
    rm /etc/asterisk/*
    cp $CONFDIR/* /etc/asterisk/
    chown -R $ASTERISKUSER:$ASTERISKUSER /etc/asterisk
else
    echo "Using default init configuration file"
fi

exec "$@"
