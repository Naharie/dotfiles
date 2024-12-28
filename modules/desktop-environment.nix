{ ... }:

{
    services.xserver = {
        enable = true;
        xkb = { layout = "us"; variant = ""; };
    };

    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
    };
    services.desktopManager.plasma6.enable = true;

    services.libinput.enable = true;
}