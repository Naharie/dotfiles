{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    virtualbox
    linuxKernel.packages.linux_zen.virtualbox
  ];
}