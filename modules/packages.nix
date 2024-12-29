{ pkgs, ... }:

let vur = import ../packages { inherit pkgs; }; in
{
    environment.systemPackages = with pkgs; [
        # Desktop Environment
        kdePackages.xdg-desktop-portal-kde
        
        # Internet
        brave

        # Gaming
        vur.proton-ge
        steam-run

        # Hardware
        ckb-next 
    ];

    services.flatpak.enable = true;
    services.flatpak.packages = [
        "io.github.everestapi.Olympus"
        "us.zoom.Zoom"
    ];
    services.flatpak.update.onActivation = true;

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
    };

    programs.command-not-found.enable = false;
    programs.nix-index-database.comma.enable = true;

    programs.nix-index.enable = true;
    programs.nix-index.enableBashIntegration = true;

    services.dbus.enable = true;
}
