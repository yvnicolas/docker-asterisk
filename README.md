docker-asterisk
===============

My playground to dockerize asterisk configuration

Work in progress

## `asterisk` directory

The main directory, should be self sustainable now. Other directories are kept for reference.

useful commands to manage the container :

```
#run
docker run --name asterisk -d -p 5060:5060 yvnicolas/asterisk:13.2.0

# get an asterisk console
docker exec -ti asterisk asterisk -cvvvvvvvvr

# access to `/etc/asterisk` with view to your current host directory
docker run -ti --rm --volumes-from asterisk -v $(pwd):/hostdir

```


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