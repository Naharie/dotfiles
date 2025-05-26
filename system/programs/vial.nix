{ pkgs
, inputs
, ...
}:

let mur = inputs.self.packages.${pkgs.system}; in

{
  environment.systemPackages = with pkgs; [
    vial
  ];

  services.udev.packages = [ mur.vial-udev ];
}