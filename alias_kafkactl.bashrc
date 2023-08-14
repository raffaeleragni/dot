#!/bin/bash

kk() {
  if [ ! -z "$1" ] ; then
    kafkactl $*
  else
    kafkactl
    kafkactl config get-contexts
  fi
}

kkc() {
  if [ ! -z "$1" ] ; then
    kafkactl config use-context $1
  fi
  kafkactl config get-contexts
}

