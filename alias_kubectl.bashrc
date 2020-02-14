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

function kmerge() {
  KUBECONFIG=~/.kube/config:$1 kubectl config view --flatten > ~/.kube/mergedkub && mv ~/.kube/mergedkub ~/.kube/config
}
