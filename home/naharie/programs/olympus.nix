{
  pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [ flatpak ];

  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.everestapi.Olympus"
    ];
    update.onActivation = true;
  };
}