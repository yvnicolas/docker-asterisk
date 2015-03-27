docker-asterisk
===============

My playground to dockerize asterisk configuration

Work in progress

## `asterisk` directory

The main directory, should be self sustainable now. Other directories are kept for reference.

### useful commands to manage the container :

```
#run with default configuration files
docker run --name asterisk -d -p 5060:5060 -p : <Add RTP ports opening> yvnicolas/asterisk

#run with conf file from the host
docker run -v <path to conf file dir on host>:/etc/asterisk --name asterisk -d -p 5060:5060 yvnicolas/asterisk


# get an asterisk console
docker exec -ti asterisk asterisk -cvvvvvvvvr

# access to `/etc/asterisk` with view to your current host directory
docker run -ti --rm --volumes-from asterisk -v $(pwd):/hostdir

```

### RTP ports considerations
Historically, 2 possibilities to allow mapping of Rtp ports without docker support of port range mapping : using `--net=host` or do an individual range mapping of `-p:port:port/udp` with creating correctly rtp.conf file. Used [Areski Belaid's docker asterisk post](http://areskibelaid.com/asterisk-on-docker/index.html) as background info on the subject.  
It seems issue has [been addressed in docker](https://github.com/docker/docker/pull/8167)  
Still needs to find out from which release 


### Troubleshooting
Instead of starting the container with a `-d` start it with `docker run -ti [...] yvnicolas/asterisk /bin/bash`  
Start asterisk front in the container  
`pbxrunner@876876: asterisk -cvvvvvvvv `

## Old directories

directory `sshdocker` contains a stand alone debian based container accessible via SSH

To build an asterisk image that has just asterisk Compiled :

```
cd asterisk
docker build -t asterisk:basecomp .
```


```
cd asteriskconf
docker build -t asterisk:conf
```

to run the container :

```
docker run -d -p <sshport:22> -p 5060:5060 asterisk
```
replace sshport with whatever you want to avoid standard 22 port.

Not able at this stage to start properly asterisk from an ENTRYPOINT or CMD in image. Once the container is started, connect to it using ssh and run
```
asterisk start
```