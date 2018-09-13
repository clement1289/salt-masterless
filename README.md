## Salt Masterless
* salt minion in masterless mode
* version 2017.7
* sets the following in minion config

```
file_client: local
file_roots:
  base:
    - /srv/salt/states
pillar_roots:
  base:
    - /srv/salt/pillar
```
### How to run
* just docker run
```
docker run -it clement89/salt-masterless:2017.7

Will drop to bash to run salt-call commands

```
* volume mount a grains file if needed
```
$ cat grains
cabinet: 13
rack: r15

$ docker run -v $(pwd)/grains:/etc/salt/grains clement89/salt-masterless:2017.7
```

