{ inputs, system, ... }:

let pkgs = inputs.nixpkgs.legacyPackages.${system};
in
{
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;
    imports = [
        #hyprland-nix.homeManagerModules.default
    ];

    programs.git = {
        enable = true;
        userName  = "Naharie";
        userEmail = "oneofthosewhoescaped@gmail.com";
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            ls = "eza";
            cat = "bat";
        };
    };

    #home.pointerCursor = {
    #    gtk.enable = true;
    #    # x11.enable = true;
    #    package = pkgs.kdePackages.breeze;
    #    name = "Breeze";
    #    size = 16;
    #};

    #gtk = {
    #    enable = true;

    #    theme = {
    #        name = "Breeze";
    #    };

    #    iconTheme = {
    #        name = "Papirus-Teal-Core";
    #    };

    #    font = {
    #        name = "Noto Sans";
    #        size = 10;
    #    };
    #};


    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            "$mod" = "SUPER";
            bind =
            [
                "$mod, F, exec, firefox"
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
        };
    };
}