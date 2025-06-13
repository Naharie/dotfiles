{ pkgs
, inputs
, ...
}:

let mur = inputs.self.packages.${pkgs.system}; in

{  
  services.udev.packages = [ mur.nxdumptool-udev ];
}