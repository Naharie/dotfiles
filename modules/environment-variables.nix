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
      "$HOME/.dotnet/tools"
    ];

    EDITOR="code --wait";

    GTK_USE_PORTAL = "1";
    
    # Wayland support in Electron apps
    #NIXOS_OZONE_WL = "1";
    #MOZ_ENABLE_WAYLAND = "1";

    LIBVA_DRIVER_NAME = "nvidia";
    #XDG_SESSION_TYPE = "wayland";
    #GBM_BACKEND = "nvidia-drm";
    #__GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #WLR_NO_HARDWARE_CURSORS = "1";
  };
}
