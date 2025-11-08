if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Colors
set -g fish_color_cwd cyan
set -g fish_color_git_dirty red
set -g fish_color_git_clean green

# Git configs fish_git_prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_color_branch yellow
set -g __fish_git_prompt_char_dirtystate '✗'
set -g __fish_git_prompt_char_cleanstate ''

# Prompt
function fish_prompt
    set current_dir (pwd)

    if test "$current_dir" = "$HOME"
        set dir "~"
    else
        set dir (basename $current_dir)
    end

    # Diretório em bold
    set_color --bold $fish_color_cwd
    echo -n " "
    echo -n $dir

    # Git
    set git_prompt (fish_git_prompt "%s")

    if test -n "$git_prompt"
        set_color --bold magenta
        echo -n " git:("
        set_color --bold normal
        echo -n $git_prompt
        set_color --bold magenta
        echo -n ")"
    end

    # Símbolo >
    set_color --bold green
    echo -n " > "
    set_color normal
end

alias l="la -la"
alias gst="git status"
alias gco="git checkout"
alias vi="nvim"

