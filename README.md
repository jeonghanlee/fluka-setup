FLUKA Installation
====




* Download fluka2011.2x-linux-gfor64bitAA.tar.gz into ~/Download/

* Download fluka-setup (not necessary if it exists)

```
git clone https://github.com/jeonghanlee/fluka-setup
```



* Run setup_fluka_env.bash 

```
[Downloads]$ bash fluka-setup/setup_fluka_env.bash -t /opt/fluka/2011.2x.4/ -s fluka2011.2x-linux-gfor64bitAA.tar.gz setup

```

* Build the fluka and its executable files

```
[Downloads]$ bash fluka-setup/build_fluka_env.bash -t /opt/fluka/2011.2x.4 setup
```

* add the following line in .bashrc
```
alias goFluka='source /opt/fluka/2011.2x.4/set_fluka_env.bash'
```

