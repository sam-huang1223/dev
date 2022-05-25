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

#### tmux
tmuxa () {
    tmux a -t $1 -d
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

gacap () {
    git add .
    git commit --amend --no-edit --verbose
    git push
}


### k8s
# set namespace first using kcsn
kdps () {
    kubectl get pods --field-selector "status.phase=$1" -o name | xargs kubectl delete
}

# e.g. kpf engine-dask-scheduler 15200:15100
kpf () {
    kubectl port-forward svc/$1 $2 --address 0.0.0.0
}

ks () {
    kubectl scale --replicas=$2 deployment $1
}


### bazel
btp () {
    # e.g. cdi //src/python/internal/lighthouse_installer lighthouse-installer testdrive-1
    docker exec strap-devbox bazel run "$1:image"
    docker tag "snorkelai/$2:bazel" "snorkelai/$2:$3"
    docker push "snorkelai/$2:$3"
}

### snorkel
lhf () {
    kl $(kg pods -n lighthouse -o custom-columns=':metadata.name' | sed -n $(($1+1))p) -n lighthouse -f
}

# run test with breakpoint() - has to be run inside devbox
tkbp () {
    cat /dev/tty | bazel run "test/python/$1" "--test_arg=-k=$2" --test_arg=--disable-pytest-warnings
}

# run test without breakpoint()
tk () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings --test_arg=-vvv --test_arg=-s --test_arg=-k="$2" --test_arg=--log-cli-level=INFO
}

# run test suite without breakpoint()
t () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings  --test_arg=-s
}