path+="$HOME"/.local/share/npm/bin

# ---------
# Variables
# ---------

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

# ---------
# Aliases
# ---------

if (( $+commands[pnpm] )); then
  alias pn="pnpm"
  alias pnx="pnpm dlx"
fi

