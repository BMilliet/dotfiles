# Globals
set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx WORKSPACE ~/workspace
set -gx TMUX_DEFAULT_SESSION "⚡️"

# Alias
alias cat="bat"
alias vi="nvim"
alias vim="nvim"
alias l="ls -la"
alias gst="git status"
alias gco="git checkout"
alias lz="lazygit"

alias tdev="tmux new -s $TMUX_DEFAULT_SESSION"
alias tnew="tmux new-window -t $TMUX_DEFAULT_SESSION"
alias tnext="tmux next-window"
alias tprev="tmux previous-window"
alias tkill="tmux kill-window"
alias tsplit="tmux split-window -h"
alias tsw="tmux select-pane -L"
alias tls="tmux ls"

alias add_custom="nvim ~/.config/dotfiles/zsh_custom.sh"

# Colors
set -g fish_color_cwd cyan
set -g fish_color_git_dirty red
set -g fish_color_git_clean green

# Brew
if test -d /opt/homebrew/bin
    set_color green
    echo "🍺 brew loaded"
    set_color normal
    fish_add_path /opt/homebrew/bin
end

# Custom config
if test -f ~/.config/dotfiles/fish/custom.fish
    set_color green
    echo "⚙️ custom config loaded"
    set_color normal
    source ~/.config/dotfiles/fish/custom.fish
end

if test -f ~/.config/dotfiles/fish/color.fish
    set_color green
    echo "🎨 color theme loaded"
    set_color normal
    source ~/.config/dotfiles/fish/color.fish
end

# Git configs fish_git_prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_char_dirtystate '✗'
set -g __fish_git_prompt_char_cleanstate ''
set -g __fish_git_prompt_showcolorhints 1

# Git colors
set -g __fish_git_prompt_color_branch red
set -g __fish_git_prompt_color_dirtystate yellow

# Prompt
function fish_prompt

    set -l last_status $status
    set current_dir (pwd)

    if test "$current_dir" = "$HOME"
        set dir "~"
    else
        set dir (basename $current_dir)
    end

    set_color --bold $fish_color_cwd
    echo -n " "
    echo -n $dir

    # Git
    set git_prompt (fish_git_prompt "%s")

    if test -n "$git_prompt"
        set_color --bold blue
        echo -n " git:("
        set_color --bold yellow
        echo -n $git_prompt
        set_color --bold blue
        echo -n ")"
    end

    if test $last_status -ne 0
        set_color --bold red
    else
        set_color --bold green
    end

    echo -n " > "
    set_color normal
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end


#### ALIAS / FUNC

function docs
    $EDITOR ~/.my_docs
end

function work
    cd $WORKSPACE
end

function zso
    source ~/.config/fish/config.fish
end

function nconfig
    cd ~/.config/nvim
    nvim
end

function dotconfig
    cd ~/.config/dotfiles
    nvim
end

function add_custom
    nvim ~/.config/dotfiles/fish_custom.fish
end

function swift_init
    swift package init --type executable
end

#### FZF

function handle_search
    set result $argv[1]

    if test -n "$result"
        if test -d "$result"
            cd "$result"
        else if test -f "$result"
            $EDITOR "$result"
        else
            set_color red
            echo "Error: Not a directory or file."
            set_color normal
        end
    else
        set_color red
        echo "Error: No result provided."
        set_color normal
    end
end

function psf
    set result (find "$WORKSPACE" \( -name .git -o -name .build \) -prune -o -print | fzf)
    handle_search $result
end

function sf
    set result (find . \( -name .git -o -name .build \) -prune -o -print | fzf)
    handle_search $result
end

#### HELP

function zhelp
    echo ""
    set_color blue
    echo "#############################"
    set_color normal
    echo ""

    set_color magenta
    echo " 🚀 helpers:"
    set_color normal
    echo "  docs       - Open personal documents with $EDITOR"
    echo "  work       - Go to the workspace directory ($WORKSPACE)"
    echo "  zso        - Reload the fish config file"
    echo "  nconfig    - Open Neovim configuration"
    echo "  dotconfig  - Open dotfiles configuration"
    echo ""

    set_color magenta
    echo " ⚡️ tmux:"
    set_color normal
    echo "  tdev       - New session"
    echo "  tnew       - New window"
    echo "  tnext      - Next window"
    echo "  tprev      - Previous window"
    echo "  tkill      - Kill current window"
    echo "  tsplit     - Split current window (vertical)"
    echo "  tsw        - Switch panel"
    echo "  tls        - List sessions"
    echo ""

    set_color magenta
    echo " 🔎 fzf:"
    set_color normal
    echo "  psf        - Search for files in the ($WORKSPACE)"
    echo "  sf         - Search for files in the current directory"
    echo ""
    set_color blue
    echo "#############################"
    set_color normal
    echo ""
end

#### CUSTOM (Boas-vindas)

function fish_greeting
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
end

# Auto attach or create tmux session
if type -q tmux
    # dont attach if its in session
    if test -n "$TMUX"
        return
    end

    if tmux has-session -t $TMUX_DEFAULT_SESSION 2>/dev/null
        tmux attach-session -t $TMUX_DEFAULT_SESSION
    else
        tdev
    end
end

