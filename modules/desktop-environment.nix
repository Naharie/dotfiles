{ ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable touchpad support (enabled by default in most desktops).
  services.libinput.enable = true;

  # Hyprland

  programs.hyprland = {
    enable = false;
    xwayland.enable = true;
  };
}
