export CTP_ROSEWATER="#f5e0dc"
export CTP_FLAMINGO="#f2cdcd"

export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_DEFAULT_OPTS="
  --style=full
  --color=16
  --color=border:4,fg:7,hl:$CTP_FLAMINGO
  --color=bg+:-1,fg+:-1,hl+:$CTP_ROSEWATER
  --color=pointer:$CTP_ROSEWATER"

alias rb="sudo nixos-rebuild switch --flake $HOME/nixos#angel"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias ls="ls -a"
alias sp="spotify_player"
alias we="watchexec -c clear"

function nv() {
  nvim ${@:-.}
}

function d() {
  cd ${1:-$HOME}
  builtin cd $(find . -type d | fzf --scheme=path)
}

alias dnv="d; nvim"

function f() {
  $@ $(fzf)
}

function c() {
  clear
  neofetch
  $@
}

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

c

eval "$(starship init zsh)"
