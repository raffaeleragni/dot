#!/usr/bin/env bash

installtools() {

BINDIR="$HOME/bin"
if [ ! -d $BINDIR ]; then
    mkdir -p $BINDIR 
fi

if [ ! -f "$BINDIR/kubectl" ]; then
    cd $BINDIR
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod a+x "$BINDIR/kubectl"
fi

if [ ! -f "$BINDIR/helm" ]; then
    TMP=`mktemp -p -t`
    cd $TMP
    curl -LO "https://get.helm.sh/helm-v3.14.1-linux-amd64.tar.gz"
    tar xzf helm-v3.14.1-linux-amd64.tar.gz
    cd linux-amd64
    chmod a+x helm
    cp helm $BINDIR/helm
fi

if [ ! -f "$BINDIR/terraform" ]; then
    TMP=`mktemp -p -t`
    cd $TMP
    curl -LO "https://releases.hashicorp.com/terraform/1.7.3/terraform_1.7.3_linux_amd64.zip"
    unzip terraform_1.7.3_linux_amd64.zip
    chmod a+x terraform
    cp terraform $BINDIR/terraform
fi

}

