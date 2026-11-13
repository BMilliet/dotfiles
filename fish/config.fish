# Globals
set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx WORKSPACE ~/workspace

# Alias
alias cat="bat"
alias vi="nvim"
alias vim="nvim"
alias l="ls -la"
alias gst="git status"
alias gco="git checkout"
alias lz="lazygit"
alias brew_upgrade="brew update && brew upgrade"

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


#### ALIAS / FUNC

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

### custom interactive pwd
function pwdc --description 'Print the current directory and copy it to the clipboard'
    set -l path (builtin pwd)

    if test "$path" = "$HOME"
        set path '~'
    else if string match -q "$HOME/*" -- "$path"
        set path (string replace "$HOME/" '~/' -- "$path")
    end

    echo $path
    printf '%s' "$path" | pbcopy
end

# Abbreviations are expanded only in the interactive command line. This keeps
# scripts, tools, command substitutions, and the prompt itself on the builtin pwd.
abbr --add --position command pwd pwdc

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

