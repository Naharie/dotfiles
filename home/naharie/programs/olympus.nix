{
  pkgs
, ...
}:

{
  home.packages = with pkgs; [ flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.everestapi.Olympus"
    ];
    update.onActivation = true;
  };
}