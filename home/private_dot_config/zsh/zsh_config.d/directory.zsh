# -------
# Aliases
# -------

alias -- -="cd -"

alias -g ...="../.."
alias -g ....="../../.."
alias -g .....="../../../.."
alias -g ......="../../../../.."

alias d="dirs -v"

for index in {1..9}; do
  alias "$index"="cd +${index}"
done
unset index
