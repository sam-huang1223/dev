#!/bin/bash

# ~/.bashrc
#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi

# snorkel
jv () {
    jira issue view ENG-$1
}

ja () {
    jira issue comment add ENG-$1 "$2" --no-input
}

# bash
up () {
    levels=$1

    while [ "$levels" -gt "0" ]; do
        cd ..
        levels=$(($levels - 1))
    done
}

gt () {
    mkdir $1 && cd $1
}

# tmux
tmuxa () {
    tmux a -t $1 -d
}

# git
gpsup () {
    git push --set-upstream origin $(gbl | awk 'NR==1{print $8}')
}

gpsupd () {
    git push --set-upstream origin $(gbl | awk 'NR==1{print $8}') --dry-run
}

# see https://stackoverflow.com/questions/19821749/git-cherry-pick-or-merge-specific-directory-from-another-branch
# e.g. git format-patch -k --stdout master...featureA -- tools/mytool | git am -3 -k
gaf () {
    git format-patch -k --stdout $1 -- $2 | git am -3 -k
}

gac () {
    git am --continue
}

# gbfl FILE_PATH LINE_NUMBER_START LINE_NUMBER_END
gbfl () {
    git blame -L "$2,$3" -- $1
}

gbd () {
    git branch -D sh/ENG-$1
}

gco () {
    git checkout sh/ENG-$1
}

gcomf () {
    git checkout origin/main $1
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

# docker
dps () {
    docker ps --format 'table {{.Names}}\t{{.RunningFor}}'
}

den () {
    docker exec -it -u root $(docker ps | grep $1 | cut -d ' ' -f1) /bin/bash
}


# k8s
# set namespace first using kcsn
kdps () {
    kubectl get pods --field-selector "status.phase=$1" -o name | xargs kubectl delete
}

# e.g. kpf engine-dask-scheduler 15200:15100
kpfsvc () {
    kubectl port-forward svc/$1 $2 --address 0.0.0.0
}

krur () {
    kubectl rollout undo $1 --to-revision=$2
}

# snorkel
## perf

# [Docker] After starting the command below, just use Snorkel Flow normally (or do whatever activity you want to profile for e.g. when trying to speed up LF applies when refreshing, you'd start profiling and then refresh the Studio tab a bunch of times). Then Ctrl-C the process, scp the file to your macbook and open the profile file in the browser.
psrs () {
    py-spy record --subprocesses --rate 10 -o my_profile.svg --pid $(docker inspect -f '{{.State.Pid}}' $1)
}

## k8s
lhf () {
    kl $(kg pods -n lighthouse -o custom-columns=':metadata.name' | sed -n $(($1+1))p) -n lighthouse -f
}

kedb () {
    kubectl exec --stdin --tty $1 -- psql -U postgres
}

## build
bs () {
    ./strap build --bootstrap --skip-ui --services $1 --hot-reload --disable-doctor
}

btp () {
    # e.g. btp //src/python/internal/lighthouse_installer lighthouse-installer testdrive-1
    docker exec strap-devbox bazel run "$1:image"
    docker tag "snorkelai/$2:bazel" "snorkelai/$2:$3"
    docker push "snorkelai/$2:$3"
}

## trivy
tscan () {
    trivy image --severity $2 --format json "snorkelai/$1" | grep -i -v INFO | python -m hjson.tool -j | jq
}

tscani () {
    trivy image --ignore-unfixed --severity $2 --format json "snorkelai/$1" | grep -i -v INFO | python -m hjson.tool -j | jq '.'
}

tscanv () {
    trivy image --severity $2 --format json "snorkelai/$1" | grep -i -v INFO | python -m hjson.tool -j | jq '.[] | .Vulnerabilities | try .[] | select(.VulnerabilityID=="'"$3"'")'
}

## tests
# run test with breakpoint() - has to be run inside devbox
tkbp () {
    cat /dev/tty | bazel run "test/python/$1" "--test_arg=-k=$2" --test_arg=--disable-pytest-warnings
}

# run test without breakpoint()
tk () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings --test_arg=-vvv --test_arg=-s --test_arg=-k="$2" --test_arg=--log-cli-level="${3:-ERROR}"
}

# run test suite without breakpoint()
t () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings --test_arg=-s
}

# run test suite without cache and with full output
tf () {
    ./strap test python "test/python/$1" --test-output=all
}

# run test suite without breakpoint() with -v
tv () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings  --test_arg=-s --test_arg=-v
}

# run test suite without breakpoint() with -vv
tvv () {
    docker exec strap-devbox bazel run "test/python/$1" --test_arg=--disable-pytest-warnings  --test_arg=-s --test_arg=-vv
}