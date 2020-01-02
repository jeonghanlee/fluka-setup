FLUKA Installation
====

## Preparation for CentOS 7

One can skip this if one would like to use CentOS8.

* devtoolset-7.x86_64
```
sudo yum install centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-7-rpms
sudo yum install devtoolset-7
```



## Update the fluka

CentOS7 has the gcc7 NOT gcc9, so we have to download the gfortran 7 version of fluka from its site such as

```
https://www.fluka.org/packages/fluka2011.2x-linux-gfor64bit-7.4-AA.tar.gz
```

* Download it into ~/Downloads/ folder


* Update the latest gcc 7 in the CentOS7
```
sudo yum install devtoolset-7
```

## Setup

In the `fluka-setup` path, one can setup it first. And in this example, we set the target path as `/opt/fluka/2011.2x.8`

```
bash setup_fluka_env.bash -t /opt/fluka/2011.2x.8/ -s /home/yongjoonglee/Downloads/fluka2011.2x-linux-gfor64bit-7.4-AA.tar.gz setup
```

## Build

We have to match the target path in the same as before `/opt/fluka/2011.2x.8`.

```
scl enable devtoolset-7 bash
bash build_fluka_env.bash -t /opt/fluka/2011.2x.8 setup

```

The `build_fluka_env.bash` will copy `set_fluka_env.bash` file into `/opt/fluka/2011.2x.8`. However, if one would like to use the CentOS 8, which means that one doesn't need the devtoolset-7 anymore,  one should remove the internal call `scl enable devtoolset-7 bash` in `set_fluka_env.bash` [1]. With CentOS 8, one doesn't need to call `scl enable devtoolset-7 bash` before `build_fluka_env.bash`.


## Set its environment

Add or update the following line in .bashrc

```
alias goOldFluka='source /opt/fluka/2011.2x.4/set_fluka_env.bash'
alias goFluka='source /opt/fluka/2011.2x.8/set_fluka_env.bash'

```

## Reference

[1] https://github.com/jeonghanlee/fluka-setup/blob/master/set_fluka_env.bash#L39