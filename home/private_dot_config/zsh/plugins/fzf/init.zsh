if ((!$+commands[fzf])); then
  return 1
fi

local rose_pine="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

export FZF_COLOR_SCHEME=${rose_pine}
unset rose_pine

export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git'"
export FZF_DEFAULT_OPTS="
  ${FZF_COLOR_SCHEME}
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
