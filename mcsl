#!/bin/bash
#Author YouTiao
#Source https://github.com/YouTiao233/mcsl

Dir="/home/carm/KarServer/"
sh="start.sh"
start="$Dir$2"
ProgramName="Minecraft-Server"
Server="$2"
Command="$1"

echo ""
echo "+--------------------------------------------------+"
echo "| Manager for ${ProgramName}, Written by YouTiao |"
echo "+--------------------------------------------------+"
echo ""

case "$1" in
 -start)
  if [ ! -d $start ]; then
   echo "ERROR!!! can not find the server dir!"
    exit
  else
   if [ ! -f $start/$sh ]; then
    echo "ERROR!!! can not find the "$start"!"
    exit
   else
    bash -c "cd "$start" && bash "$sh
    echo $Server" has start!"
    exit
   fi
  fi
 ;;
 -list)
  echo "Online Servers:"
  screen -ls|grep -v There|grep -v Socket
  exit
 ;;
 -restart)
  if [ ! -d $start ]; then
   echo "ERROR!!! can not find the server dir!"
    exit
  else
   if [ ! -f $start/$sh ]; then
    echo "ERROR!!! can not find the "$start"!"
    exit
   else
    check=`screen -ls|grep $Server|wc -l` 
    if [ "$check" -gt "0" ]; then
     screen -S $Server -X quit
     bash -c "cd "$start" && bash "$sh
     echo $Server" has restart!"
    fi
   fi
  fi
  exit
 ;;
 -stop)
 if [ ! -d $start ]; then
   echo "ERROR!!! can not find the server!"
    exit
  else
   check=`screen -ls|grep $Server|wc -l` 
   if [ "$check" -gt "0" ]; then
    screen -S $Server -X quit
    bash -c "cd "$start" && bash "$sh
    echo $Server" has stop!"
   fi
  fi
  exit
 ;;
esac
