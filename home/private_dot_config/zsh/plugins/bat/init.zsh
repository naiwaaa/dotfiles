if ((!$+commands[bat])); then
  return 1
fi

# -------
# Aliases
# -------

alias -g B="| bat"
alias -g -- -h="-h 2>&1 | bat --language=help --style=plain"
alias -g -- --help="--help 2>&1 | bat --language=help --style=plain"
