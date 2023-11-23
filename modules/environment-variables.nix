{ ... }:

{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];

    LIBVA_DRIVER_NAME = "vdpau";
    GTK_USE_PORTAL = "1";
    
    # Wayland support in Electron apps
    NIXOS_OZONE_WL = "1";

    EDITOR="codium --wait";
  };
}