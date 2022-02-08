
# Source Snorkel shortcuts (this was done via ./strap shortcuts install)
source /home/ubuntu/strap/devtools/shortcuts.sh

# ~/.bashrc

# projects
alias lighthouse='cd ~/strap/src/python/internal/lighthouse'


# docker
## applying to all containers
### info
alias dnames="docker ps --format '{{.Names}}'"
alias dports="docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a"
### actions
alias dockernuke="docker stop $(docker ps -a -q); docker system prune -a --volumes"


# k8s
alias k='kubectl'
alias kc='kubectl config'
alias kg='kubectl get'
alias kl='kubectl logs'
alias kd='kubectl describe'

alias kcc='kubectl config current-context' 
alias kcu='kubectl config use-context' 

# git
alias gl='git log --pretty=format:"%C(yellow)%H %ad%Cred%d %an %Creset%s" --decorate --date=short'
alias ga="git add ."
alias gap="git add -p"

alias gc="git commit --verbose"
alias gca="git commit --amend --no-edit --verbose"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gm="git commit --amend --verbose"


alias gd="git diff"
alias gds="git diff --stat"
alias gdc="git diff --cached"

alias gs="git status -s"

alias gco="git checkout"
alias gcob="git checkout -b"

alias gb="git branch"

alias gcvm="git cherry -v main"

alias gsp="git stash push -m"
alias gsl="git stash list"
alias gsa="git stash apply"

#### list branches sorted by last modified
alias gbl="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
alias gpsup="git push --set-upstream origin $(gbl | awk 'NR==1{print $8}')"