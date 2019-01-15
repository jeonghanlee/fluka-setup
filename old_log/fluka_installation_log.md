# User specific aliases and functions


alias dev7='source /opt/rh/devtoolset-7/enable && cd ${HOME}/.flair && rm -f fla
ir.ini && ln -sf flair.ini.dev7 flair.ini && cd '
alias dev6='source /opt/rh/devtoolset-6/enable && cd ${HOME}/.flair && rm -f fla
ir.ini && ln -sf flair.ini.dev6 flair.ini && cd '






## procedure 

* Download 64bit 

https://www.fluka.org/packages/fluka2011.2x-linux-gfor64bitAA.tar.gz

* copy gz into the following path


[yongjoonglee@ci0010749 fluka]$ mkdir devtoolset-7_2011.2x-0
[yongjoonglee@ci0010749 fluka]$ ln -s devtoolset-7_2011.2x-0 devtoolset-7

[yongjoonglee@ci0010749 fluka]$ scp fluka2011.2x-linux-gfor64bitAA.tar.gz devtoolset-7

[yongjoonglee@ci0010749 fluka]$ cd devtoolset-7


[yongjoonglee@ci0010749 devtoolset-7]$ tar xvzf fluka2011.2x-linux-gfor64bitAA.tar.gz 
[yongjoonglee@ci0010749 devtoolset-7]$ dev7
[yongjoonglee@ci0010749 ]$ cd /opt/fluka/devtoolset-7

[yongjoonglee@ci0010749 devtoolset-7]$ export FLUPRO=/opt/fluka/devtoolset-7
[yongjoonglee@ci0010749 devtoolset-7]$ export FLUFOR=gfortran
[yongjoonglee@ci0010749 devtoolset-7]$ gfortran --version
GNU Fortran (GCC) 7.2.1 20170829 (Red Hat 7.2.1-1)
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


[yongjoonglee@ci0010749 devtoolset-7]$ make



```


## Bash configuration


. bashrc
```
alias dev7='source /opt/rh/devtoolset-7/enable && cd ${HOME}/.flair && rm -f flair.ini && ln -sf flair.ini.dev7 flair.ini && export FLUPRO=/opt/fluka/devtoolset-7 && cd '
alias dev6='source /opt/rh/devtoolset-6/enable && cd ${HOME}/.flair && rm -f flair.ini && ln -sf flair.ini.dev6 flair.ini && export FLUPRO=/opt/fluka/devtoolset-6 && cd '

```


## flair configuration
```
[yongjoonglee@ci0010749 .flair]$ ls flair.ini.dev*
flair.ini.dev6  flair.ini.dev7
[yongjoonglee@ci0010749 .flair]$ pwd
/home/yongjoonglee/.flair
```

```
snip snip...

[Project]
flukadir = /opt/fluka/devtoolset-7
flufor = gfortran

snip snip...
```


