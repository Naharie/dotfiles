{ pkgs
, ...
}:

{  
  #services.flatpak.packages = [ "flathub:app/org.prismlauncher.PrismLauncher//stable" ];
  home.packages = with pkgs; [ prismlauncher ];
}