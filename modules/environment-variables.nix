{ pkgs, ... }:

let mur = import ../packages { inherit pkgs; }; in
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
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";

    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${mur.proton-ge}";
  };
}
