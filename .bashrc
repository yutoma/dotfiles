source ~/.config/git-completion.bash
source ~/.config/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1

export PS1='\[\033[1;32m\]\u\[\033[00m\]@\[\033[1;32m\]\h\[\033[00m\]:\[\033[1;34m\]\W\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '

alias ls='ls -FA'
alias l='ls -lFA'

function share_history {
  history -a
  history -c
  history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999
