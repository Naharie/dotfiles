{ lib
, inputs
, ...
}:

{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    XDG_DATA_DIRS = "$HOME/.local/share/flatpak/exports/share";

    PATH = [ "${XDG_BIN_HOME}" ];

    GTK_USE_PORTAL = "1";

    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  environment.extraInit = lib.concatMapStringsSep "\n" (user: let
    homedir = inputs.self.config.users.users.${user}.home;
  in ''
    if [ "$(id -un)" = "${user}" ]; then
      . "${homedir}/.nix-profile/etc/profile.d/hm-session-vars.sh"
    fi
  '') ["user1" "user2"];
}
