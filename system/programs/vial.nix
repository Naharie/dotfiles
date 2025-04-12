{ pkgs
, ...
}:

let mur = import ../../packages { inherit pkgs; }; in

{
  environment.systemPackages = with pkgs; [
    vial
  ];

  services.udev.packages = [ mur.vial-udev ];
}