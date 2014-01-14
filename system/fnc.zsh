#!/bin/sh

# Create a new directory and enter it
function down() {
  mkdir -p "$@" && cd "$@"
}
function up() {
  i=$1
  while [ $i -gt 0 ]; do
    cd ..
    let i--
  done
}

# Copy your public ssh key to remote server for password-less login
# Usage: ssh_sesame 'tortuga'
function ssh_sesame () {
  cat ~/.ssh/id_rsa.pub | ssh $@ "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys";
}

# convert currency from command line
function curr () {
  if [ $1 == 'all' ]; then
    wget -qO- "http://hints.macworld.com/dlfiles/curr_units.txt"; echo ""
  else
    for i in $3
    do
      wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$i&hl=en" |  sed '/res/!d;s/<[^>]*>//g';
    done
  fi
}

function host-dropbox() {
  ln -s `pwd` "$HOME/Dropbox/Public/www/projects"
}

# google something
function google() {
  read F1
  F=`echo $F1 | sed s/\ /+/g`

  open "http://google.com/search?q=$F"
}

#open hipchat
function hipchat() {
  open "https://proximitybbdo.hipchat.com/chat"
}

#browse local.dev or local.own or local.repo
function browse() {
  if [[ ${PWD} == *PROJECTS* ]]
  then
    open http://local.dev/${PWD##/Users/robbiebardijn/Documents/PROJECTS}$1
  fi

  if [[ ${PWD} == *OWN_PROJECTS* ]]
  then
    open http://own.dev/${PWD##/Users/robbiebardijn/Documents/OWN_PROJECTS}$1
  fi

  if [[ ${PWD} == *REPO* ]]
  then
    open http://local.repo/${PWD##/Users/robbiebardijn/Documents/REPO}$1
  fi
}

function lp() {
  if [ -z "$1" ]
  then
    ls -loFt ~/Documents/PROJECTS/
  else
    if [ -z "$2" ]
    then
      case "$1"
      in
        -p) ls -loFt ~/Documents/PROJECTS/;;
        -o) ls -loFt ~/Documents/OWN_PROJECTS/;;
        -r) ls -loFt ~/Documents/REPO/;;
        -t) ls -loFt ~/Documents/TEMP/;;
        *) ls -loFt ~/Documents/PROJECTS/;;
      esac
    else
      case "$1"
      in
        -p) ls -loFt ~/Documents/PROJECTS/ | head -n $((${2:1} + 1));;
        -o) ls -loFt ~/Documents/OWN_PROJECTS/ | head -n $((${2:1} + 1));;
        -r) ls -loFt ~/Documents/REPO/ | head -n $((${2:1} + 1));;
        -t) ls -loFt ~/Documents/TEMP/ | head -n $((${2:1} + 1));;
        *) ls -loFt ~/Documents/PROJECTS/ | head -n $((${2:1} + 1));;
      esac
    fi
  fi
}

function i() {
  file -b `find . -name $1`;
}

function p() {
  case "$2"
  in
    -p) my= `find ~/Documents/PROJECTS/*$1* -depth 0 -type d | head -1`;;
    -o) my= `find ~/Documents/OWN_PROJECTS/*$1* -depth 0 -type d | head -1`;;
    -r) my= `find ~/Documents/REPO/*$1* -depth 0 -type d | head -1`;;
    -t) my= `find ~/Documents/TEMP/*$1* -depth 0 -type d | head -1`;;
    *) my= `find ~/Documents/PROJECTS/*$1* -depth 0 -type d | head -1`;;
  esac
  cd "$my"

  if [ -d .git ]
  then
    gst
  fi

  if [ -d .svn ]
  then
    svn status
  fi
}

function stxp() {
  case "$2"
  in
    -p) my= `find ~/Documents/PROJECTS/*$1* -depth 0 -type d | head -1`;;
    -o) my= `find ~/Documents/OWN_PROJECTS/*$1* -depth 0 -type d | head -1`;;
    -r) my= `find ~/Documents/REPO/*$1* -depth 0 -type d | head -1`;;
    -t) my= `find ~/Documents/TEMP/*$1* -depth 0 -type d | head -1`;;
    *) my= `find ~/Documents/PROJECTS/*$1* -depth 0 -type d | head -1`;;
  esac
  cd "$my"

  if [ -f "*.xiki" ]
  then
    stx
  else
    xiki
    stx
  fi
}

function fconf() {
  case "$1"
  in
    -d) my='development';;
    -p) my='production';;
    -s) my='staging';;
    -t) my='testing';;
    *) my='development';;
  esac
  cat "$(find . -name fuel -type d | head -n 1)/app/config/$my"/*
}
