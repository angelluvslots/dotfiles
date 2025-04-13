$env.config = {
  show_banner: false
  edit_mode: 'vi'
}

alias df = git --git-dir=($env.HOME)/.dotfiles/ --work-tree=($env.HOME)
alias rb = sudo nixos-rebuild switch --flake /home/angel/nixos#angel
alias nv = nvim
alias yz = yazi

def --env y [...args] {
  let tmp = (mktemp -t "yazi-cwd.XXXXXX")
  yazi ...$args --cwd-file $tmp
  let cwd = (open $tmp)
  if $cwd != "" and $cwd != $env.PWD {
    cd $cwd
  }
  rm -fp $tmp
}

source ~/.zoxide.nu
