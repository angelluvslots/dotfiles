$env.config = {
  show_banner: false
  edit_mode: 'vi'
}

alias df = git --git-dir=($env.HOME)/.dotfiles/ --work-tree=($env.HOME)
alias rb = sudo nixos-rebuild switch --flake /home/angel/nixos#angel
alias nv = nvim
alias yz = yazi

source ~/.zoxide.nu
