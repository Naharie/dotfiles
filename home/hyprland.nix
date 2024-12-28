{ inputs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;

        settings = {
            "$mod" = "SUPER";

            bind =
            [
                "$mod, Z, exec, flatpak run io.github.zen_browser.zen"
                "$mod, T, exec, konsole"
            ]
            ++ (
                # workspaces
                # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
                builtins.concatLists (builtins.genList (
                    x:
                        let ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
                        in [
                            "$mod, ${ws}, workspace, ${toString (x + 1)}"
                            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
                        ]
                )
                10)
            );

            bindel = [
                ", PageUp, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ", PageDown, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ];
        };
    };
    }