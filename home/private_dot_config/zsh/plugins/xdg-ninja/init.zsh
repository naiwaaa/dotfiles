# android
if (($+commands[android])); then
  export ANDROID_HOME="$XDG_DATA_HOME"/android
  alias adb="HOME=$ANDROID_HOME adb"
fi

# aws-cli
if (($+commands["aws-cli"])); then
  export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
  export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
fi

# cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# gnupg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# gtk
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# less
if (($+commands[less])); then
  export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
fi

# nvidia
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME"/.config/ripgrep/config

# wget
alias wget="wget --hsts-file="$XDG_DATA_HOME/wget-hsts""
