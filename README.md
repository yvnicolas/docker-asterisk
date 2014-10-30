docker-asterisk
===============

My playground to dockerize asterisk configuration

Work in progress

directory `sshdocker` contains a stand alone debian based container accessible via SSH

To build an asterisk image :

```
cd asterisk
docker build -t asterisk .
```

to run the container :

```
docker run -d -p <sshport:22> -p 5060:5060 asterisk
```
replace sshport with whatever you want to avoid standard 22 port.
