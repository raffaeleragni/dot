#!/bin/bash

alias g='git'
__git_complete g _git

alias gt='git tag '
alias gd='git diff '
alias gdc='git diff --cached '
alias gpt='git push --tags '
alias gpu='git pull '
alias gl='git log '
alias gs='git status '
alias gadd='git add '
alias gcam='git commit --amend --no-edit'
alias gcams='git commit -S --amend --no-edit'
alias grpo='git remote prune origin '
alias gpdot='cd ~/.dot; git pull; cd -'

alias gb='git branch '
__git_complete gb _git_branch

alias gco='git checkout '
__git_complete gco _git_checkout

alias gp='git push '
__git_complete gp git_push

gcm() {
  git commit -m"$*"
}

gcms() {
  git commit -S -m"$*"
}

gsync() {
  for i in `ls`; do
    cd $i && git checkout master && git pull
    cd -
  done
}
