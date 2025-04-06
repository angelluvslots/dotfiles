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

  environment.systemPackages = with pkgs; [
    ghostty
    obsidian
    discord
    spotify
    # spicetify
    inputs.zen-browser.packages."${system}".default

    # Cli
    git
    github-cli
    neovim
    yazi
    gnumake
    nushell
    p7zip
    ffmpeg
    xclip
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
    python3

    # Hyprland
    kitty
    waybar
    hyprpaper
    rofi-wayland
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
