#!/bin/bash

gmerged() {
    BRANCH=`git rev-parse --abbrev-ref HEAD`
    MASTER=master
    if [ `git rev-parse --verify main 2>/dev/null` ]; then
        MASTER=main
    fi
    git checkout $MASTER
    git pull
    git branch -D $BRANCH
    git remote prune origin
}

