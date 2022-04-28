#!/bin/bash

# ~/.bashrc
#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi

### bash
up () {
    levels=$1

    while [ "$levels" -gt "0" ]; do
        cd ..
        levels=$(($levels - 1))
    done
}

### git
gpsup () {
    git push --set-upstream origin $(gbl | awk 'NR==1{print $8}')
}

gbd () {
    git branch -D sh/ENG-$1
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

### k8s
kdps () {
    kubectl get pods --field-selector "status.phase=$1" -o name | xargs kubectl delete
}


### snorkel
lhf () {
    kl $(kg pods -n lighthouse -o custom-columns=':metadata.name' | tail -n 1) -n lighthouse -f
}

# run test with breakpoint()
tbp () {
    bazel run "test/python/$1" "--test_arg=-k=$2"
}

# run test without breakpoint()
t () {
    bazel run "test/python/$1" --test_arg=--disable-pytest-warnings --test_arg=-vvv --test_arg=-s --test_arg=-k="$2" --test_arg=--log-cli-level=INFO
}