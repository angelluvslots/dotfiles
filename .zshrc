alias rb="sudo nixos-rebuild switch --flake $HOME/nixos#angel"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias nv="nvim"
alias c="clear && neofetch"
alias zf="z (zoxide query -l | fzf)"
alias zfc="zf && c"
alias ls="ls -a"
alias sp="spotify_player"

c

function mxlrc() {
  local tmp=$PWD
  builtin cd ~/mxlrc.py
  rm ~/mxlrc.py/.token
  nix-shell --run "python mxlrc.py -l $1"
  builtin cd $tmp
}

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
  	builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
