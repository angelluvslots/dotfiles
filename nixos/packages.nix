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

  programs.steam = {
    gamescopeSession.enable = true;
    enable = true;
  };
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/angel/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    ghostty
    obsidian
    discord
    spotify
    inputs.zen-browser.packages."${system}".default
    bitwarden
    # just in case i can't use zen for something
    chromium
    # spicetify

    # Steam
    protonup

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
    # i wish i didn't have to install this *spits cmake because it fucking
    # sucks, fuck you cmake*
    cmake
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
    hyprshot
    mako
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
