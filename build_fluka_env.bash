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


declare -gr SC_SCRIPT="$(realpath "$0")"
declare -gr SC_SCRIPTNAME=${0##*/}
declare -gr SC_TOP="${SC_SCRIPT%/*}"


EXIST=1
NON_EXIST=0

SUDO="sudo"

function pushd { builtin pushd "$@" > /dev/null; }
function popd  { builtin popd  "$@" > /dev/null; }



function usage
{
    {
	echo "";
	echo "Usage    : $0 [-t <target_path>] " ;
	echo "";
	echo "";
	echo " bash $0 -t /opt/fluka/2011.2x.4 setup"
	echo ""
	
    } 1>&2;
    exit 1; 
}


function yes_or_no_to_go
{

    printf  ">> \n";

    printf  "\n";
    read -p ">> Do you want to continue (y/N)? " answer
    case ${answer:0:1} in
	y|Y )
	    printf "\n"
	    ;;
	* )
            printf ">> Stop here. \n";
	    exit;
    ;;
    esac

}


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



options=":t:y"

ANSWER="NO"

while getopts "${options}" opt; do
    case "${opt}" in
        t) SRC_DIR=${OPTARG} ;;
	y) ANSWER="YES" ;;
   	:)
	    echo "Option -$OPTARG requires an argument." >&2
	    exit 1
	    ;;
	h)
	    usage
	    ;;
	\?)
	    echo "Invalid option: -$OPTARG" >&2
	    exit
	    ;;
    esac
done
shift $((OPTIND-1))

source /opt/rh/devtoolset-7/enable

fortran_compiler="gfortran"

FLUPRO=${SRC_DIR}
FLUFOR=${fortran_compiler}

export FLUPRO
export FLUFOR

case "$1" in

    setup)
	if [ "$ANSWER" == "NO" ]; then
	    yes_or_no_to_go
	fi
	print_options
	;;
    *)
	usage
	;;

esac


printf "We are compiling fluka at %s.\n" "${FLUPRO}"

if [ "$ANSWER" == "NO" ]; then
    yes_or_no_to_go
fi

pushd ${FLUPRO}
make
popd

cp -f ${SC_TOP}/set_fluka_env.bash ${FLUPRO}/


printf "\n"
printf "\n"
printf "The FLUKA distribution tar file normally does not contain an executable file. We are building the default FLUKA executable\n";

if [ "$ANSWER" == "NO" ]; then
    yes_or_no_to_go
fi
	
pushd ${FLUPRO}
flutil/lfluka -m fluka
flutil/ldpmqmd
popd



