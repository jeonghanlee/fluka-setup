FLUKA Installation
====


* Download fluka2011.2x-linux-gfor64bitAA.tar.gz into a directory

* Run setup_fluka_env.bash

```
fluka-setup]$ bash setup_fluka_env.bash -t /opt/fluka/2011.2x.4 -s fluka_src/fluka2011.2x-linux-gfor64bitAA.tar.gz setup

```

* Build the fluka and its executable files

```
fluka-setup]$ bash build_fluka_env.bash -t /opt/fluka/2011.2x.4 setup 
```
