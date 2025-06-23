{
  ...
}:

let homeManagerSessionVars = "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"; in
{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";

    PATH = [ "${XDG_BIN_HOME}" ];

    GTK_USE_PORTAL = "1";

    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  environment.extraInit = "[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}";
}
