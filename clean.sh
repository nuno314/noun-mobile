#!/bin/bash

# Shell Script COLOR
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# define color
RED="1;31"
GREEN="1;32"
YELLOW="1;33"
LIGHT_CYAN="1;36"

# function echo text with color
# cmd:  echoColor <COLOR> <TEXT>
# EX:   echoColor $GREEN "Hello world!"
echoColor()
{
    echo "\033[$1m $2\033[0m"
}

usage() {
    if [ "$*" != "" ] ; then
        echoColor $RED "Error: $*"
    fi
    echoColor $YELLOW '
SCRIPT CLEAN PROJECT

USAGE: sh clean.sh [options]
OPTIONS:
-h,     --help       display this usage message and exit

-f,    --force       force clean all folder in project (i.e: sh clean -f or sh clean --force)
'

    exit 1
}

# count item
index=0
isForce=0

while [ $# -gt 0 ] ; do
    case "$1" in
        -f|--force)
            isForce=1
            shift
            ;;
        -h|--help)
            usage
            shift
            ;;
        *)
            usage
            shift
    esac
    shift
done

echoColor $GREEN "------------ START CLEAN PROJECT ------------ \n"
ROOT_DIR=$(pwd)

echoColor $GREEN "------------ Force clean project ------------"
total=$(find . -type f -name "pubspec.yaml" -not -path '*/\.*' | wc -l)
total="${total// /}"
echoColor $LIGHT_CYAN "----------------------------------------------------------"
echoColor $LIGHT_CYAN "$total Folders have been scanned. Start cleaning..."
echoColor $LIGHT_CYAN "----------------------------------------------------------"

# go to all the directory are contains file pubspec.yaml to call clean and pub get
find . -type f -name "pubspec.yaml" -not -path '*/\.*' | while read line; do
    index=$(( index + 1 ))
    BASEDIR=$(dirname "$line")
    echoColor $YELLOW "===> Clean [$BASEDIR]..."

    cd "$BASEDIR"
    
    flutter clean

    if [ $isForce == 1 ]; then
      rm -rf pubspec.lock
    fi

    flutter pub get

    if [ -d "./ios" ]; then
      echoColor $YELLOW "===> Pod install [$BASEDIR/ios]..."

      cd ios

      if [ $isForce == 1 ]; then
        pod deintegrate; rm -rf podfile.lock; pod update
      fi
      if [[ $(uname -p) == 'arm' ]]; then
        arch -x86_64 pod install
      fi
      if [[ $(uname -p) != 'arm' ]]; then
        pod install
      fi
      cd ..
    fi
    
    cd "$ROOT_DIR"

    echoColor $GREEN "---------- Done [$index/$total] ----------\n"
done

echoColor $GREEN "------------ CLEAN PROJECT DONE ------------ \n"