if ((!$+commands[mise])); then
  return 1
fi

# ---------
# Variables
# ---------

export MISE_NODE_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME"/mise/default-node-packages
export MISE_PYTHON_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME"/mise/default-python-packages

# -------
# Aliases
# -------

alias mx="mise exec"
alias mr="mise run"

# --------------
# Initialization
# --------------

eval "$(mise activate zsh)"
