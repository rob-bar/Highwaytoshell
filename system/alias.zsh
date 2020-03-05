# VIEW THIS FILE
alias alsys='cat ~/.oh-my-zsh/custom/system/alias.zsh'

# paths
################################################################################################################
alias proj='cd ~/Documents/PROJECTS/'
alias own='cd ~/Documents/BUSINESS/'
alias temp='cd ~/Documents/TEMP/'
alias expo='cd ~/Documents/EXPORTS/'
alias files='cd ~/Documents/PROX_FILES/'
alias repo='cd ~/Documents/REPO/'

alias eventp='cd ~/Documents/BUSINESS/pinkminds/eventplanner'
alias portf='cd ~/Documents/BUSINESS/portfolio'

# builds
################################################################################################################
alias bfrontend='sh $ZSH_CUSTOM/builds/frontend.sh'

# Vagrant
################################################################################################################
alias vu='vagrant up'
alias vr='vagrant reload'
alias vssh='vagrant ssh'
alias vs='vagrant share'
alias vh='vagrant halt'
alias vd='vagrant destory'
alias vp='vagrant provision'
alias va='vagrant'
alias va/='vagrant/'

################################################################################################################
alias reload!='. ~/.bash_profile'
alias hts='cd ~/.oh-my-zsh/custom'

################################################################################################################
alias vimconf='cd ~/.vim'
alias v='vim .'

################################################################################################################
alias ls='ls $LS_OPT' # long list, excludes dot files
alias ll='ls $LS_OPT -GlA' # long list all, includes dot files
alias l='ls $LS_OPT -loAF'
alias lp10='lp -p 10'
alias cwd='pwd | pbcopy' # copy current working directory to clipboard
alias md='mkdir'

################################################################################################################
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" # Get readable list of network IPs
alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # my ip
alias flushdns='echo "» dscacheutil -flushcache"; dscacheutil -flushcache' # Flush DNS cache

################################################################################################################
alias gzip='echo "» gzip -9n"; gzip -9n' # set strongest compression level as ‘default’ for gzip
alias ping='echo "» pint -c 5"; ping -c 5' # ping 5 times ‘by default’
alias hosts='subl /private/etc/hosts'

################################################################################################################
alias hist='history | grep "$@"'
alias hist-sort='history | cut -c 8- | sort | uniq -c | sort -rn'

################################################################################################################
# Clear temp files for a faster Terminal
alias fasterfaster='sudo rm -rf /private/var/log/asl/*; sudo rm -rf /var/mail/*'

# Remove spaces and replace by a dash
alias remove-spaces='for file in *; do mv "$file" "${file// /-}"; done'

# Trash a file from your Terminal
alias trash='mv "$@" ~/.Trash/'


################################################################################################################
alias codekit='open -a ~/Applications/CodeKit.app $(pwd)'
# Show hidden files in finder
alias showhiddenfiles='defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder'

# Hide hidden files in finder
alias hidehiddenfiles='defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder'

################################################################################################################
alias o='open'
alias o.='open .'

################################################################################################################
alias ochrome='cd /Users/robbiebardijn/Documents/PROJECTS/crfsa_app_mobile && ~/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="~/Library/Application\ Support/Google/Chrome/Default" --disable-web-security'

################################################################################################################
alias nextstart='cd backend/ && npm run dev;cd ../frontend && npm run dev;'

alias mazzel='masl -account jawbreaker;'
