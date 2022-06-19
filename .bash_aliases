# ~/.bashrc
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

### Source Snorkel shortcuts (this was done via ./strap shortcuts install)
source /home/ubuntu/strap/devtools/shortcuts.sh

alias db='docker exec -it strap-devbox bash'
alias dbud='cd ~/strap && ./strap devbox down && ./strap devbox up'
alias tsh_login='tsh login --proxy=snorkel.teleport.sh --user=sam.huang@snorkel.ai --auth=okta'
alias key='env | grep SNORKELFLOW_API_KEY'

#file count in each subdirectory
alias rfc='du -a | cut -d/ -f2 | sort | uniq -c | sort -nr'

### bash
alias ftc='ls | rev | cut -d'.' -f1 | rev | sort | uniq -c'
alias space='df -h | grep /dev/nvme'

alias ssh='ssh -o StrictHostKeyChecking=no'
alias sshi='ssh -i ~/.ssh/workshop-shared-key.pem'

alias watch='watch -n 3 --color '

alias psa='ps auxfww'

alias aga='ag -A 10 -B 10 '

alias ls='ls -lah'

### docker
# info
alias dnames='docker ps --format "{{.Names}}"'
alias dports='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a'
# actions
alias dockernuke='docker stop $(docker ps -a -q); docker system prune -a --volumes'

### k8s
alias k='kubectl'
alias kc='kubectl config'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kl='kubectl logs'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'

alias ked='kubectl edit deployment'

alias kcc='kubectl config current-context' 
alias kcu='kubectl config use-context' 
alias kcsn='kubectl config set-context --current --namespace'
alias kcvn="kubectl config view --minify -o jsonpath='{..namespace}'"

alias kdelpv="kubectl get pv | grep Released | awk '$1 {print$1}' | while read vol; do kubectl delete pv/${vol}; done"

alias kgpa="kubectl get pods --all-namespaces"

alias ktn="kubectl top node"
alias ktp="kubectl top pod"

alias kenv="kube_ps1"  # see .bashrc_custom

### https://krew.sigs.k8s.io/plugins/
#df-pv
#

### git
alias gl="git log --pretty=format:'%C(yellow)%H %ad%Cred%d %an %Creset%s' --decorate --date=format:'%m-%d-%Y %H:%M:%S' -n 7"
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
alias gdlc="git diff HEAD^ HEAD"

alias gs="git status -s"

alias gcon="git checkout"
alias gcom="git checkout main"

alias gb="git branch"

alias gulc="git reset HEAD~"

alias grm="git rebase main"
alias grc="git rebase --continue"

alias gcvm="git cherry -v main"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"

alias gsp="git stash push -m"
alias gsl="git stash list"
alias gsa="git stash apply"

alias gp="git push"
alias gpf="git push --force"

alias grp="git checkout HEAD -- "
alias gra="git checkout ."

# list branches sorted by last modified
alias gbl="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--' | head -n 10"
alias gblr="git branch --format '%(refname:short) %(upstream)'"

### SOPs
alias j='(cd ~/journal_repo/ && gd)'
alias ja='(cd ~/journal_repo/ && ga)'

alias dds='gcoc sh/markdown-dds'