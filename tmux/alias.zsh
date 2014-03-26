# VIEW THIS FILE
alias altmux='cat ~/.oh-my-zsh/custom/tmux/alias.zsh'
alias tmux='TERM=xterm-256color tmux'

# SESSIONS
alias tmn='tmux new -s'
alias tma='tmux attach -t'
alias tms='tmux switch -t'
alias tmls='tmux ls'
alias tmd='tmux detach'

# PANES
alias tmsph='tmux split-window -h -p'
alias tmspv='tmux split-window -v -p'

# SWITCH PANES
alias tmsp='tmux select-pane'
alias tu='tmux select-pane -U'
alias td='tmux select-pane -D'
alias tl='tmux select-pane -L'
alias tr='tmux select-pane -R'
