if ((!$+commands[zoxide])); then
  return 1
fi

export _ZO_DATA_DIR="$HOME/.cache/zoxide"
export _ZO_EXCLUDE_DIRS="$HOME"
export _ZO_RESOLVE_SYMLINKS=1

eval "$(zoxide init zsh)"
