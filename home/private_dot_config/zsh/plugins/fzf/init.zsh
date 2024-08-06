if ((!$+commands[fzf])); then
  return 1
fi

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="
  --multi
  --cycle
  --height=80%
  --layout=reverse
  --border=rounded
  --info=inline
  --select-1
  --preview='([[ -f {} ]] && (([[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file) || bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (ls --group-directories-first --color=always -CF -1 {} | less)) || echo {} 2> /dev/null | head -200'
  --bind='?:toggle-preview'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_R_OPTS="$FZF_DEFAULT_OPTS --preview-window=hidden"
export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} --type d"
export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --exit-0"

_fzf_compgen_path() {
  command fd --hidden --follow --exclude ".git" . "${1}"
}

_fzf_compgen_dir() {
  command fd --hidden --follow --exclude ".git" --type d . "${1}"
}

[[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
[[ -f "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"
