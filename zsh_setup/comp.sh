
# COMPLETION

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit
_comp_options+=(globdots)

# HISTORY COMPLETION
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

