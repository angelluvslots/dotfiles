{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  nixpkgs.config.allowUnfree = true;

  programs.light.enable = true;
  programs.nix-ld.enable = true;

  services.thermald.enable = true;

  programs.steam = {
    gamescopeSession.enable = true;
    enable = true;
  };
  programs.gamemode.enable = true;

  services.flatpak.enable = true;

  programs.spicetify = {
    enable = true;
    alwaysEnableDevTools = true;
    experimentalFeatures = true;
    windowManagerPatch = true;
    enabledExtensions = with spicePkgs.extensions; [
      addToQueueTop
      beautifulLyrics
    ];
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
    itch
    # Added automatically by spicetify
    # spotify

    # Steam

    # Cli
    git
    github-cli
    jq
    fish
    starship
    fd
    neovim
    yazi
    zsh
    gnumake
    du-dust
    cava
    bat
    nushell
    watchexec
    p7zip
    unzip
    valgrind
    wget
    htop
    # nvtopPackages.nvidia
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
    neofetch
    lshw

    # Language
    gleam
    rustup
    luajit
    zig
    gcc
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
