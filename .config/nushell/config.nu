$env.config = {
  show_banner: false
  edit_mode: 'vi'
}

print $"(ansi magenta_bold)~ no programming until ~(ansi green)
  - all school is DONE
  - you've done art
  - you've exercised"

alias dot = git --git-dir=($env.HOME)/.dotfiles/ --work-tree=($env.HOME)
alias rb = sudo nixos-rebuild switch --flake /home/angel/nixos#angel
alias nv = nvim
alias lsa = ls -a

def fnv [] {
  let p = fzf
  nv $p
}

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
