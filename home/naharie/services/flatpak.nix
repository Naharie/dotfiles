{ pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [ flatpak ];
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    update.onActivation = false;
    uninstallUnmanaged = true;
    uninstallUnused = true; # Not needed as long as uninstallUnmanaged is true, but I like to be explicit
  };
}