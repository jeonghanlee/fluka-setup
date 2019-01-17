#!/bin/bash
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
# 
#  Shell  : set_fluka_env.bash
#  Author : Jeong Han Lee
#  email  : jeonghan.lee@gmail.com

SRC="${BASH_SOURCE[0]}"
SRC_DIR="$( cd -P "$( dirname "$SRC" )" && pwd )"



function print_options
{
    printf "\n"
    printf ">>> The following variables are set.\n"
    printf "    FLUPRO : ${FLUPRO}\n";
    printf "    FLUFOR : ${FLUFOR}\n\n";
    printf ">>> GFortan information as follows:\n"
    printf "   \n";
    gfortran --version
    printf ">>> \n";

}



source /opt/rh/devtoolset-7/enable

fortran_compiler="gfortran"


FLUPRO=${SRC_DIR}
FLUFOR=${fortran_compiler}

export FLUPRO
export FLUFOR



print_options

