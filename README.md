## Dev Setup
### Mac OS
* Iterm2 + Oh my zsh + Powerlevel10k
* Raycast
* et (install on remote) or mosh (no install on remote)
* superpowered
* fig
* displaylink manager

### Terminal
* exa
* the_silver_searcher (ag)
* tmux  
    * `tmux a -t [TAG] -d` to resize screen
* pbcopy (e.g. pbcopy < ~/.ssh/id_ed25519.pub)
* fzf
* glances [-2]

#### Commands
* ssh-agent (see https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* fzf → ** + tab for autocomplete (works for files, ssh, and kill -9)
* eval "$(ssh-agent -s)"
* type CMD # will show command referenced by alias
    * type -a CMD # will show all referenced commands in order of precedence

#### Tips
* control + r → search previous commands
* If you are using the Pylance VSCode extension you can set your source folder via the setting `python.analysis.extraPaths` (this fixes project imports not resolving)
* git
    * git cherry -v main  # see differing commits
    * git diff [--stat] [--cached] HEAD^
    * git checkout experiment -- app.js  # copy the changes to app.js in branch "experiment"
    * https://stackoverflow.com/questions/9864728/how-to-get-git-to-clone-into-current-directory
* cleanup
    * docker system prune -a
* iterm2
    * https://iterm2.com/documentation-captured-output.html
    * 

#### Optimizations
* https://coderwall.com/p/ds2dha/word-line-deletion-and-navigation-shortcuts-in-iterm2
* https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0
* https://garywoodfine.com/use-pbcopy-on-ubuntu/
* https://stackoverflow.com/questions/9604723/alternate-output-format-for-psql       

### Chrome
* Custom Search Engines (e.g. sh -> explainshell.com)

