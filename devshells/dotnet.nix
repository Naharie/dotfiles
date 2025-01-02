{ pkgs
, ...
}:

{
  packages = with pkgs; [
    dotnetCorePackages.sdk_9_0
  ];
}