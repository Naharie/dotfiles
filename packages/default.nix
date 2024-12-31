{ pkgs
}:

{
  proton-ge = pkgs.callPackage ./proton-ge.nix { };

  arcaurora-cursors = pkgs.callPackage ./arcaurora-cursors.nix { };
  andromeda-theme = pkgs.callPackage ./andromeda-theme.nix { };
}
