{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    virtualboxWithExtpack
    linuxKernel.packages.linux_zen.virtualbox
  ];
}