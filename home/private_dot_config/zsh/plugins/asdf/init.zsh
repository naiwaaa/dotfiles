if ((!$+commands[asdf])); then
  return 1
fi

# ---------
# Variables
# ---------

export ASDF_DATA_DIR="${XDG_DATA_HOME}"/asdf
export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}"/asdf/asdfrc

# --------------
# Initialization
# --------------

ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"

if [[ ! -f "$ASDF_DIR/asdf.sh" ]]; then
  if [[ -f "/opt/asdf-vm/asdf.sh" ]]; then
    ASDF_DIR="/opt/asdf-vm"
  fi
fi

if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  source "$ASDF_DIR/asdf.sh"
fi
