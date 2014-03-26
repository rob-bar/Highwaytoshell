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
alias tsp2='tmux split-window -h -p 20'
alias tsp3='tmux split-window -h -p 30'
alias tsp5='tmux split-window -h -p 50'
alias tsp8='tmux split-window -h -p 80'

# SWITCH PANES
alias tmsp='tmux select-pane'
alias tu='tmux select-pane -U'
alias td='tmux select-pane -D'
alias tl='tmux select-pane -L'
alias tr='tmux select-pane -R'
