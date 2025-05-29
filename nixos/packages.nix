{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
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

  services.flatpak.enable = true;

  programs.spicetify = {
    enable = false;
    alwaysEnableDevTools = true;
    experimentalFeatures = true;
    windowManagerPatch = true;
    enabledExtensions = with spicePkgs.extensions; [
      # keyboardShortcut
      # powerBar
      # addToQueueTop
      # beautifulLyrics
    ];
    # theme = spicePkgs.themes.defaultDynamic;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/angel/.steam/root/compatibilitytools.d";
  };

  environment.systemPackages = with pkgs; [
    ghostty
    obsidian
    discord
    modrinth-app
    inputs.zen-browser.packages."${system}".default
    bitwarden
    chromium
    # Added automatically by spicetify
    spotify

    # Steam
    protonup

    # Cli
    git
    jq
    fish
    starship
    wineWowPackages.full
    fd
    github-cli
    spotify-player
    neovim
    yazi
    zsh
    gnumake
    alsa-utils
    cava
    curlFull.dev
    bat
    sdl3
    nushell
    watchexec
    p7zip
    unzip
    valgrind
    glib
    wget
    htop
    nvtopPackages.nvidia
    ffmpeg
    # i wish i didn't have to install this *spits cmake because it fucking
    # sucks, fuck you cmake*
    cmake
    meson
    pkg-config
    wl-clipboard
    wtype
    zoxide
    ripgrep
    fzf
    docker
    neofetch
    lshw
    sdl3

    # Language
    gleam
    rustup
    lua
    luajit
    zig
    gcc
    libclang
    typst
    python3
    python312Packages.pip

    # Hyprland
    kitty
    waybar
    hyprpaper
    hyprshot
    hyprlock
    mako
    hyprcursor
    playerctl
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
