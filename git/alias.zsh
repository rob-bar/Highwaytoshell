# VIEW THIS FILE
alias algit='cat ~/.oh-my-zsh/custom/git/alias.zsh'

# GIT HELP & INIT
alias gi='git init'
alias gib='git init --bare'
alias ghelp='git help'
alias ghall='git help --all'

# CONFIG
alias gcnf='cat .git/config'

# STATUSSES AND LOGS
alias gst='git status -s'
alias gwc='git whatchanged'
alias gsh='git show'
alias gshb='git show-branch'
alias gshr='git show-ref'
alias gl='git log'
alias gls='git log --stat'
alias glo='git log --oneline'
alias glg='git log --graph'

alias glogd='git log --oneline --graph --decorate'
# show pretty log with the HASH COMMITTERNAME MESSAGE RELTIME
alias glogp='git log --oneline --graph --pretty=format:"%C(yellow)%h%Creset %Cblue%cn%Creset %s %Cred%cr%Creset"'
# show pretty log with the HASH COMMITTERNAME MESSAGE ORTIME
alias glogpd='git log --oneline --graph --pretty=format:"%C(yellow)%h%Creset %Cblue%cn%Creset %s %Cred%ci%Creset"'

alias glogad='git log --oneline --graph --all --decorate'
# show pretty log with the HASH COMMITTERNAME MESSAGE RELTIME
alias glogap='git log --oneline --graph --all --pretty=format:"%C(yellow)%h%Creset %Cblue%cn%Creset %s %Cred%cr%Creset"'
# show pretty log with the HASH COMMITTERNAME MESSAGE ORTIME
alias glogapd='git log --oneline --graph --all --pretty=format:"%C(yellow)%h%Creset %Cblue%cn%Creset %s %Cred%ci%Creset"'
# show pretty log of all commits yet to be pushed remotely HASH COMMITTERNAME MESSAGE ORTIME
alias globrnp='git log --oneline --branches --not --remotes --pretty=format:"%C(yellow)%h%Creset %Cblue%cn%Creset %s %Cred%ci%Creset"'

alias glui='gitk --all'

# LOW LEVEL PLUMBING COMMANDS
# print out a hash its contents
alias gcfp='git cat-file -p'
# show unmerged contents' object name in the output
alias glfu='git ls-files -u'
# show staged contents' object name in the output
alias glfs='git ls-files -s'
# hash a specific file
alias gho='git hash-object'

# SETTING TO AND REMOVING FROM STAGING AREA
alias ga='git add'
alias ga.='git add .'
# full interactive add
alias gai='git add -i'
# immediate interactive add
alias gap='git add -p'
# removes from the staging area & from the working copy
alias grm='git rm'
# removes only from the staging area
alias grmc='git rm --cached'
alias grmcall='git rm --cached *'
alias gcp='git cherry-pick'

# (LOCAL REPO CHANGING) COMMITTING BRANCHING DIFFING & CHECKING OUT
# - COMMITS
alias gc='git commit'
alias gcm='git commit -m'
alias gcam='git commit --amend -m'

# - BRANCHES & MERGES
alias gb='git branch'
# show remote branches
alias gbr='git branch -r'
# show all branches
alias gba='git branch -a'
# delete branche
alias gbd='git branch -d'
# force delete branche
alias gbD='git branch -D'


# delete remote brancg
alias gbdr='git push origin --delete'
alias gm='git merge'

# - CHECKOUT
alias gco='git checkout'
# checkout commit and make branch
alias gcob='git checkout -b'
# checkout and merge while checking out
alias gcom='git checkout -m'
# checkout all files that you changed (so discarding all changes)
alias gcof='git checkout -f'
# checkout my files in merge conflict
alias gcoo='git checkout --ours'
# checkout other files in merge conflict
alias gcot='git checkout --theirs'
# checkout branch and copy the previous branch to the clipboard for quicker merge
alias gcoc='git rev-parse --abbrev-ref HEAD | pbcopy && git checkout'

# - DIFF
alias gd='git diff'
# when merge conflict watch difference for current head
alias gdh='git diff HEAD'
# when merge conflict watch difference for merging head
alias gdmh='git diff MERGE_HEAD'
# Checks difference between added files and last commmit
alias gdch='git diff --cached HEAD'
# Checks difference between commits, show the names of the files for deployment
alias gdno='gd --name-only'

# - RESET
alias grs='git reset'
alias grshead='git reset HEAD'
alias grsm='git reset --mixed'
alias grss='git reset --soft'
alias grsh='git reset --hard'

# - STASH
alias gs='git stash'
alias gsp='git stash pop'
alias gss='git stash show'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gsd='git stash drop'
alias gsiu='git stash --include-untracked'

# - REFLOG
alias grfl='git reflog'

# - BLAME
alias gbl='git blame'

# REMOTE MANIPULATIONS
# - PUSH
alias gps='git push'
alias gpsf='git push -f'
alias gpso='git push origin'
alias gpsom='git push origin master'
alias gpsod='git push origin develop'
alias gpsos='git push origin staging'
# delete remote branche
alias gpsd='git push origin --delete'

# - PULL
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplo='git pull origin'
alias gplom='git pull origin master'
alias gplod='git pull origin develop'
alias gplos='git pull origin staging'

# - PULL & PUSH
alias gpp='gpl && gpso'

# - CLONE
alias gcl='git clone'
alias gclr='git clone --recursive'

# - FETCH
alias gf='git fetch'

# - REMOTES
alias glsrem='git ls-remote'
alias grema='git remote add'
alias grems='git remote show'
alias gremu='git remote update'
alias gremup='git remote update --prune'
alias gremp='git remote prune'
alias gremsu='git remote set-url'

# - SUBMODULES
alias gsuba='git submodule add'
alias gsubs='git submodule status'
alias gsubi='git submodule init'
alias gsubu='git submodule update'
alias gsubsu='git submodule summary'

# - GIT SVN
alias gsvn='git svn'
alias gsvncl='git svn clone'

# ARCHIVE EXPORT AND PULL ALL REPOS
alias pall='find ~/Documents/REPO -type d -name .git | xargs -n 1 dirname | sort | while read line; do echo $line && cd $line && git pull; done'
alias gam='git archive master | tar -x -C $@'
