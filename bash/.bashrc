# Custom commands
alias rman="apropos . | shuf -n 1 | awk '{print $1}'| xargs man"

export TERM=xterm-256color

# Share history accross terminals
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Enable vi mode
set -o vi

