if (( ! $+commands[docker] )); then
  return 1
fi

# ---------
# Variables
# ---------

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

# -------
# Aliases
# -------

# docker daemon service
alias dk-start="systemctl start --now docker"
alias dk-stop="systemctl stop --now docker"
alias dk-restart="systemctl restart --now docker"

# docker
alias dk="docker"

# docker-compose
(( ${+commands[docker-compose]} )) && dkc_cmd="docker-compose" || dkc_cmd="docker compose"

alias dkc="${dkc_cmd}"
alias dkcu="$dkc_cmd up"
alias dkcud="$dkc_cmd up -d"
alias dkcd="$dkc_cmd down"
