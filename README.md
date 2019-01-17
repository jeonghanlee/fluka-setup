FLUKA Installation
====

# Preparation

* 2011.2x-0 : devtoolset-7.x86_64
```
sudo yum install centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-7-rpms
sudo yum install devtoolset-7
```

* 2011.2x.4 : devtoolset-8.x86_64

cannot find this

https://stackoverflow.com/questions/53310625/how-to-install-gcc8-using-devtoolset-8-gcc

```

```

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

