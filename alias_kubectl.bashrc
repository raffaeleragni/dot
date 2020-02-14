#!/bin/bash

k() {
  kubectl $*
}
kc() {
  if [ ! -z "$1" ] ; then
    kubectl config use-context $1
  fi
  kubectl config get-contexts
}

