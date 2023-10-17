# treat these characters as part of a word
WORDCHARS="*?_-.[]~&;!#$%^(){}<>"

# smart URLs
autoload -Uz url-quote-magic bracketed-paste-url-magic
zle -N self-insert url-quote-magic
zle -N bracketed-paste bracketed-paste-url-magic

# allow mapping Ctrl+S and Ctrl+Q shortcuts
[[ -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]] && stty -ixon <$TTY >$TTY
