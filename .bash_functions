#!/bin/bash

# ~/.bashrc

gpsup () {
    git push --set-upstream origin $(gbl | awk 'NR==1{print $8}')
}

# snorkel
lhf () {
    kl $(kg pods -n lighthouse -o custom-columns=':metadata.name' | tail -n 1) -n lighthouse -f
}