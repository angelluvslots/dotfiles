{ config, pkgs, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./display.nix
    inputs.spicetify-nix.nixosModules.spicetify
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "angel"; # Define your hostname.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "ghostty";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = { LC_ADDRESS = "en_US.UTF-8"; LC_IDENTIFICATION = 
    "en_US.UTF-8"; LC_MEASUREMENT = "en_US.UTF-8"; LC_MONETARY = "en_US.UTF-8"; 
    LC_NAME = "en_US.UTF-8"; LC_NUMERIC = "en_US.UTF-8"; LC_PAPER = 
    "en_US.UTF-8"; LC_TELEPHONE = "en_US.UTF-8"; LC_TIME = "en_US.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false; security.rtkit.enable = true; 
  services.pipewire = {
    enable = true; alsa.enable = true; alsa.support32Bit = true; pulse.enable = 
    true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.angel = {
    isNormalUser = true;
    description = "angel";
    extraGroups = [ "networkmanager" "wheel" ]; packages = with pkgs; [
    ];
  };

  # Don't require password for sudo
  security.sudo.wheelNeedsPassword = false;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true; 
  services.displayManager.autoLogin.user = "angel";

  # Workaround for GNOME autologin: 
  # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false; 
  systemd.services."autovt@tty1".enable = false;

  system.stateVersion = "24.11"; # Did you read the comment?
}
