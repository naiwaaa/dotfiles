if ((!$+commands[starship])); then
  return 1
fi

eval "$(starship init zsh)"
