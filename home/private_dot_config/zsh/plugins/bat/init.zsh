if ((!$+commands[bat])); then
  return 1
fi

# -------
# Aliases
# -------

alias -g B="| bat"
alias -g H="| bat --plain --language=help"
alias -g -- --help="--help 2>&1 | bat --plain --language=help"
