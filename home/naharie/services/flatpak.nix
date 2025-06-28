{ pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [ flatpak ];
  imports = [ inputs.nix-flatpaks.homeModule ];

  services.flatpak = {
    enable = true;
    remotes = {
      flathub = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      flathub-beta = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
    };
  };
}