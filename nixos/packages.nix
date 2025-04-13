{ inputs, pkgs, ... }:

let
  # spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  # spicetify = inputs.spicetify-nix.lib.mkSpicetify pkgs {
    # enable = true;
    # theme = spicePkgs.themes.Gruvbox;
  # };
in
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.light.enable = true;
  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    ghostty
    obsidian
    discord
    spotify
    steam
    inputs.zen-browser.packages."${system}".default
    # just in case i can't use zen for something
    chromium
    # spicetify

    # Cli
    git
    github-cli
    neovim
    yazi
    gnumake
    nushell
    watchexec
    p7zip
    unzip
    valgrind
    glib
    wget
    ffmpeg
    wl-clipboard
    wtype
    zoxide
    ripgrep
    fzf
    docker
    neofetch
    lshw

    # Language
    gleam
    rustup
    lua
    luajit
    gcc
    libclang
    python3

    # Hyprland
    kitty
    waybar
    hyprpaper
    hyprcursor
    catppuccin-cursors.mochaMauve
    rofi-wayland
    rofimoji
  ];

  # OLD WAY
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #   jetbrains-mono
  # ];
  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
