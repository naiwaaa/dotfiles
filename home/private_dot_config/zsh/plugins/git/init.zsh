# Return if requirements are not found.
if ((!$+commands[git])); then
  return 1
fi

# load 'run-help' function
autoload -Uz run-help-git
