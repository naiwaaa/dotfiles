if ((!$+commands[rsync])); then
  return 1
fi

# -------
# Aliases
# -------

alias rsync-cp='rsync -avz --progress -h'
alias rsync-update="rsync -avzu --progress -h"
alias rsync-sync="rsync -avzu --delete --progress -h"
