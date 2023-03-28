# ~/.bashrc
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

### Source Snorkel shortcuts (this was done via ./strap shortcuts install)
source /home/ubuntu/strap/devtools/shortcuts.sh

alias s='./strap'
alias rf='ruff --fix .'
alias db='docker exec -it strap-devbox bash'
alias dbud='cd ~/strap && ./strap devbox down && ./strap devbox up'
alias tsh_login='tsh login --proxy=snorkel.teleport.sh --user=sam.huang@snorkel.ai --auth=okta'
alias key='env | grep SNORKELFLOW_API_KEY'
alias lc='./strap lint --skip yarn,safety'

alias dlhs='./strap release --internal --services lighthouse && ./deploy-tools/flow/k8s/upgrade-eks-internal.sh -s lighthouse -v $(git rev-parse HEAD) -e staging && git checkout HEAD -- kubernetes/internal/lighthouse/overlays/staging/kustomization.yaml'

alias jc='jira issue create -t Story -C Provisioning --fix-version "N/A (nothing to release)" --no-input -s'

#file count in each subdirectory
alias rfc='du -a | cut -d/ -f2 | sort | uniq -c | sort -nr'

### bash
alias ftc='ls | rev | cut -d'.' -f1 | rev | sort | uniq -c'
alias space='df -h | grep /dev/nvme'

alias ssh='ssh -o StrictHostKeyChecking=no'
alias sshi='ssh -i ~/.ssh/workshop-shared-key.pem'

alias watch='watch -n 3 --color '
alias watchm='watch -n 60 --color '

alias psa='ps auxfww'

alias ag='ag --ignore-dir={**/.env,**/yarn.lock,**/yarn-error.log} '

alias ls='ls -lah'

### docker
alias d='docker'
#### info
alias dnames='docker ps --format "{{.Names}}"'
alias dports='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a'
#### actions
alias dockernuke='docker stop $(docker ps -a -q); docker system prune -a --volumes'

### k8s
alias k='kubectl'
alias kk='kubectl krew'
alias kc='kubectl config'
alias kcg='kubectl config get-contexts'
alias ks='kubectl stern'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgd='kubectl get deployments'
alias kl='kubectl logs'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kdd='kubectl describe deployment'

alias ked='kubectl edit deployment'

alias kcc='kubectl config current-context' 
alias kcu='kubectl config use-context' 
alias kcsn='kubectl config set-context --current --namespace'
alias kcvn="kubectl config view --minify -o jsonpath='{..namespace}'"

alias kdelpv="kubectl get pv | grep Released | awk '$1 {print$1}' | while read vol; do kubectl delete pv/${vol}; done"

alias kgpa="kubectl get pods --all-namespaces"

alias kpf="kubectl port-forward --address 0.0.0.0"

alias ktn="kubectl top node"
alias ktp="kubectl top pod"

alias kenv="kube_ps1"  # see .bashrc_custom

### https://krew.sigs.k8s.io/plugins/
#df-pv
#

### yarn
alias yt="yarn test --silent"
alias yf="yarn format"
alias yl="yarn lint --fix"

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
alias gdflc="git diff --name-only HEAD HEAD~1"

alias gdm="git diff main...HEAD"
alias gdfm="git diff --name-only main...HEAD"

alias gs="git status -s"

alias gcon="git checkout"
alias gcom="git checkout main"

alias gb="git branch"

# unstage last commit
alias gulc="git reset HEAD~"
# unstage all
alias grh="git reset HEAD"
# discard all local changes
alias grhh="git reset --hard HEAD"
# reset path to HEAD
alias grp="git checkout HEAD -- "

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
alias gpd="git push --dry-run"
alias gpn="git push --no-verify"

alias gprm="git pull --rebase origin main"

# list branches sorted by last modified
alias gbl="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--' | head -n 10"
alias gblr="git branch --format '%(refname:short) %(upstream)'"

### SOPs
alias j='(cd ~/journal_repo/ && gd)'
alias ja='(cd ~/journal_repo/ && ga)'

alias dds='gcoc sh/markdown-dds'