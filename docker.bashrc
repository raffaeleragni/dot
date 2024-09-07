#!/usr/bin/env bash

if [ ! -z "`which podman`" ]; then
    alias docker='podman'
    alias d='podman'
    alias dc='podman-compose'
else
    alias d='docker'
    alias dc='docker compose'
fi

alias dcup='dc up -d'
alias dcdw='dc down'

dcc() {
  dcdw && dcup ; dcdw
}

servestatic() {
  docker run -it --rm -v$PWD:/usr/share/nginx/html -p8080:80 nginx
}
