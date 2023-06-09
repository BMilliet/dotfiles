
# EXPORTS

export EDITOR=vim
# export EDITOR=nvim

# ALIAS

alias l="ls -la"

alias gst="git status"
alias gco="git checkout"
alias zdit="$EDITOR /root/.zshrc"
alias zsource="source /root/.zshrc"

# CUSTOM THEME

autoload -Uz vcs_info
precmd() {
	vcs_info
}

setopt PROMPT_SUBST


zstyle ':vcs_info:git:*' formats '%F{blue}(%F{red}%b%F{blue})%f'

# container mode
# PROMPT_PREFFIX_USER='%B%F{green}[%n:📦]%f%b'
PROMPT_PREFFIX_USER='%B%F{green}[%n:🍣]%f%b'
PROMPT_PREFFIX_ERR='%B%F{red}[%n:❌]%f%b'

PROMPT_PREFFIX="%B%(?.${PROMPT_PREFFIX_USER}%F{green}.${PROMPT_PREFFIX_ERR}%F{red})%f%b"

PROMPT_PATH='%B%F{cyan}%c%f%b'
PROMPT_GIT_BRANCH="%B${vcs_info_msg_0_}%b"

# user mode
PROMPT='$PROMPT_PREFFIX $PROMPT_PATH $PROMPT_GIT_BRANCH '

# FINAL

echo '
 ____
< Hello! >
 ----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
'

