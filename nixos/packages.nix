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

  programs.spicetify = {
    enable = true;
    alwaysEnableDevTools = true;
    experimentalFeatures = true;
    windowManagerPatch = true;
    enabledExtensions = with spicePkgs.extensions; [
      keyboardShortcut
      powerBar
      addToQueueTop
      beautifulLyrics
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
    # spotify

    # Steam
    protonup

    # Cli
    git
    github-cli
    neovim
    yazi
    gnumake
    bat
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
