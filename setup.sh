#!/bin/bash
#Author YouTiao
#Source https://github.com/YouTiao233/mcsl
#GPL-3.0
echo ""
echo "+-----------------------------------------------------+"
echo "| Minecraft Server Launcher setup, Written by YouTiao |"
echo "+-----------------------------------------------------+"
echo ""

[[ $EUID -ne 0 ]] && echo -e "[${red}Error${plain}] This script must be run with sudo !" && exit 1

read -p "Please enter your server path:" serverpath
echo
echo "-------------------------------------------------------"
echo "Your server path = ${serverpath}"
echo "-------------------------------------------------------"
echo

read -p "Please enter your server script name(Default: Start.sh):" scriptname
[ -z "${scriptname}" ] && scriptname="Start.sh"
echo
echo "-------------------------------------------------------"
echo "Your server start script name = ${scriptname}"
echo "-------------------------------------------------------"
echo

read -p "Please enter autocomplete path(Default: ):" as
[ -z "${ap}" ] && as="Start.sh"
echo
echo "-------------------------------------------------------"
echo "Your autocomplete path = ${ap}"
echo "-------------------------------------------------------"
echo
echo
echo
echo "-------------------------------------------------------"
echo "Server path = ${serverpath}"
echo "Server start script name = ${scriptname}"
echo "Autocomplete path = ${ap}"
echo "-------------------------------------------------------"
echo
echo "Press any key to start...or Press Ctrl+C to cancel"
read -n 1
if [ ! -n $ap && ! -n $scriptname && ! -n $serverpath ]; then
 echo "Error!!! Detect null!Please check your input"
 exit
fi

touch /etc/mcsl.conf
echo 'Path="'$serverpath'"' >>/etc/mcsl.conf
echo 'sh="'$scriptname'"' >>/etc/mcsl.conf
sed -e "s/xxx/\/etc\/mcsl.conf/" mcsl_source > $ap/mcsl_source
sed -e "s/xxx/\/etc\/mcsl.conf/" mcsl > /usr/bin/mcsl
echo "source "$ap"/mcsl_source" > /etc/bashrc
