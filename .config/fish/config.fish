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

fish_vi_key_bindings
set fish_greeting

alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias rb="sudo nixos-rebuild switch --flake $HOME/nixos#angel"
alias nv="nvim"
alias lsa="ls -a"
alias cnf="clear && neofetch"

function starship_transient_prompt_func
  starship module custom.last
end

starship init fish | source
enable_transience
zoxide init fish | source

neofetch
