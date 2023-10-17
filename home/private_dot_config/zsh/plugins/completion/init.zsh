# --------------
# Initialization
# --------------

# load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day
autoload -Uz compinit
_comp_path="$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# #q expands globs in conditional expressions
if [[ $_comp_path(#qNmh-20) ]]; then
  # -C (skip function check) implies -i (skip security check)
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_path:h"
  compinit -i -d "$_comp_path"
  # keep $_comp_path younger than cache time even if it isn"t regenerated
  touch "$_comp_path"
fi
unset _comp_path

# ------
# Styles
# ------

zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*:default" list-prompt "%S%M matches%s"

# use caching to make completion for commands such as dpkg and apt usable
zstyle ":completion::complete:*" use-cache on
zstyle ":completion::complete:*" cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

# case-insensitive (all), partial-word, and then substring completion
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
unsetopt CASE_GLOB

# fuzzy match mistyped completions
zstyle ":completion:*" completer _complete _match _approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric

# do not complete unavailable commands
zstyle ":completion:*:functions" ignored-patterns "(_*|pre(cmd|exec))"

# directories
zstyle ":completion:*:*:cd:*" tag-order local-directories directory-stack path-directories
zstyle ":completion:*:*:cd:*:directory-stack" menu yes select
zstyle ":completion:*:-tilde-:*" group-order "named-directories" "path-directories" "users" "expand"
zstyle ":completion:*" squeeze-slashes true

# history
zstyle ":completion:*:history-words" stop yes
zstyle ":completion:*:history-words" remove-all-dups yes
zstyle ":completion:*:history-words" list false
zstyle ":completion:*:history-words" menu yes

# environment variables
zstyle ":completion::*:(-command-|export):*" fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# do not complete uninteresting users
zstyle ":completion:*:*:*:users" ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs "_*"

# SSH/SCP/rsync
zstyle ":completion:*:(ssh|scp|rsync):*" tag-order "hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *"
zstyle ":completion:*:(scp|rsync):*" group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ":completion:*:ssh:*" group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-host" ignored-patterns "*(.|:)*" loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-domain" ignored-patterns "<->.<->.<->.<->" "^[-[:alnum:]]##(.[-[:alnum:]]##)##" "*@*"
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-ipaddr" ignored-patterns "^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))" "127.0.0.<->" "255.255.255.255" "::1" "fe80::*"
