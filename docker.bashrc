#!/usr/bin/env bash

alias d='docker'
alias dc='docker compose'
alias dcup='docker compose up -d'
alias dcdw='docker compose down'

servestatic() {
  docker run -it --rm -v$PWD:/usr/share/nginx/html -p8080:80 nginx
}
