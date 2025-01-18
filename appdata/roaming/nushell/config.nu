$env.config = {
  show_banner: false
  buffer_editor: "nvim"
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

alias nv = nvim

alias dotfiles = git --git-dir=.dotfiles --work-tree=./
alias df = dotfiles

def cdnv [dir] {
  cd $dir
  nv
}

print ((ansi light_magenta) + '
     ╱|、   ?
    (˚ˎ。7
    |  ˜〵
    じしˍ)ノ
')
