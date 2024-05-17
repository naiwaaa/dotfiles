# -------
# Aliases
# -------

alias ls="ls --color=auto --group-directories-first"

# lists in one column, hidden files
alias l="ls -1A"

# lists human readable sizes
alias ll="ls -lh"

# lists human readable sizes, recursively
alias lr="ll -R"

# lists human readable sizes, hidden files
alias la="ll -A"

# lists sorted by size, largest last
alias lk="ll -Sr"

# lists sorted by date, most recent last
alias lt="ll -tr"

# lists sorted by date, most recent last, shows change time
alias lc="lt -c"

# lists sorted by date, most recent last, shows access time
alias lu="lt -u"

# chmod
alias x+="chmod u+x"
alias x-="chmox u-x"

# file download
alias download="aria2c --max-concurrent-downloads=2 --split=16 --max-connection-per-server=16 --remote-time"

# resource  usage
alias df="df -kh"
alias du="du -kh"
alias topc="top -o %CPU"
alias topm="top -o %MEM"

# piping
alias -g L="| less"
alias -g G="| grep"

#
#
#

# color setup for ls
eval "$(dircolors --sh $HOME/.dir_colors(.N))"

# load 'run-help' function
(($ + aliases[run - help])) && unalias run-help && autoload -Uz run-help
autoload -Uz run-help-{ip,openssl,sudo}

# auto run `ls` after every `cd`
function chpwd() {
  emulate -L zsh
  ls
}
