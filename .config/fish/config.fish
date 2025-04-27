if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

set fish_greeting

alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias rb="sudo nixos-rebuild switch --flake $HOME/nixos#angel"
alias nv="nvim"
alias lsa="ls -a"

zoxide init fish | source
