{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable wayland with gdm
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11

  services.xserver = {
    xkb.layout = "us,latam";
    xkb.variant = "";
    xkb.options = "grp:caps_toggle";
    exportConfiguration = true;
  };

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware = {
    graphics.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      prime = {
        offload.enable = false;
        offload.enableOffloadCmd = false;
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
