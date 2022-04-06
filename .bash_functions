#!/bin/bash

# ~/.bashrc
#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi

# bash
up () {
    levels=$1

    while [ "$levels" -gt "0" ]; do
        cd ..
        levels=$(($levels - 1))
    done
}

# git
gpsup () {
    git push --set-upstream origin $(gbl | awk 'NR==1{print $8}')
}

gco () {
    git checkout sh/ENG-$1
}

gcoc () {
    git checkout $1
}

gcob () {
    git checkout -b sh/ENG-$1
}

gcobc () {
    git checkout -b $1
}

# k8s
ksdn () {
    kubectl config set-context --current --namespace $1
}

# snorkel
lhf () {
    kl $(kg pods -n lighthouse -o custom-columns=':metadata.name' | tail -n 1) -n lighthouse -f
}