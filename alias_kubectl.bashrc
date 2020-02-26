#!/bin/bash

k() {
  kubectl $*
}

ka() {
  kubectl --all-namespaces $*
}


kc() {
  if [ ! -z "$1" ] ; then
    kubectl config use-context $1
  fi
  kubectl config get-contexts
}

kw() {

  local session="kiwi_${1}"

  local FILTERS=${FILTERS:="$*"}
  local CMD_HPA="kubectl get hpa ${FILTERS}"
  local CMD_PODS="kubectl get pods ${FILTERS} | grep -v Running | grep -v Completed"
  local CMD_DEPLOYMENTS="kubectl get deployments ${FILTERS}"
  local WATCH="watch --no-title --color --differences"
  local WATCH_HPA="${WATCH} \"${CMD_HPA}\""
  local WATCH_PODS="${WATCH} \"${CMD_PODS}\""
  local WATCH_DEPLOYMENTS="${WATCH} \"${CMD_DEPLOYMENTS}\""

  tmux start-server
  tmux new-session -d -s $session -x $(tput cols) -y $(tput lines)

  tmux send-keys "$WATCH_PODS" C-m

  tmux splitw -v -b -l 18

  tmux send-keys "$WATCH_HPA" C-m

  tmux selectp -t 2
  tmux splitw -v -b -l 10

  tmux send-keys "$WATCH_DEPLOYMENTS" C-m

  tmux attach-session -t $session

}

function kmerge() {
  KUBECONFIG=~/.kube/config:$1 kubectl config view --flatten > ~/.kube/mergedkub && mv ~/.kube/mergedkub ~/.kube/config
}
