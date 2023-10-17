if ((!$+commands[direnv])); then
  return 1
fi

eval "$(direnv hook zsh)"
