#!/bin/bash

alias gt='git tag '
alias gd='git diff '
alias gdc='git diff --cached '
alias gb='git branch '
alias gco='git checkout '
alias gp='git push '
alias gpt='git push --tags '
alias gpu='git pull '
alias gl='git log '
alias gs='git status '
alias gadd='git add '
alias gcam='git commit --amend --no-edit'
alias gcams='git commit -S --amend --no-edit'
alias grpo='git remote prune origin '
alias gpdot='cd ~/.dot; git pull; cd -'

gcm() {
  git commit -m"$*"
}

gcms() {
  git commit -S -m"$*"
}
