if ((!$+commands[cargo])); then
  return 1
fi

# ---------
# Variables
# ---------

export CARGO_HOME="$XDG_DATA_HOME"/cargo
