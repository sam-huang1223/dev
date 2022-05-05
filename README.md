# Dev Environment
## Mac OS
* Iterm2 + Oh my zsh + Powerlevel10k
* Raycast
* et (needs install on remote)
* superpowered
* fig
* displaylink manager

## Terminal
* exa
* the_silver_searcher (ag)
* tmux  
    * `tmux a -t [TAG] -d` to resize screen
* pbcopy (e.g. pbcopy < ~/.ssh/id_ed25519.pub)
* fzf
* glances [-2]

### Commands
* ssh-agent (see https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
* fzf → ** + tab for autocomplete (works for files, ssh, and kill -9)
* eval "$(ssh-agent -s)"
* type CMD # will show command referenced by alias
    * type -a CMD # will show all referenced commands in order of precedence

### Tips
* bash
    * control + r → search previous commands
    * _command_ 2>&1 | tee -a some_file → redirects standard error to standard output and standard output to some_file and also print it to standard output
* VSCode
    * If you are using the Pylance VSCode extension you can set your source folder via the setting `python.analysis.extraPaths` (this fixes project imports not resolving)
    * CMD+P to search for a file
    * CMD+SHIFT+F to find
* git
    * git cherry -v main  # see differing commits
    * git diff [--stat] [--cached] HEAD^
    * git checkout experiment -- app.js  # copy the changes to app.js in branch "experiment"
    * https://stackoverflow.com/questions/9864728/how-to-get-git-to-clone-into-current-directory
* cleanup
    * docker system prune -a
* iterm2
    * https://iterm2.com/documentation-captured-output.html

#### Optimizations
* https://coderwall.com/p/ds2dha/word-line-deletion-and-navigation-shortcuts-in-iterm2
* https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0
* https://garywoodfine.com/use-pbcopy-on-ubuntu/
* https://stackoverflow.com/questions/9604723/alternate-output-format-for-psql       

## Chrome
### Extensions
* GoLinks
* DashLane
* ClockWise
* OneTab

### Custom Search Engines
* sh -> https://explainshell.com/explain?cmd=%s
* g -> https://github.com/search?q=%s&ref=opensearch
* j -> https://snorkelai.atlassian.net/secure/QuickSearch.jspa?searchString=%s
* m -> https://www.google.com/maps/search/%s/?authuser=0
* b -> https://github.com/snorkel-ai/strap/branches/all?query=%s
* y -> https://www.youtube.com/results?search_query=%s&page={startPage?}&utm_source=opensearch

